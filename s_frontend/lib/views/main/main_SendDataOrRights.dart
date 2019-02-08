
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainSendDataOrRights extends StatelessWidget {
  MainSendDataOrRights({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Send data or rights", style: TextStyle(fontWeight: FontWeight.bold)),
            // TODO: Show modular view, send data send rights
          ],
        ),
      ), // center, This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}