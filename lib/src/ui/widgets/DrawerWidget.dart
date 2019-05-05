import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  _onDashBoardTap(BuildContext context) {
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
                              'https://picsum.photos/id/237/200/300'),
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
              onTap: () {},
            ),
            _ListTile(
              title: 'INTERVIEWS',
              onTap: () {},
            ),
            _ListTile(
              title: 'IN THE WILD',
              onTap: () {},
            ),
            _ListTile(
              title: 'JOB POSTING',
              onTap: () {},
            ),
            _ListTile(
              title: 'SETTINGS',
              onTap: () {},
            ),
            _ListTile(
              title: 'HELP',
              onTap: () {},
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
