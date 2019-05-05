import 'package:flutter/material.dart';
import 'dart:math';

class DrawerWidget extends StatelessWidget {
  _onDashBoardTap(BuildContext context) {
    Navigator.pop(context);
    // Navigator.of(context).pushNamed('./Home');
  }

  _onMessageTap(BuildContext context) {
    Navigator.pop(context);
    // Navigator.of(context).pushNamed('./Home');
  }

  _onInterViewTap(BuildContext context) {
    Navigator.pop(context);
    // Navigator.of(context).pushNamed('./Home');
  }

  _onInTheWildTap(BuildContext context) {
    Navigator.pop(context);
    // Navigator.of(context).pushNamed('./Home');
  }

  _onJobPostingTap(BuildContext context) {
    Navigator.pop(context);
    // Navigator.of(context).pushNamed('./Home');
  }

  _onSettingsTap(BuildContext context) {
    Navigator.pop(context);
    // Navigator.of(context).pushNamed('./Home');
  }

  _onHelpTap(BuildContext context) {
    Navigator.pop(context);
    // Navigator.of(context).pushNamed('./Home');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.85,
      child: Container(
        color: Color.fromRGBO(22, 22, 22, 1),
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    height: 60,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://picsum.photos/id/${Random().nextInt(2000)}/200'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Text(
                    'Han Solo',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              decoration: BoxDecoration(),
            ),
            _ListTile(
              title: 'DASHBOARD',
              onTap: () {
                _onDashBoardTap(context);
              },
            ),
            _ListTile(
              title: 'MESSAGE',
              onTap: () {
                _onMessageTap(context);
              },
            ),
            _ListTile(
              title: 'INTERVIEWS',
              onTap: () {
                _onInterViewTap(context);
              },
            ),
            _ListTile(
              title: 'IN THE WILD',
              onTap: () {
                _onInTheWildTap(context);
              },
            ),
            _ListTile(
              title: 'JOB POSTING',
              onTap: () {
                _onJobPostingTap(context);
              },
            ),
            _ListTile(
              title: 'SETTINGS',
              onTap: () {
                _onSettingsTap(context);
              },
            ),
            _ListTile(
              title: 'HELP',
              onTap: () {
                _onHelpTap(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  final Function onTap;
  final String title;
  final Key key;
  _ListTile({@required this.onTap, @required this.title, this.key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      leading: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      ),
    );
  }
}
