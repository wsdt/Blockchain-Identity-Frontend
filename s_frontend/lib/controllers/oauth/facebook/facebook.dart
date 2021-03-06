import 'package:flutter/cupertino.dart';
import 'package:s_frontend/controllers/oauth/oauthParent.dart';
import 'package:s_frontend/controllers/oauth/oauth_constants.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;

class OAuth2Facebook extends OAuth2Parent {
  final simpleAuth.FacebookApi facebookApi = simpleAuth.FacebookApi(
    FACEBOOK_LIB_ID,
    FACEBOOK_CLIENT_ID,
    FACEBOOK_CLIENT_SECRET,
    FACEBOOK_REDIRECT_URI
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text("Login with Facebook"),
      onPressed: () => this.login(facebookApi, context),
    );
  }

}


