import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:keeper/src/resources/repository/UserRepository.dart';
import 'package:keeper/src/ui/screens/Home.dart';
import 'package:keeper/src/ui/screens/HowTo.dart';
import 'package:keeper/src/ui/screens/Login.dart';
import 'package:keeper/src/ui/screens/Register.dart';

Injector injector = Injector.appInstance;

Route getRoute(RouteSettings setting) {
  switch (setting.name) {
    case '/home':
      return _buildRoute(
          setting,
          LoginPage(
            userRepository: injector.getDependency<UserRepository>(),
          ));
    case '/register':
      return _buildRoute(setting, Register());
    case '/howto1':
      return _buildRoute(setting, HowTo());
    default:
      print('getRoute + ' + setting.name);
      return _buildRoute(setting, HomePage());
  }
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) => builder,
  );
}
