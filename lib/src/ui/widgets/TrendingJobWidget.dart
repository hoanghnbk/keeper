import 'package:flutter/material.dart';
import 'package:keeper/src/models/TrendingJobModel.dart';

class TrendingJobWidget extends StatelessWidget {
  final List trendingJob;
  TrendingJobWidget({@required this.trendingJob});

  List<Widget> getTrendingJobWidgets(List array) {
    List<Widget> list = new List<Widget>();
    for (int i = 0; i < array.length; i++) {
      list.add(_TrendingJobItemWidget(
        trendingJobModel: TrendingJobModel.fromJSON(array[i]),
      ));
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
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: getTrendingJobWidgets(trendingJob),
          shrinkWrap: true,
        ));
  }
}

class _TrendingJobItemWidget extends StatelessWidget {
  final TrendingJobModel trendingJobModel;
  final Key key;
  _TrendingJobItemWidget({@required this.trendingJobModel, this.key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 70,
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: FadeInImage(
                fit: BoxFit.cover,
                width: 60,
                height: 60,
                placeholder: AssetImage("lib/assets/loading_gif.gif"),
                image: NetworkImage(trendingJobModel.srcImage)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                trendingJobModel.jobTitle,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                trendingJobModel.datePosted,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                trendingJobModel.applicantCounts.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text('Applicant(s)')
            ],
          ),
        ],
      ),
    );
  }
}
