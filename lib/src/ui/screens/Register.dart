import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injector/injector.dart';
import 'package:keeper/src/bloc/auth/AuthBloc.dart';
import 'package:keeper/src/bloc/register/RegisterBloc.dart';
import 'package:keeper/src/resources/repository/UserRepository.dart';
import 'package:keeper/src/services/appSetting.dart';
import 'package:keeper/src/ui/screens/registertabs/Employer.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterBloc registerBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    registerBloc = RegisterBloc(
      userRepository: Injector.appInstance.getDependency<UserRepository>(),
      authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    registerBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: registerBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('CREATE ACCOUNT'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey, width: 0.8))),
                child: TabBar(
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  tabs: <Widget>[Tab(text: 'TALENT'), Tab(text: 'EMPLOYER')],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[Employer(), Employer()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
