import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  RegisterEvent([List props = const []]) : super(props);
}

class RegisterButtonPressed extends RegisterEvent {
  final String companyName;
  final String companyEmail;
  final String password;
  final String confirmPassword;
  final String location;
  RegisterButtonPressed(
      {this.companyName,
      this.companyEmail,
      this.password,
      this.confirmPassword,
      this.location});
  @override
  String toString() {
    return 'RegisterEvent: companyName= ' +
        companyName +
        ',companyEmail = ' +
        companyEmail +
        ',pasword = ' +
        password +
        ',confirmpasword = ' +
        confirmPassword +
        ',location = ' +
        location;
  }
}
