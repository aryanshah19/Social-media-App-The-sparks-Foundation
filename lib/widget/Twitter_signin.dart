import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_signin_example/TwitterLogin/Twitter-main.dart';
import 'package:google_signin_example/provider/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_signin_example/TwitterLogin/Twitter-main.dart';



class TwitterSignupButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(4),
    child: OutlineButton.icon(
      label: Text(
        'Sign-in with Twitter',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      shape: StadiumBorder(),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      highlightedBorderColor: Colors.black,
      borderSide: BorderSide(color: Colors.black),
      textColor: Colors.black,
      icon: FaIcon(FontAwesomeIcons.twitter,color:Colors.blue),
      onPressed:() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Twittermain()),
        );
      }
    ),
  );
}



