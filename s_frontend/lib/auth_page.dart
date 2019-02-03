import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_frontend/introduction/introduction.interfaces.dart';
import 'package:s_frontend/introduction/introduction_pages_parent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatelessWidget {

  AuthPage({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    this._whatToShow(context);

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
            Text(
              'Auth here',
            ),
          ],
        ),
      ), // center, This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  /// This method determines what views will be shown
  /// When information pages have been shown already the
  /// app goes to the main page.
  Future<void> _whatToShow(BuildContext context) async {
    debugPrint("main:_whatToShow: Trying to determine whether introduction has been shown.");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool wasShown = prefs.getBool(INTRODUCTION_SHOWN) ?? false; // ?? means if null
    if (!wasShown) {
      startIntroductionPages(context);
    }
  }

  /// Go to info page (start page when not read introduction)
  Future startIntroductionPages(BuildContext context) async {
    debugPrint("main:startIntroductionPages: Started introduction views.");
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new IntroductionPagesParent()));
  }
}