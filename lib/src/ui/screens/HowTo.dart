import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:keeper/src/ui/screens/Home.dart';
import 'package:keeper/src/ui/widgets/HowToWidget.dart';
import 'package:keeper/src/utils/constants.dart';

class HowTo extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<HowTo> {
  int _current = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  _onPageViewChange(int page) {
    setState(() {
      _current = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('lib/assets/login_bg.png'),
              fit: BoxFit.cover,
            )),
            child: SafeArea(
              child: Column(children: [
                Expanded(
                  child: Container(
                    // color: Colors.red,
                    child: PageView.builder(
                      itemCount: howToCompanyGuide.length,
                      onPageChanged: _onPageViewChange,
                      itemBuilder: (BuildContext context, int index) {
                        var howToContent = howToCompanyGuide[index];
                        return HowtoWidget(
                          title: howToContent['title'],
                          content: howToContent['content'],
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: _current == howToCompanyGuide.length - 1
                      ? SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            textColor: Colors.white,
                            onPressed: () {},
                            // state is! LoginLoading ? _onLoginButtonPressed : null,
                            child: Text('LET\'S GO'),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                          ))
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: map(
                            howToCompanyGuide,
                            (index, item) {
                              return Container(
                                width: 10.0,
                                height: 10.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 3.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == index
                                        ? Color.fromRGBO(255, 255, 255, 0.9)
                                        : Color.fromRGBO(255, 255, 255, 0.3)),
                              );
                            },
                          ),
                        ),
                ),
              ]),
            )));
  }
}
