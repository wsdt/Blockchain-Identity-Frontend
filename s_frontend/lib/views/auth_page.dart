import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_frontend/views/auth_page.state.dart';
import 'package:s_frontend/views/introduction/introduction.interfaces.dart';
import 'package:s_frontend/views/introduction/introduction_pages_parent.dart';
import 'package:s_frontend/views/seed_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);


  /// Returns list of widgets. Either widgets for registering a new user (seed buttons)
  /// or the login via finger print (keychain)
  static void evaluateRegister(BuildContext context) async {
    const bool isUserRegistered = false; // TODO: access keychain

    // Redirect to registration views if not registered
    if (!isUserRegistered) {
      startRegistrationPages(context);
    }
  }

  /// This method determines what views will be shown
  /// When information pages have been shown already the
  /// app goes to the main page.
  static Future<void> evaluateIntroduction(BuildContext context) async {
    debugPrint(
        "main:_whatToShow: Trying to determine whether introduction has been shown.");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool wasShown =
        prefs.getBool(INTRODUCTION_SHOWN) ?? false; // ?? means if null
    if (!wasShown) {
      startIntroductionPages(context);
    } else {
      // If introduction already shown evaluate whether user is registered
      evaluateRegister(context);
    }
  }

  /// Go to info page (start page when not read introduction)
  static void startIntroductionPages(BuildContext context) async {
    debugPrint("main:startIntroductionPages: Started introduction views.");

    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => new IntroductionPagesParent()));
  }

  /// Go to info page (start page when not read introduction)
  static void startRegistrationPages(BuildContext context) async {
    debugPrint("main:startRegistrationPages: Started registration views.");

    Navigator.pushReplacement(
        context, new MaterialPageRoute(builder: (context) => new SeedPage()));
  }

  @override
  State<StatefulWidget> createState() {
    return AuthPageState();
  }
}
