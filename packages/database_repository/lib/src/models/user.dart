import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}

class User extends Equatable {
  /// {@macro user}
  const User({
    @required this.email,
    @required this.uid,
    @required this.name,
    @required this.photoURL,
  })  : assert(email != null),
        assert(uid != null),
        assert(name != null);

  /// The user's email address.
  final String email;

  /// The user's uid as assigned by firebase.
  final String uid;

  /// The user's name (display name).
  final String name;

  /// Url for the user's photo stored in web storage.
  final String photoURL;

  /// Empty user which represents user not yet added to the database
  static const empty = User(email: '', uid: '', name: '', photoURL: null);

  @override
  List<Object> get props => [email, uid, name, photoURL];
}
