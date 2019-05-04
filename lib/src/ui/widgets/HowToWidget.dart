import 'package:flutter/material.dart';

class HowtoWidget extends StatelessWidget {
  final String title;
  final String content;
  const HowtoWidget({Key key, this.title, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                child: Text(
                  'LOGO',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                height: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.black),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 120,
                ),
              ),
            ],
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
