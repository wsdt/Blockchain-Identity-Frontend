import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_frontend/introduction/introduction.interfaces.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionPage3 extends StatelessWidget {

  IntroductionPage3({Key key}) : super(key: key);

  /// Saves status in Shares prefs, that message has been read.
  /// Therefore information pages won't be shown again. */
  _saveReadStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(INTRODUCTION_SHOWN, true);
  }

  @override
  Widget build(BuildContext context) {
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
              'Page 3',
            ),
            RaisedButton(
                child: const Text('Verstanden'),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                splashColor: Colors.blueGrey,
                onPressed: this._saveReadStatus)
          ],
        ),
      ), // center, This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}