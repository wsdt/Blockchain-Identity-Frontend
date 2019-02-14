import 'package:flutter/cupertino.dart';
import 'package:s_frontend/controllers/oauth/oauthParent.dart';
import 'package:s_frontend/controllers/oauth/oauth_constants.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;

class OAuth2Dropbox extends OAuth2Parent {
  final simpleAuth.DropboxApi dropboxApi = simpleAuth.DropboxApi(
    DROPBOX_LIB_ID, DROPBOX_CLIENT_ID, DROPBOX_CLIENT_SECRET, DROPBOX_REDIRECT_URI
  );

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text("Login with Dropbox"),
      onPressed: () => this.login(dropboxApi, context),
    );
  }

}


