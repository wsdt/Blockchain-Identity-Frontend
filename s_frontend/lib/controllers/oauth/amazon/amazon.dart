import 'package:flutter/cupertino.dart';
import 'package:s_frontend/controllers/oauth/oauthParent.dart';
import 'package:s_frontend/controllers/oauth/oauth_constants.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;

class OAuth2Amazon extends OAuth2Parent {
  final simpleAuth.AmazonApi amazonApi = simpleAuth.AmazonApi(
    AMAZON_LIB_ID,
    AMAZON_CLIENT_ID,
    AMAZON_CLIENT_SECRET,
    AMAZON_REDIRECT_URI,
    scopes: AMAZON_PERMISSIONS
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text("Login with Amazon"),
      onPressed: () => this.login(amazonApi, context),
    );
  }

}


