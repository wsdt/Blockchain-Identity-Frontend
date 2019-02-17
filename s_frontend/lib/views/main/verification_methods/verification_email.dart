import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:s_frontend/views/main.constants.dart';

class VerificationEmail extends StatefulWidget {
  VerificationEmail({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return VerificationEmailState();
  }
}

class VerificationEmailState extends State<VerificationEmail> {
  /// Create a global key that will uniquely identify the Form widget and allow
  /// us to validate the form
  ///
  /// Note: This is a `GlobalKey<FormState>`, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();
  static const _emailRegex =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  static final RegExp regExp =
      RegExp(_emailRegex, caseSensitive: false, multiLine: false);
  final emailController = TextEditingController();

  @override
  void dispose() {
    // Clean up controller when widget is disposed
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Padding(
            padding: EdgeInsets.all(15.0),
            child: Center(
              child: Form(
                key: _formKey,
                autovalidate: true,
                child: ListView(children: <Widget>[
                  Text("Verifikation via E-Mail",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: this.emailController,
                    validator: (val) {
                      if (val.isEmpty) {
                        return "E-Mail ist obligatorisch.";
                      } else if (!regExp.hasMatch(val)) {
                        return "Bitte gib eine gültige E-Mail Adresse ein.";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "max.mustermann@codeing.io",
                        labelText: "Deine E-Mail"),
                  ),
                  CupertinoButton(
                      child: Text("Verifiziere E-Mail"),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(
                            new FocusNode()); // minimize keyboard to loose focus (snackbar height wrong if not minimized)
                        BuildContext ctx =
                            _formKey.currentState.context; // get scaffold state
                        // validate will return true if the form is valid
                        if (_formKey.currentState.validate()) {
                          // TODO: only show success dialog if server response ok (async, await)
                          this.informServerToSendMail(context);
                        } else {
                          Scaffold.of(ctx).showSnackBar(
                            SnackBar(
                              content: Text("E-Mail nicht gültig."),
                            ),
                          );
                        }
                      }),
                ]),
              ),
            )));
  }

  void informServerToSendMail(BuildContext context) async {
    // If multiple requests use Client instead (packages/http)
    print("Email: " + emailController.text);
    http.Response res = await http.post(BACKEND_URI + "/api/v1/verify_mail",
        encoding: Encoding.getByName("UTF-8"),
        headers: {"content-type":"application/json"},
        body: json.encode({"email": emailController.text}));

    print(
        "VerificationEmail:informServerToSendMail: Response status: ${res.statusCode}");
    print(
        "VerificationEmail:informServerToSendMail: Response body: ${res.body}");

    if (res.statusCode == 200) {
      showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
                title: Text("E-Mail unterwegs!"),
                content: Text(
                    "Wir haben dir eine E-Mail gesandt. Bitte klicke auf den Link, um dich über deine Mail zu verifizieren."),
                actions: <Widget>[
                  CupertinoButton(
                    child: const Text("Mail erneut senden"),
                    onPressed: () {
                      informServerToSendMail(context); // call again
                      Navigator.of(context, rootNavigator: true).pop(
                          "Discard"); // benötigt da sonst dialog nicht dismissed
                    },
                  ),
                  CupertinoButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop(
                          "Discard"); // benötigt da sonst dialog nicht dismissed
                    },
                  ),
                ],
              ));
    } else {
      showDialog(
          context: context,
          builder: (_) => CupertinoAlertDialog(
                title: Text("Oops.."),
                content: Text(
                    "Aufgrund eines Server-Fehlers konnte deine E-Mail leider nicht gesendet werden. Sollte das Problem weiterhin bestehen, kontaktiere bitte den Administrator."),
                actions: <Widget>[
                  CupertinoButton(
                    child: const Text("Ok"),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop(
                          "Discard"); // benötigt da sonst dialog nicht dismissed
                    },
                  ),
                ],
              ));
    }
  }
}
