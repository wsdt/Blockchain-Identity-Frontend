import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_frontend/controllers/oauth/facebook/facebook.dart';
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
            OAuth2Linkedin(),
          ],
        ),
      ),
    );
  }
}
