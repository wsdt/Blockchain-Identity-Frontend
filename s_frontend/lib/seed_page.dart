import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_frontend/introduction/introduction.interfaces.dart';
import 'package:s_frontend/introduction/introduction_pages_parent.dart';
import 'package:s_frontend/registration/registration_data_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SeedPage extends StatelessWidget {

  SeedPage({Key key}) : super(key: key);

  _registrationInput(BuildContext context) {
    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => new RegistrationInput()));
  }

  @override
  Widget build(BuildContext context) {
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
            RaisedButton(
                child: const Text('Generiere neuen Seed'),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                splashColor: Colors.blueGrey,
                onPressed: () => _registrationInput(context)),
            RaisedButton(
                child: const Text('Importiere Seed'),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                splashColor: Colors.blueGrey,
                onPressed: null),
          ],
        ),
      ), // center, This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}