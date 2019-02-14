import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_frontend/controllers/oauth/oauthParent.dart';
import 'package:s_frontend/controllers/oauth/oauth_constants.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;

class OAuth2Linkedin extends OAuth2Parent {
  final simpleAuth.LinkedInApi linkedInApi = simpleAuth.LinkedInApi(
    LINKEDIN_LIB_ID,
    LINKEDIN_CLIENT_ID,
    LINKEDIN_CLIENT_SECRET,
    LINKEDIN_REDIRECT_URI
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text("Login with LinkedIn"),
      onPressed: () => this.login(linkedInApi, context),
    );
  }
}
