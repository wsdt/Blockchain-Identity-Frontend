import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_frontend/controllers/oauth/amazon/amazon.dart';
import 'package:s_frontend/controllers/oauth/dropbox/dropbox.dart';
import 'package:s_frontend/controllers/oauth/github/github.dart';
import 'package:s_frontend/controllers/oauth/google/google.dart';
import 'package:s_frontend/controllers/oauth/facebook/facebook.dart';
import 'package:s_frontend/controllers/oauth/instagram/instagram.dart';
import 'package:s_frontend/controllers/oauth/linkedin/linkedin.dart';

class VerificationOAuth extends StatelessWidget {
  VerificationOAuth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
            OAuth2Facebook(),
            OAuth2Instagram(),
            OAuth2Linkedin(),
            OAuth2Google(),
            OAuth2Github(),
            OAuth2Dropbox(),
            OAuth2Amazon(),
          ],
        ),
      ),
    );
  }
}
