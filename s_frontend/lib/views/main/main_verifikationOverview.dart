import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_frontend/views/main/verification_methods/verification_email.dart';
import 'package:s_frontend/views/main/verification_methods/verification_handysignatur.dart';
import 'package:s_frontend/views/main/verification_methods/verification_oauth.dart';
import 'package:s_frontend/views/main/verification_methods/verification_sms.dart';

class MainVerificationOverview extends StatelessWidget {
  MainVerificationOverview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20.0),
          crossAxisSpacing: 10.0,
          crossAxisCount: 3,
          children: <InkWell>[
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      CupertinoPageRoute<void>(builder: (BuildContext context) {
                    return CupertinoPageScaffold(
                        navigationBar: CupertinoNavigationBar(
                          middle: Text("Verifikation per E-Mail"),
                        ),
                        child: VerificationEmail());
                  }));
                },
                child: Tooltip(
                  message: "Verifikation per E-Mail",
                  child: Card(
                    child: Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Image.asset("assets/symbols/symbol_email.png")),
                  ),
                )),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      CupertinoPageRoute<void>(builder: (BuildContext context) {
                    return CupertinoPageScaffold(
                        navigationBar: CupertinoNavigationBar(
                          middle: Text("Verifikation per Handysignatur"),
                        ),
                        child: VerificationHandysignatur());
                  }));
                },
                child: Tooltip(
                  child: Card(
                    child: Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Image.asset(
                            "assets/symbols/symbol_handysignature.png")),
                  ),
                  message: "Verifikation per Handysignatur",
                )),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    CupertinoPageRoute<void>(builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                      navigationBar: CupertinoNavigationBar(
                        middle: Text("Verifikation per OAuth 2.0"),
                      ),
                      child: VerificationOAuth());
                }));
              },
              child: Tooltip(
                child: Card(
                  child: Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Image.asset("assets/symbols/symbol_oauth.png")),
                ),
                message:
                    "Verifikation per OAuth 2.0",
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    CupertinoPageRoute<void>(builder: (BuildContext context) {
                  return CupertinoPageScaffold(
                      navigationBar: CupertinoNavigationBar(
                        middle: Text("Verifikation per SMS"),
                      ),
                      child: VerificationSms());
                }));
              },
              child: Tooltip(child:Card(
                child: Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Image.asset("assets/symbols/symbol_sms.png")),
              ),message: "Verifikation per SMS",),
            ),
          ]), // center, This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
