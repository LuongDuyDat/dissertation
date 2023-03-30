import 'package:flutter/material.dart';

class Navigate{
  static void pushPage(BuildContext context,Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  static void popPage(BuildContext context) {
    Navigator.pop(context);
  }
}