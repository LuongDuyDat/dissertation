import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../util/global.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: screenWidth,),
          Text(
            meString,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
    );
  }

}