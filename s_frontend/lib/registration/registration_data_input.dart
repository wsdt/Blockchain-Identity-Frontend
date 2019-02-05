import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistrationInput extends StatelessWidget {
  RegistrationInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
            padding: new EdgeInsets.all(20.0),
            child: Form(
              autovalidate: true,
              child: ListView(
                children: <Widget>[
                  Text("Input data", style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        hintText: "Max", labelText: "Vorname"),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        hintText: "Mustermann", labelText: "Nachname"),
                  )
                ],
              ),
            )));
  }
}
