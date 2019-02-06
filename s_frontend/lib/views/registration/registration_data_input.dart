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
                  Text("Input shareable data", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("If you want you can input your data into following fields to share them later securely with your contacts. Please note that this is a prototype and real data should NOT be inputted.",
                  textAlign: TextAlign.justify,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        hintText: "Max", labelText: "Vorname"),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        hintText: "Mustermann", labelText: "Nachname"),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.datetime,
                    decoration: new InputDecoration(
                        hintText: "03.04.1989", labelText: "Geburtsdatum"),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        hintText: "0000 030489", labelText: "Sozialversicherungsnummer"),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        hintText: "AT 73 8484 8484 8383", labelText: "IBAN"),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        hintText: "SPIHAT xxxx", labelText: "BIC"),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: new InputDecoration(
                        hintText: "774747474", labelText: "Pass-Nr."),
                  ),
                ],
              ),
            )));
  }
}
