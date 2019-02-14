import 'package:flutter/cupertino.dart';
import 'package:s_frontend/controllers/oauth/oauthParent.dart';
import 'package:s_frontend/controllers/oauth/oauth_constants.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;

class OAuth2Github extends OAuth2Parent {
  final simpleAuth.GithubApi githubApi = simpleAuth.GithubApi(
    GITHUB_LIB_ID, GITHUB_CLIENT_ID, GITHUB_CLIENT_SECRET, GITHUB_REDIRECT_URI, scopes: GITHUB_PERMISSIONS
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text("Login with Github"),
      onPressed: () => this.login(githubApi, context),
    );
  }

}


