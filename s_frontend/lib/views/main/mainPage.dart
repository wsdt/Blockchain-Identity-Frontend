import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_frontend/views/main/main_SendDataOrRights.dart';
import 'package:s_frontend/views/main/main_dashboard.dart';
import 'package:s_frontend/views/main/main_verifikationOverview.dart';

class MainPage extends StatelessWidget {
  MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: <BottomNavigationBarItem>[
        // ICONS: https://docs.flutter.io/flutter/material/Icons-class.html
        BottomNavigationBarItem(
            icon: Icon(IconData(0xe871,
                fontFamily: 'MaterialIcons')) // home, dashboard
            ),
        BottomNavigationBarItem(
            icon: Icon(
                IconData(0xe90d, fontFamily: 'MaterialIcons')) // Verifikation
            ),
        BottomNavigationBarItem(
            icon: Icon(IconData(0xe0dd,
                fontFamily: 'MaterialIcons')) // send data/rights
            ),
      ]),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text(getPageTitleViaIndex(index)),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.0),
                  child: getPageViaIndex(index)),
            );
          },
        );
      },
    );
  }

  String getPageTitleViaIndex(int index) {
    switch (index) {
      case 0:
        return "Dashboard";
        break;
      case 1:
        return "Verify your identity";
        break;
      case 2:
        return "Send data or grant rights";
        break;
      default:
        return "ERROR 404: Title not found";
    }
  }

  Widget getPageViaIndex(int index) {
    switch (index) {
      case 0:
        return MainDashboard();
        break;
      case 1:
        return MainVerificationOverview();
        break;
      case 2:
        return MainSendDataOrRights();
        break;
      default:
        return Text("ERROR 404: Page not found.");
    }
  }
}
