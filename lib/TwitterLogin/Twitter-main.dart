import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_signin_example/widget/background_painter.dart';


class Twittermain extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Twittermain> {
  static final TwitterLogin twitterLogin = new TwitterLogin(
    consumerKey: '7tfRKpvmd4sbvbz3mAyXDHFUy',
    consumerSecret: 'Ig1wTzMXJ3M3vZ61ef4dXJ9e1cx8M0vUYzP0SgxgwQ8BuQTxZV',
  );

  String _message = 'Logged out.';

  void _login() async {
    final TwitterLoginResult result = await twitterLogin.authorize();
    String newMessage;

    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        newMessage = 'Logged in! User-Id: ${result.session.userId}\nUsername: ${result.session.username}';
        break;
      case TwitterLoginStatus.cancelledByUser:
        newMessage = 'Login cancelled by user.';
        break;
      case TwitterLoginStatus.error:
        newMessage = 'Login error: ${result.errorMessage}';
        break;
    }

    setState(() {
      _message = newMessage;
    });
  }

  void _logout() async {
    await twitterLogin.logOut();

    setState(() {
      _message = 'Logged out.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: new Text('Twitter login sample'),
        ),
        body: new Center(
          child:new Container(
            width: MediaQuery. of(context). size. width,
           color: Colors.white,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_message),
              new RaisedButton(
                child: new Text('Log in'),
                onPressed: _login,
              ),
              new RaisedButton(
                child: new Text('Log out'),
                onPressed: _logout,
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}