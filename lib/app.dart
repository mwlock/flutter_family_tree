import 'package:authentication_repository/authentication_repository.dart';
import 'package:database_repository/database_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:family_tree/authentication/authentication.dart';
import 'package:family_tree/home/home.dart';
import 'package:family_tree/login/login.dart';
import 'package:family_tree/splash/splash.dart';
import 'package:family_tree/theme.dart';

class App extends StatelessWidget {
  const App(
      {Key key,
      @required this.authenticationRepository,
      this.dataBaseRepository})
      : assert(authenticationRepository != null),
        super(key: key);

  final AuthenticationRepository authenticationRepository;
  final DataBaseRepository dataBaseRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
          create: (_) => authenticationRepository,
        ),
        RepositoryProvider<DataBaseRepository>(
          create: (_) => dataBaseRepository,
        ),
      ],
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
        ),
        child: AppView(),
      ),
    );
    // return RepositoryProvider.value(
    //   value: authenticationRepository,
    //   child: BlocProvider(
    //     create: (_) => AuthenticationBloc(
    //       authenticationRepository: authenticationRepository,
    //     ),
    //     child: AppView(),
    //   ),
    // );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      navigatorKey: _navigatorKey,
      routes: {},
      builder: (context, child) {
        // blocListener is a Flutter widget which takes a BlocWidgetListener and an optional cubit and invokes the listener in response to state changes in the cubit.
        // should be used for functionality that needs to occur once per state change such as navigation, showing a SnackBar
        // is a void function
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
