import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/theme.dart';

class CircleFunctionality extends StatelessWidget {
  const CircleFunctionality({super.key, required this.icon, required this.name});

  final IconData icon;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 0.0648 * screenHeight,
          height: 0.0648 * screenHeight,
          decoration: BoxDecoration(
            color: highLightColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: backgroundLightColor2, size: 0.043 * screenHeight,),
        ),
        SizedBox(
          width: 0.0648 * screenHeight,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }

}