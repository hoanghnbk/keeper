import 'package:flutter/material.dart';

class HowtoWidget extends StatelessWidget {
  const HowtoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text('LOGO'),
          ),
          // Container(
          //   height: 200,
          //   decoration: BoxDecoration(color: Colors.black),
          // )
        ],
      ),
    );
  }
}
