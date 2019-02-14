import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:s_frontend/controllers/oauth/facebook/facebook.dart';

class OAuth2FacebookState extends State<OAuth2Facebook> {
  bool isLoggedIn = false;
  List<String> permissions = ["email"];

  @override
  Widget build(BuildContext context) {
    return isLoggedIn
          ? Text("Logged in")
          : CupertinoButton(
            child: Text("Login with Facebook"),
            onPressed: () => _initiate(),
          );
  }

  void _onLoginStatusChanged(bool isLoggedIn) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  void _initiate() async {
    FacebookLogin facebookLogin = FacebookLogin();
    FacebookLoginResult facebookLoginRes = await facebookLogin.logInWithReadPermissions(this.permissions);
    switch (facebookLoginRes.status) {
      case FacebookLoginStatus.error:
        print("Facebook:initiate: Could not login into Facebook: "+facebookLoginRes.errorMessage);
        _onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("Facebook:initiate: Login cancelled by user.");
        _onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        _onLoginStatusChanged(true);
        break;
    }
  }

}