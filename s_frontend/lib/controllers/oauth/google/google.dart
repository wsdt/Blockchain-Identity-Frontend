import 'package:flutter/cupertino.dart';
import 'package:s_frontend/controllers/oauth/oauthParent.dart';
import 'package:s_frontend/controllers/oauth/oauth_constants.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;

class OAuth2Google extends OAuth2Parent {
  final simpleAuth.GoogleApi googleApi = simpleAuth.GoogleApi(GOOGLE_LIB_ID, GOOGLE_CLIENT_ID, GOOGLE_REDIRECT_URI, scopes: GOOGLE_PERMISSIONS);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text("Login with Google"),
      onPressed: () => this.login(googleApi, context),
    );
  }
}
