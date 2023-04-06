import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/global.dart';

class TopicWithName extends StatelessWidget {
  const TopicWithName({Key? key, required this.name, required this.id}) : super(key: key);
  final String id;
  final String name;

  @override
  Widget build(BuildContext context) {
    int index = Random().nextInt(10);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 0.13 * screenHeight,
          height: 0.13 * screenHeight,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: lightLogoColor.elementAt(index).backgroundColor,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  id.split(' ').elementAt(0),
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: lightLogoColor.elementAt(index).textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 0.002 * screenHeight,),
                Text(
                  id.split(' ').elementAt(1),
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: lightLogoColor.elementAt(index).textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 0.004 * screenHeight,),
        SizedBox(
          width: 0.13 * screenHeight,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }

}

class LogoColor {
  LogoColor({required this.backgroundColor, required this.textColor,});

  final Color backgroundColor;
  final Color textColor;
}

List<LogoColor> lightLogoColor = [
  LogoColor(backgroundColor: const Color(0xFFF96167), textColor: const Color(0xFFFCE77D)),
  LogoColor(backgroundColor: const Color(0xFF3D155F), textColor: const Color(0xFFDF678C)),
  LogoColor(backgroundColor: const Color(0xFF4831D4), textColor: const Color(0xFFCCF381)),
  LogoColor(backgroundColor: const Color(0xFF4A274F), textColor: const Color(0xFFF0A07C)),
  LogoColor(backgroundColor: const Color(0xFF3C1A5B), textColor: const Color(0xFFFFF748)),
  LogoColor(backgroundColor: const Color(0xFF2F3C7E), textColor: const Color(0xFFFBEAEB)),
  LogoColor(backgroundColor: const Color(0xFF243665), textColor: const Color(0xFF8BD8BD)),
  LogoColor(backgroundColor: const Color(0xFF358597), textColor: const Color(0xFFF4A896)),
  LogoColor(backgroundColor: const Color(0xFFAA96DA), textColor: const Color(0xFFFFFFD2)),
  LogoColor(backgroundColor: const Color(0xFFEE4E34), textColor: const Color(0xFFFCEDDA)),
];

List<LogoColor> blackLogoColor = [
  LogoColor(backgroundColor: const Color(0xFFFCE77D), textColor: const Color(0xFFF96167)),
  LogoColor(backgroundColor: const Color(0xFFDF678C), textColor: const Color(0xFF3D155F)),
  LogoColor(backgroundColor: const Color(0xFFCCF381), textColor: const Color(0xFF4831D4)),
  LogoColor(backgroundColor: const Color(0xFFF0A07C), textColor: const Color(0xFF4A274F)),
  LogoColor(backgroundColor: const Color(0xFFFFF748), textColor: const Color(0xFF3C1A5B)),
  LogoColor(backgroundColor: const Color(0xFFFBEAEB), textColor: const Color(0xFF2F3C7E)),
  LogoColor(backgroundColor: const Color(0xFF8BD8BD), textColor: const Color(0xFF243665)),
  LogoColor(backgroundColor: const Color(0xFFF4A896), textColor: const Color(0xFF358597)),
  LogoColor(backgroundColor: const Color(0xFFFFFFD2), textColor: const Color(0xFFAA96DA)),
  LogoColor(backgroundColor: const Color(0xFFFCEDDA), textColor: const Color(0xFFEE4E34)),

];