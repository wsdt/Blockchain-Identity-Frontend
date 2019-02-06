import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_frontend/views/introduction/introduction.interfaces.dart';
import 'package:s_frontend/views/introduction/introduction_pages_parent.dart';
import 'package:s_frontend/views/seed_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this._evaluateIntroduction(context);
    // evaluteRegister is called in evaluteIntroduction after finishing

    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Auth fingerprint login, Keychain")
          ],
        ),
      ), // center, This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  /// Returns list of widgets. Either widgets for registering a new user (seed buttons)
  /// or the login via finger print (keychain)
  void _evaluateRegister(BuildContext context) async {
    const bool isUserRegistered = false; // TODO: access keychain

    // Redirect to registration views if not registered
    if (!isUserRegistered) {
      this._startRegistrationPages(context);
    }
  }

  /// This method determines what views will be shown
  /// When information pages have been shown already the
  /// app goes to the main page.
  Future<void> _evaluateIntroduction(BuildContext context) async {
    debugPrint(
        "main:_whatToShow: Trying to determine whether introduction has been shown.");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool wasShown = prefs.getBool(INTRODUCTION_SHOWN) ?? false; // ?? means if null
    if (!wasShown) {
      _startIntroductionPages(context);
    } else {
      // If introduction already shown evaluate whether user is registered
      this._evaluateRegister(context);
    }
  }

  /// Go to info page (start page when not read introduction)
  void _startIntroductionPages(BuildContext context) async {
    debugPrint("main:startIntroductionPages: Started introduction views.");

    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => new IntroductionPagesParent()));
  }

  /// Go to info page (start page when not read introduction)
  void _startRegistrationPages(BuildContext context) async {
    debugPrint("main:startRegistrationPages: Started registration views.");

    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => new SeedPage()));
  }

}
