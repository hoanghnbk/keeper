import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:keeper/src/bloc/auth/AuthBloc.dart';
import 'package:keeper/src/bloc/auth/AuthEvent.dart';
import 'package:keeper/src/bloc/auth/AuthState.dart';
import 'package:keeper/src/resources/repository/UserRepository.dart';
import 'package:keeper/src/services/routes.dart';
import 'package:keeper/src/ui/screens/Home.dart';
import 'package:keeper/src/ui/screens/Login.dart';
import 'package:keeper/src/ui/widgets/Spash.dart';
import 'package:keeper/src/ui/widgets/LoadingIndicator.dart';
import 'src/services/appSetting.dart';

Injector injector = Injector.appInstance;

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print(transition.toString());
  }
}

void main() {
  UserRepository userRepository = UserRepositoryImp();
  AuthenticationBloc authenticationBloc =
      AuthenticationBloc(userRepository: userRepository);
  injector.registerSingleton<UserRepository>((_) => userRepository);
  injector.registerSingleton<AuthenticationBloc>((_) => authenticationBloc);
  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(App(userRepository: userRepository));
}

class App extends StatefulWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AuthenticationBloc authenticationBloc;
  UserRepository get userRepository => widget.userRepository;

  @override
  void initState() {
    authenticationBloc = injector.getDependency<AuthenticationBloc>();
    authenticationBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  void dispose() {
    authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: authenticationBloc,
      child: MaterialApp(
        theme: getThemeApp(),
        home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
          bloc: authenticationBloc,
          builder: (context, AuthenticationState state) {
            if (state is AuthenticationUninitialized) {
              return SplashPage();
            }
            if (state is AuthenticationAuthenticated) {
              return HomePage();
            }
            if (state is AuthenticationUnauthenticated) {
              return LoginPage(userRepository: userRepository);
            }
            if (state is AuthenticationLoading) {
              return LoadingIndicator();
            }
          },
        ),
        onGenerateRoute: getRoute,
      ),
    );
  }
}
