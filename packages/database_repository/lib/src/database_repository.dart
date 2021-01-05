import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:authentication_repository/authentication_repository.dart';
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

  /// Insets a new user into FireStore using information provided by the authentification package.
  ///
  /// Throws an [InsertFailure] if an exception occurs.
  Future<void> insertUser(
      {@required AuthModel.User user, @required String uid}) async {
    assert(user != AuthModel.User.empty);
    assert(user != null);
    try {
      print('====================Adding to database=====================');
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
