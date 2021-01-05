import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:authentication_repository/authentication_repository.dart';
import 'package:database_repository/src/models/models.dart' as dataBaseModels;
import 'package:authentication_repository/src/models/models.dart' as AuthModel;
import 'package:meta/meta.dart';

import 'models/models.dart';

/// Thrown during the database insert process if a failure occurs.
class InsertFailure implements Exception {}

/// Thrown during the database insert process if a failure occurs due to loss in furebase_auth status.
class LoginStatusFailure implements Exception {}

/// {@template database_repository}
/// Repository which database requests.
/// {@endtemplate}
class DataBaseRepository {
  /// {@macro database_repository}
  DataBaseRepository({
    firestore.FirebaseFirestore firestoreDatabase,
    @required AuthenticationRepository authenticationRepository,
  })  
  // {
  //   this._authenticationRepository = authenticationRepository;
  //   this._firestoreDatabase = firestoreDatabase;
  //   print('========= DATABASE REPO CONSTRUCTOR');
  //   print(this.hashCode);
  // }
  : _firestoreDatabase =
            firestoreDatabase ?? firestore.FirebaseFirestore.instance,
        _authenticationRepository = authenticationRepository;

  firestore.FirebaseFirestore _firestoreDatabase;
  AuthenticationRepository _authenticationRepository;

  /// Stream of [FamilyTree] which will emit the current family tree when
  /// the database is changed.
  ///
  /// Emits [dataBaseModels.FamilyTree.empty] if the family tree does not exist.
  Stream<dataBaseModels.FamilyTree> get familyTree {
    return _firestoreDatabase
        .collection('family_trees')
        .doc('test')
        .snapshots()
        .map((query) {
      print("QUUUUUUUUUUUUUUEEEEEEEEERRRRRRRRTTTTTTTTTTTTY");
      return query == null
          ? dataBaseModels.FamilyTree(id: '', people: null)
          : query.toFamilyTree;
    });

    // return _firebaseAuth.authStateChanges().map((firebaseUser) {
    //   return firebaseUser == null ? User.empty : firebaseUser.toUser;
    // });
  }

  /// Insets a new user into FireStore using information provided by the authentification package.
  ///
  /// Throws an [InsertFailure] if an exception occurs.
  Future<void> insertUser(
      {@required AuthModel.User user, @required String uid}) async {
    assert(user != AuthModel.User.empty);
    assert(user != null);
    try {
      final users = _firestoreDatabase.collection('users');
      await users.doc(uid).set({
        'username': user.name,
        'email': user.email,
        'imageUrl': user.photo,
      });
    } on Exception {
      throw InsertFailure();
    }
  }
}

extension on firestore.DocumentSnapshot {
  dataBaseModels.FamilyTree get toFamilyTree {
    print("==========FAMILY TREE============");
    print(data());
    return dataBaseModels.FamilyTree.empty;
  }
}
