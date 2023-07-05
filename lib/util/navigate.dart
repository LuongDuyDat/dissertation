import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Navigate{
  static void pushPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static void popAll(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  static void popPage(BuildContext context) {
    Navigator.pop(context);
  }

  static void pushNewScreen(BuildContext context, Widget page, bool? withNavbar) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: page,
      withNavBar: withNavbar ?? true,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}