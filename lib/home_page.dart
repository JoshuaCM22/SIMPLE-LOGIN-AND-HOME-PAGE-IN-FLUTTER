import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final me = Hero(
      tag: '',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/me.jpg'),
        ),
      ),
    );

    final titleText = Padding(
      padding: EdgeInsets.all(0),
      child: Text(
        'Home Page',
        style: TextStyle(fontSize: 22.0, color: Colors.white),
      ),
    );

    final descriptionText = Padding(
      padding: EdgeInsets.all(0),
      child: Text(
        'Hi, I am Joshua C. Magoliman. The developer of this app.',
        style: TextStyle(fontSize: 15.0, color: Colors.white),
      ),
    );

    final logoutButton = Padding(
        padding: EdgeInsets.all(20),
        child: RaisedButton(
          color: Colors.white,
          child: Text('LOGOUT', style: TextStyle(color: Colors.black)),
          onPressed: () {
            Navigator.pop(context);
          },
        ));

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(45.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.green,
          Colors.green,
        ]),
      ),
      child: Column(
        children: <Widget>[
          me,
          titleText,
          descriptionText,
          logoutButton,
        ],
      ),
    );

    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: body,
      ),
    );
  }
}
