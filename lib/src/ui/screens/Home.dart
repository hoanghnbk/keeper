import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/src/bloc/auth/AuthBloc.dart';
import 'package:keeper/src/bloc/auth/AuthEvent.dart';
import 'package:keeper/src/ui/widgets/SquareStatisticWidget.dart';
import 'package:keeper/src/ui/widgets/TrendingJobWidget.dart';
import 'package:keeper/src/ui/widgets/UpComingEventWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthenticationBloc authenticationBloc;
  @override
  void initState() {
    super.initState();
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                textColor: Colors.white,
                onPressed: () {},
                child: Text('NEW JOB'),
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
            ),
          ],
        ),
        drawer: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ],
        ),
        body: Container(
          color: Color.fromRGBO(242, 242, 242, 1),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  'Last login: 3/15/2019',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SquareStatisticWidget(
                    number: '7',
                    content: 'New application',
                  ),
                  SquareStatisticWidget(
                    content: 'Consensus Cases',
                    number: '2',
                  )
                ],
              ),
              UpComingEventWidget(
                listUpcomingWidget: [
                  {'date': '4/2', 'time': '9AM'},
                  {'date': '4/5', 'time': '1:30PM'},
                  {'date': '4/12', 'time': '9AM'}
                ],
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  'Trending Jobs',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              TrendingJobWidget(
                trendingJob: [
                  {
                    'srcImage': 'https://picsum.photos/200',
                    'jobTitle': 'Some Title',
                    'datePosted': 'datePosted',
                    'applicantCounts': 4
                  },
                  {
                    'srcImage': 'https://picsum.photos/200',
                    'jobTitle': 'another Title',
                    'datePosted': 'datePosted',
                    'applicantCounts': 5
                  },
                  {
                    'srcImage': 'https://picsum.photos/200',
                    'jobTitle': 'new Title',
                    'datePosted': 'datePosted',
                    'applicantCounts': 2
                  },
                  {
                    'srcImage': 'https://picsum.photos/200',
                    'jobTitle': 'some another Title',
                    'datePosted': 'datePosted',
                    'applicantCounts': 2
                  },
                  {
                    'srcImage': 'https://picsum.photos/200',
                    'jobTitle': 'Job Title',
                    'datePosted': 'datePosted',
                    'applicantCounts': 2
                  }
                ],
              ),
            ],
          ),
        ));
  }
}
