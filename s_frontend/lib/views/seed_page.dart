import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_frontend/views/main/mainPage.dart';

class SeedPage extends StatelessWidget {
  SeedPage({Key key}) : super(key: key);

  _registrationInput(BuildContext context) {
    Navigator.pushReplacement(
        context, new MaterialPageRoute(builder: (context) => MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: CupertinoButton(
                  child: const Text('Generiere neuen Seed'),
                  onPressed: () => _registrationInput(context)),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: CupertinoButton(
                child: const Text('Importiere Seed'),
                onPressed: () => null),
            )
          ],
        ),
      ), // center, This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
