import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:family_tree/authentication/authentication.dart';
import 'package:family_tree/profile/profile.dart';

class ProfilePage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Avatar(photo: user.photo),
            const SizedBox(height: 4.0),
            Text(user.email, style: textTheme.headline6),
            const SizedBox(height: 4.0),
            Text(user.name ?? '', style: textTheme.headline5),
          ],
        ),
      ),
    );
  }
}
