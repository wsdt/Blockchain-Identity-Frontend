import 'package:flutter/cupertino.dart';
//import 'package:google_sign_in/google_sign_in.dart';

//TODO: Solve dex duplicate classes bug

class OAuth2Google extends StatelessWidget {
  /*GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );*/

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text("Login with Google"),
      onPressed: () => /*_initiate()*/ null,
    );
  }
/*
  Future<void> _initiate() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }*/
}


