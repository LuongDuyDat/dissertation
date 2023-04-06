import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../util/global.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: screenWidth,),
          Text(
            notificationString,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
    );
  }

}