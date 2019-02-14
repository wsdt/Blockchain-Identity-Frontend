import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_frontend/views/auth_page.dart';
import 'package:local_auth/local_auth.dart';
import 'main.constants.dart';

class AuthPageState extends State<AuthPage> {
  var localAuth = new LocalAuthentication(); // https://pub.dartlang.org/packages/local_auth
  bool _obscurePwd = true;
  bool _isAuthenticated = false;
  bool _canCheckBiometrics = true; // todo: set to null/undefined for loading op (just remove true, when biometrics implemented)

  void _togglePwdVisibility() {
    setState(() {
      _obscurePwd = !_obscurePwd;
    });
  }

  @override
  void initState() {
    localAuth.canCheckBiometrics.then((areBiometricsAvailable) {
      setState(() {
        _canCheckBiometrics = areBiometricsAvailable;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
            builder: (scaffoldCtx) =>
            Center(
            child: new Container(
                padding: new EdgeInsets.all(20.0),
                child: determineViews(scaffoldCtx)))));
  }

  /// Made to get the scaffold context not the regular buildContext (for snackbar "Not implemented", afterwards not needed)
  Widget determineViews(BuildContext context) {
    Widget toReturn;
    if (_isAuthenticated) {
      // already authenticated
      print("auth_page:_AuthPageState:build: User already authenticated.");
      toReturn = _getAuthenticated(context);
    } else {
      if (_canCheckBiometrics == null) {
        // loading
        toReturn = new Text("Searching for biometrics..");
      } else {
        if (_canCheckBiometrics) {
          // use biometrics
          try {
            localAuth
                .authenticateWithBiometrics(
                    localizedReason: AUTH_REASON, stickyAuth: true)
                .then((isAuthenticated) {
              setState(() {
                _isAuthenticated = isAuthenticated;
              });
            });
            if (_isAuthenticated) {
              toReturn = _getAuthenticated(context);
            } else {
              toReturn = new Text("Authentication required.");
            }
          } catch (e) {
            print("appAuth: Could not use biometrics: " + e.toString());
            // show pwd input
            toReturn = _getLoginForm(context);
          }
        } else {
          // show pwd form
          toReturn = _getLoginForm(context);
        }
      }
    }
    return toReturn;
  }

  Widget _getAuthenticated(BuildContext context) {
    AuthPage.evaluateIntroduction(context);
    // evaluteRegister is called in evaluteIntroduction after finishing

    return new Text("User authenticated.");
  }

  Widget _getLoginForm(BuildContext context) {
    return Form(
        autovalidate: true,
        child: ListView(
          children: <Widget>[
            Text("Passwort eingeben",
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: _obscurePwd,
              decoration: new InputDecoration(
                  hintText: "Nicht 12345", labelText: "Passwort"),
            ),
            FlatButton(
                onPressed: _togglePwdVisibility,
                child: new Text(_obscurePwd ? "Zeigen" : "Verbergen")),
            RaisedButton(
                child: const Text('Log in'),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                splashColor: Colors.blueGrey,
                onPressed: () => _showNotImplementedWarning(context))
          ],
        ));
  }


  void _showNotImplementedWarning(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(new SnackBar(content: new Text("Not implemented")));
    _getAuthenticated(context); // AUTHENTICATE AUTOMATICALLY IN THE MEANTIME
  }
}
