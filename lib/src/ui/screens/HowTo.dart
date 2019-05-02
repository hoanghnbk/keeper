import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:keeper/src/ui/screens/Home.dart';
import 'package:keeper/src/ui/widgets/HowToWidget.dart';

final List<Widget> widgetList = [
  HowtoWidget(),
  HowtoWidget(),
  HowtoWidget(),
  HowtoWidget(),
];

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('lib/assets/login_bg.png'),
        fit: BoxFit.cover,
      )),
      child: Column(children: [
        Expanded(
          child: Container(
            color: Colors.red,
            child: CarouselSlider(
              autoPlay: false,
              viewportFraction: 1.0,
              items: widgetList,
              enlargeCenterPage: true,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(
            widgetList,
            (index, Widget widget) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(255, 255, 255, 0.9)
                        : Color.fromRGBO(255, 255, 255, 0.4)),
              );
            },
          ),
        ),
      ]),
    );
  }
}
