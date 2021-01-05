import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:family_tree/authentication/authentication.dart';
import 'package:family_tree/home/home.dart' as home;
import 'package:family_tree/person/person.dart' as person;
import 'package:family_tree/profile/profile.dart' as profile;

import 'package:fab_circular_menu/fab_circular_menu.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    // final user = context.select((AuthenticationBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Family Tree'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_profile_iconButton'),
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(profile.ProfilePage.route());
            },
          ),
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context
                .read<AuthenticationBloc>()
                .add(AuthenticationLogoutRequested()),
          )
        ],
      ),
      floatingActionButton: FabCircularMenu(
        key: fabKey,
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.linear,
        ringColor: Theme.of(context).primaryColor.withAlpha(90),
        ringDiameter: 350,
        ringWidth: 100,
        children: [
          home.FabCircularMenuButtom(
            icon: Icons.share,
            label: 'Share\nTree',
            onTap: () {},
          ),
          home.FabCircularMenuButtom(
            icon: Icons.share,
            label: 'Share\nTree',
            onTap: () {},
          ),
          home.FabCircularMenuButtom(
            icon: Icons.person_add,
            label: 'Add\nPerson',
            onTap: () {
              fabKey.currentState.close();
              Navigator.of(context).push(person.PersonPage.route());
            },
          ),
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Avatar(photo: user.photo),
            // const SizedBox(height: 4.0),
            // Text(user.email, style: textTheme.headline6),
            // const SizedBox(height: 4.0),
            // Text(user.name ?? '', style: textTheme.headline5),
          ],
        ),
      ),
    );
  }
}
