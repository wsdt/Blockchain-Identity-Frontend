import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';

class OAuth2Linkedin extends StatelessWidget {
  //static const REDIRECT_URL = "intent://codeing.io/oauth2/linkedin#Intent;scheme=http;package=io.flutter.app.FlutterApplication;category=android.intent.category.BROWSABLE;component=io.flutter.app.FlutterApplication.MainActivity;action=android.intent.action.VIEW;end";
  static const REDIRECT_URL = "https://codeing.io";
  static const CLIENT_ID = "867keehgjcqcws";
  static const CLIENT_SECRET = "HtHpCG3CBSSEuyfT";

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text("Login with LinkedIn"),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => LinkedInUserWidget(
                      redirectUrl: REDIRECT_URL,
                      clientId: CLIENT_ID,
                      clientSecret: CLIENT_SECRET,
                      onGetUserProfile: (LinkedInUserModel linkedInUser) {
                        print('Access token ${linkedInUser.token.accessToken}');

                        Navigator.pop(context);
                      },
                    )));
      },
    );
  }
}
