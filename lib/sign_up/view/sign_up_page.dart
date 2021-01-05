import 'package:authentication_repository/authentication_repository.dart';
import 'package:database_repository/database_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:family_tree/sign_up/sign_up.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        // A Flutter widget which provides a cubit to its children
        child: BlocProvider<SignUpCubit>(
          // One time lookup, similar to "listen:false" for provider
          create: (_) => SignUpCubit(
            context.read<AuthenticationRepository>(),
            context.read<DataBaseRepository>(),
          ),
          child: SignUpForm(),
        ),
      ),
    );
  }
}
