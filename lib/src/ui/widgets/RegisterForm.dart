import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Key key;
  final secure;
  RegisterForm(
      {@required this.label,
      @required this.controller,
      this.key,
      secure = false})
      : secure = secure,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: controller,
            obscureText: secure ? true : false,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 0.5))),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
