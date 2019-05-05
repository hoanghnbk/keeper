import 'package:flutter/material.dart';

class UpComingEventWidget extends StatelessWidget {
  final Key key;
  final List listUpcomingWidget;
  UpComingEventWidget({@required this.listUpcomingWidget, this.key})
      : super(key: key);

  List<_UpComingEventItemWidget> getUpComingWidgets(List array) {
    List<_UpComingEventItemWidget> list = new List<_UpComingEventItemWidget>();
    for (var i = 0; i < array.length; i++) {
      if (i < 3) {
        list.add(new _UpComingEventItemWidget(
            date: array[i]['date'], time: array[i]['time']));
      }
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            child: Text(
              'UpComing Interviews',
              // style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: getUpComingWidgets(listUpcomingWidget),
          )
        ],
      ),
    );
  }
}

class _UpComingEventItemWidget extends StatelessWidget {
  final Key key;
  final String date;
  final String time;
  _UpComingEventItemWidget({@required this.date, @required this.time, this.key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        color: Color.fromRGBO(200, 183, 227, 1),
        child: Column(
          children: <Widget>[
            Text(
              date,
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(
              height: 10,
            ),
            Text(time, style: TextStyle(color: Colors.white, fontSize: 17))
          ],
        ),
      ),
    );
  }
}
