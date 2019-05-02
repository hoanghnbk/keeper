import 'dart:async';

import 'package:keeper/src/bloc/auth/AuthBloc.dart';
import 'package:keeper/src/bloc/auth/AuthEvent.dart';
import 'package:keeper/src/bloc/login/LoginEvent.dart';
import 'package:keeper/src/bloc/login/LoginState.dart';
import 'package:keeper/src/resources/repository/UserRepository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    // TODO: implement mapEventToState
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );
        print('token ' + token);
        authenticationBloc.dispatch(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
