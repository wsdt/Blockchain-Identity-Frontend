
import 'package:simple_auth_flutter/simple_auth_flutter.dart';
import 'package:flutter/material.dart';
import 'package:s_frontend/views/auth_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    debugPrint("main:build: Started main application.");
    SimpleAuthFlutter.init(context); // for oauth

    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.indigo,
      ),
      home: AuthPage(),
    );
  }

}
