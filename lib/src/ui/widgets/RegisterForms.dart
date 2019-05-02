import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/src/bloc/register/RegisterBloc.dart';
import 'package:keeper/src/bloc/register/RegisterEvent.dart';
import 'package:keeper/src/bloc/register/RegisterState.dart';
import 'package:keeper/src/resources/repository/UserRepository.dart';
import 'package:keeper/src/ui/widgets/LoadingIndicator.dart';

import 'package:keeper/src/ui/widgets/RegisterForm.dart';

class RegisterForms extends StatefulWidget {
  final TextEditingController companyNameController;
  final TextEditingController companyEmailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController locationController;

  RegisterForms({
    @required this.companyNameController,
    @required this.companyEmailController,
    @required this.passwordController,
    @required this.confirmPasswordController,
    @required this.locationController,
  })  : assert(companyNameController != null),
        assert(companyEmailController != null),
        assert(passwordController != null),
        assert(confirmPasswordController != null),
        assert(locationController != null);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForms> {
  TextEditingController get _companyNameController =>
      widget.companyNameController;
  TextEditingController get _companyEmailController =>
      widget.companyEmailController;
  TextEditingController get _passwordController => widget.passwordController;
  TextEditingController get _confirmPasswordController =>
      widget.confirmPasswordController;
  TextEditingController get _locationController => widget.locationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      child: Container(
        child: Column(
          children: <Widget>[
            RegisterForm(
              label: 'Company Name',
              controller: _companyNameController,
            ),
            RegisterForm(
              label: 'Company Email',
              controller: _companyEmailController,
            ),
            RegisterForm(
              label: 'Password',
              controller: _passwordController,
              secure: true,
            ),
            RegisterForm(
              label: 'Confirm Password',
              controller: _confirmPasswordController,
              secure: true,
            ),
            RegisterForm(
              label: 'Location',
              controller: _locationController,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      text: 'By signing up you agree to Keeper\'s',
                      children: [
                        TextSpan(
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          text: ' Term of Use ',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Term of Use tap');
                            },
                        ),
                        TextSpan(text: 'and'),
                        TextSpan(
                          text: ' Privacy Policy ',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                            text:
                                '. You also agree to receive subsequent email and third-party communications, which you may opt out at any time')
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  // void _onRegisterButtonPressed() {
  //   print('_onRegisterButtonPressed');
  //   _registerBloc.dispatch(RegisterButtonPressed(
  //       companyName: _companyNameController.text,
  //       companyEmail: _companyEmailController.text,
  //       password: _passwordController.text,
  //       confirmPassword: _confirmPasswordController.text,
  //       location: _locationController.text));
  // }
}
