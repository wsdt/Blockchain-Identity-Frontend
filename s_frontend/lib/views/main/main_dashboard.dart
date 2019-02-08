
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDashboard extends StatelessWidget {
  MainDashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Dashboard", style: TextStyle(fontWeight: FontWeight.bold)),
            // TODO: Show meta information (e.g. past data shares, warnings, news etc.)
          ],
        ),
      ), // center, This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}