import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Navigate{
  static void pushPage(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static void popAll(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/'));
  }

  static void pushPageReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => page));
  }

  static void popPage(BuildContext context, [Object? result]) {
    Navigator.pop(context, result);
  }

  static Future<dynamic> pushNewScreen(BuildContext context, Widget page, bool? withNavbar) {
    return PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: page,
      withNavBar: withNavbar ?? true,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }
}