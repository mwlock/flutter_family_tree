import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:database_repository/database_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:family_tree/app.dart';
import 'package:family_tree/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();
  final authenticationRepository = AuthenticationRepository();
  final dataBaseRepository = DataBaseRepository(
    authenticationRepository: authenticationRepository,
  );
  runApp(App(
    authenticationRepository: authenticationRepository,
    dataBaseRepository: dataBaseRepository,
  ));
}
