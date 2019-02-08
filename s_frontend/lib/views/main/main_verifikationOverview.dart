import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

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
        children: craftCards(),
      ), // center, This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Card> craftCards() {
    List<Card> cards = [];
    cards.add(Card(
      child: Padding(padding: EdgeInsets.all(25.0),child:Image.asset("assets/symbols/symbol_email.png", color: Colors.indigo)),
    ));

    cards.add(Card(
      child: Padding(padding: EdgeInsets.all(25.0),child:Image.asset("assets/symbols/symbol_handysignature.png", color: Colors.indigo)),
    ));

    cards.add(Card(
      child: Padding(padding: EdgeInsets.all(25.0),child:Image.asset("assets/symbols/symbol_oauth.png", color: Colors.indigo)),
    ));

    cards.add(Card(
      child: Padding(padding: EdgeInsets.all(25.0),child:Image.asset("assets/symbols/symbol_sms.png", color: Colors.indigo)),
    ));

    return cards;
  }
}

/*
  Center(
                  child: CupertinoButton(
                      child: const Text("Next page"),
                      onPressed: () {
                        Navigator.of(context).push(
                            CupertinoPageRoute<void>(
                                builder: (BuildContext context) {
                                  return CupertinoPageScaffold(
                                      navigationBar: CupertinoNavigationBar(
                                        middle: Text("Page 2 of tab $index"),
                                      ),
                                      child: Center(
                                          child: CupertinoButton(
                                            child: const Text("Back"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          )
                                      )
                                  );
                                }
                            )
                        );
                      })
              ),
  */
