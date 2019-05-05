import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/src/bloc/auth/AuthBloc.dart';
import 'package:keeper/src/bloc/login/LoginBloc.dart';
import 'package:keeper/src/resources/repository/UserRepository.dart';
import 'package:keeper/src/ui/widgets/LoginForm.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;
  AuthenticationBloc _authenticationBloc;

  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = LoginBloc(
      userRepository: _userRepository,
      authenticationBloc: _authenticationBloc,
    );
    super.initState();
    // Future.delayed(Duration(seconds: 1)).then((_) {
    //   Navigator.pushReplacementNamed(context, '/howto1');
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('lib/assets/login_bg.png'),
          fit: BoxFit.cover,
        )),
        // padding: EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Logo and text

              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage('lib/assets/logo.png'),
                    ),
                    RichText(
                      text: TextSpan(
                          text: '',
                          style: TextStyle(fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Tell',
                                style: TextStyle(
                                    decoration: TextDecoration.lineThrough)),
                            TextSpan(
                                text: ' Show them who you are',
                                style: TextStyle(color: Colors.white))
                          ]),
                    ),
                  ],
                ),
              ),

              //Login Form

              Expanded(
                flex: 3,
                child: LoginForm(
                  authenticationBloc: _authenticationBloc,
                  loginBloc: _loginBloc,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
