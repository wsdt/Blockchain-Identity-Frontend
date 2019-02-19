import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:simple_auth/simple_auth.dart';

abstract class OAuth2Parent extends StatelessWidget {

  void showError (dynamic ex, BuildContext context) {
    showMessage(ex.toString(), context);
  }

  void showMessage(String text, BuildContext context) {
    CupertinoAlertDialog alertDialog = CupertinoAlertDialog(
      content: Text(text),
      actions: <Widget>[
        CupertinoButton(
          child: const Text("Ok"),
          onPressed: () {
            // Navigator.pop(context);
            Navigator.of(context, rootNavigator: true).pop("Discard"); // benötigt da sonst dialog nicht dismissed
          },
        ),
      ],
    );
    showCupertinoDialog(context: context, builder: (BuildContext context) => alertDialog);
  }

  /// Create short-time server for one request to fulfill the redirect from the
  /// oauth Api. After that the user has to close the window.
  void initiateRedirectServer() async {
    HttpServer server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
    server.listen((HttpRequest req) async {
      req.response
          ..statusCode = 200
          ..headers.set("Content-Type", ContentType.html.mimeType)
          ..write("<html lang='en'><h1>Authenticated</h1><p>You can now close this window.</p><p style='color:#ccc;font-size: small;'>(c) Code|ng (VID-Card), 2019</p></html>");
      await req.response.close();
      await server.close(force:true); // end server after redirect
    });
  }

  void login(AuthenticatedApi api, BuildContext context) async {
    try {
      initiateRedirectServer();
      OAuthAccount success = await api.authenticate();

      showMessage("Account now connected to VID-Card.", context);
      print("oauthParent:login: Logged in successfully: $success / "+success.toString());
    } catch (e, s) {
      showError("Verification aborted. Account not connected to VID-Card.", context);
      print("oauthParent:login: Could not login -> "+e.toString());
      print("oauthParent:login: "+s.toString());
    }
  }

  void logout(AuthenticatedApi api, BuildContext context) async {
    await api.logOut();
    showMessage("Logged out", context);
  }

}


