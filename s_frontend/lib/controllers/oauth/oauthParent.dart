import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:s_frontend/views/main.constants.dart';
import 'package:simple_auth/simple_auth.dart';
import 'package:http/http.dart' as http;

abstract class OAuth2Parent extends StatelessWidget {
  void showError(dynamic ex, BuildContext context) {
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
            Navigator.of(context, rootNavigator: true)
                .pop("Discard"); // benötigt da sonst dialog nicht dismissed
          },
        ),
      ],
    );
    showCupertinoDialog(
        context: context, builder: (BuildContext context) => alertDialog);
  }

  /// Create short-time server for one request to fulfill the redirect from the
  /// oauth Api. After that the user has to close the window.
  void initiateRedirectServer() async {
    HttpServer server =
        await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
    server.listen((HttpRequest req) async {
      req.response
        ..statusCode = 200
        ..headers.set("Content-Type", ContentType.html.mimeType)
        ..write(
            "<html lang='en'><h1>Authenticated</h1><p>You can now close this window.</p><p style='color:#ccc;font-size: small;'>(c) Code|ng (VID-Card), 2019</p></html>");
      await req.response.close();
      await server.close(force: true); // end server after redirect
    });
  }

  void login(AuthenticatedApi api, BuildContext context) async {
    try {
      initiateRedirectServer();
      OAuthAccount success = await api.authenticate();
      sendOAuthTokenToServer(success, context);
    } catch (e, s) {
      showError(
          "Verification aborted. Account not connected to VID-Card.", context);
      print("oauthParent:login: Could not login -> " + e.toString());
      print("oauthParent:login: " + s.toString());
    }
  }

  void sendOAuthTokenToServer(OAuthAccount oauthAccount, BuildContext context) async {
    // If multiple requests use Client instead (packages/http)

    http.Response res = await http.post(BACKEND_URI + "/api/v1/oauth_token",
        encoding: Encoding.getByName("UTF-8"),
        headers: {"content-type": "application/json"},
        // TODO: Use jsonwebtokens for secure transmission
        body: json.encode({
          "userId": "101",
          "type": oauthAccount.identifier,
          "token": oauthAccount.token}));

    print("OAuthParent:sentOAuthTokenToServer: Response status: ${res.statusCode}");
    print("OAuthParent:sentOAuthTokenToServer: Response body: ${res.body}");

    if (res.statusCode == 200) {
      showMessage("Account now connected to VID-Card.", context);
      print("oauthParent:login: Logged in successfully: $oauthAccount / " +
          oauthAccount.token+" // "+oauthAccount.identifier+" // "+oauthAccount.isValid().toString());
    } else {
      print("OAuthParent:sentOAuthTokenToServer: Failure");
      throw new Exception("Backend responded not with a 200 code.");
    }
  }

  void logout(AuthenticatedApi api, BuildContext context) async {
    await api.logOut();
    showMessage("Logged out", context);
  }
}
