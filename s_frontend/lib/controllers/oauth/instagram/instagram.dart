import 'package:flutter/cupertino.dart';
import 'package:s_frontend/controllers/oauth/oauthParent.dart';
import 'package:s_frontend/controllers/oauth/oauth_constants.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;

class OAuth2Instagram extends OAuth2Parent {
  final simpleAuth.InstagramApi instagramApi = simpleAuth.InstagramApi(
    INSTAGRAM_LIB_ID,
    INSTAGRAM_CLIENT_ID,
    INSTAGRAM_CLIENT_SECRET,
    INSTAGRAM_REDIRECT_URI
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text("Login with Instagram"),
      onPressed: () => this.login(instagramApi, context),
    );
  }

}


