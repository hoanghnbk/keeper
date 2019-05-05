import 'package:flutter/material.dart';

class SquareStatisticWidget extends StatelessWidget {
  final Key key;
  final String number;
  final String content;
  SquareStatisticWidget(
      {@required this.number, @required this.content, this.key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Text(
              number,
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            Text(
              content,
              style: TextStyle(),
            )
          ],
        ),
      ),
    );
  }
}
