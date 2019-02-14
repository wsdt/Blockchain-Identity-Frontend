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
            Navigator.pop(context);
          },
        ),
      ],
    );
    showCupertinoDialog(context: context, builder: (BuildContext context) => alertDialog);
  }

  void login(AuthenticatedApi api, BuildContext context) async {
    try {
      var success = await api.authenticate();
      showMessage("Logged in successfully: $success", context);
    } catch (e) {
      showError(e, context);
    }
  }

  void logout(AuthenticatedApi api, BuildContext context) async {
    await api.logOut();
    showMessage("Logged out", context);
  }

}


