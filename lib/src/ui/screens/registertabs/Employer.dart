import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:keeper/src/bloc/register/RegisterBloc.dart';
import 'package:keeper/src/bloc/register/RegisterEvent.dart';
import 'package:keeper/src/bloc/register/RegisterState.dart';
import 'package:keeper/src/resources/repository/UserRepository.dart';
import 'package:keeper/src/ui/widgets/LoadingIndicator.dart';
import 'package:keeper/src/ui/widgets/RegisterForms.dart';

class Employer extends StatefulWidget {
  @override
  _EmployerState createState() => _EmployerState();
}

class _EmployerState extends State<Employer> {
  UserRepository userRepository;
  RegisterBloc registerBloc;
  TextEditingController companyNameController;
  TextEditingController companyEmailController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;
  TextEditingController locationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Injector injector = Injector.appInstance;

    userRepository = injector.getDependency<UserRepository>();
    registerBloc = BlocProvider.of<RegisterBloc>(context);

    companyNameController = TextEditingController(text: 'Company');
    companyEmailController = TextEditingController(text: 'email@abc.com');
    passwordController = TextEditingController(text: 'password');
    confirmPasswordController = TextEditingController(text: 'password');
    locationController = TextEditingController(text: 'location');
  }

  _onRegisterButtonPressed() {
    registerBloc.dispatch(RegisterButtonPressed(
        companyName: companyNameController.text,
        companyEmail: companyEmailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        location: locationController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: registerBloc,
      listener: (BuildContext context, RegisterState state) {
        if (state is RegisterSuccess) {
          Navigator.pushReplacementNamed(context, '/howto1');
        }
      },
      child: BlocBuilder(
          bloc: registerBloc,
          builder: (_, RegisterState state) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: ListView(
                children: <Widget>[
                  RegisterForms(
                      companyNameController: companyNameController,
                      companyEmailController: companyEmailController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                      locationController: locationController),
                  state is RegisterLoading
                      ? LoadingIndicator()
                      : RaisedButton(
                          textColor: Colors.white,
                          onPressed: _onRegisterButtonPressed,
                          child: Text('CREATE ACCOUNT'),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                ],
              ),
            );
          }),
    );
  }
}
