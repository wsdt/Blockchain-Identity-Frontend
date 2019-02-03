import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:s_frontend/introduction/introduction_page_1.dart';
import 'package:s_frontend/introduction/introduction_page_2.dart';

class IntroductionPagesParent extends PageView {
  static final customController = PageController(
    initialPage: 1,
  );
  static final childrenList = [IntroductionPage1(), IntroductionPage2()];

  IntroductionPagesParent({Key key, PageController customController}) : super(key: key, controller: customController, children:childrenList);

}