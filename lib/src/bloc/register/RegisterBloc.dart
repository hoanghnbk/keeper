import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keeper/src/bloc/auth/AuthBloc.dart';
import 'package:keeper/src/bloc/auth/AuthEvent.dart';
import 'package:keeper/src/bloc/register/RegisterEvent.dart';
import 'package:keeper/src/bloc/register/RegisterState.dart';
import 'package:keeper/src/resources/repository/UserRepository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository userRepository;
  AuthenticationBloc authenticationBloc;
  RegisterBloc(
      {@required this.userRepository, @required this.authenticationBloc});
  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    try {
      print(event is RegisterButtonPressed);
      if (event is RegisterButtonPressed) {
        await for (var event in _handleRegisterButtonPressedEvent(event)) {
          yield event;
          print('event');
        }
      }
    } catch (error) {
      yield RegisterFailure(error: error.toString());
    }
  }

  Stream<RegisterState> _handleRegisterButtonPressedEvent(
      RegisterButtonPressed event) async* {
    yield RegisterLoading();

    final token = await userRepository.registerNewCompany(
        companyName: event.companyName,
        companyEmail: event.companyEmail,
        password: event.password,
        location: event.location);
    print('token    ' + token);
    if (token == null) {
      throw NullThrownError();
    }
    authenticationBloc.dispatch(LoggedIn(token: token));
    yield RegisterSuccess();
  }
}
