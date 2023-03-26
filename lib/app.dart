import 'package:flutter/material.dart';
import 'package:learning_intern_support_symtem/screen/login.dart';
import 'package:learning_intern_support_symtem/util/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appThemeLight,
      home: const LoginPage(),
    );
  }
}