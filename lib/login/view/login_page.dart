import 'package:authentication_repository/authentication_repository.dart';
import 'package:family_tree/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:family_tree/login/login.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocProvider(
          create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
          child: Align(
            alignment: const Alignment(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _LoginPageHeader(),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginPageHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(child: Image.asset('assets/bloc_logo_small.png', height: 60)),
        const Text(
          'Family Tree',
          style: TextStyle(
            fontFamily: 'HangingTree',
            fontSize: 60,
            color: Colors.brown,
          ),
        )
      ]),
    );
  }
}
