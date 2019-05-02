import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("lib/assets/splash_bg.png"),
          fit: BoxFit.cover,
        ),
      )),
    );
  }
}
