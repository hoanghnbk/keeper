import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/src/bloc/auth/AuthBloc.dart';
import 'package:keeper/src/bloc/login/LoginBloc.dart';
import 'package:keeper/src/bloc/login/LoginEvent.dart';
import 'package:keeper/src/bloc/login/LoginState.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginForm({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginBloc get _loginBloc => widget.loginBloc;

  void _onLoginButtonPressed() {
    _loginBloc.dispatch(LoginButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }

  void _onRegisterButtonPressed() {
    Navigator.of(context).pushNamed('/register');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (
        BuildContext context,
        LoginState state,
      ) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        return Form(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: 'Email',
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                      style: TextStyle(color: Colors.white),
                      controller: _usernameController,
                    ),
                    TextFormField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.lock, color: Colors.white),
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blueGrey[50]))),
                      style: TextStyle(color: Colors.white),
                      controller: _passwordController,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    RaisedButton(
                      textColor: Colors.white,
                      onPressed:
                          state is! LoginLoading ? _onLoginButtonPressed : null,
                      child: Text('Sign In'),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    OutlineButton(
                        textColor: Colors.white,
                        onPressed: state is! LoginLoading
                            ? _onRegisterButtonPressed
                            : null,
                        child: Text('Sign Up'),
                        padding: EdgeInsets.symmetric(vertical: 15),
                        borderSide: BorderSide(color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    FlatButton(
                      textColor: Colors.white,
                      onPressed:
                          state is! LoginLoading ? _onLoginButtonPressed : null,
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                    )
                  ],
                ),
              ),
              Container(
                child:
                    state is LoginLoading ? CircularProgressIndicator() : null,
                margin: EdgeInsets.symmetric(vertical: 10.0),
              ),
            ],
          ),
        );
      },
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
