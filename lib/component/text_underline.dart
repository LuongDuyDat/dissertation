import 'package:flutter/material.dart';

import '../util/global.dart';
import '../util/theme.dart';

class TextUnderline extends StatelessWidget {
  final String dateTime;
  final Icon? suffixIcon;
  final TextStyle style;

  const TextUnderline({
    Key? key,
    required this.dateTime,
    required this.suffixIcon,
    required this.style,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.05 * screenHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 0.01 * screenHeight, right: 0.01 * screenWidth,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(dateTime, style: style),
                suffixIcon ?? const SizedBox(),
              ],
            ),
          ),
          Divider(thickness: 1, height: 1, color: textLightColor,),
        ],
      ),
    );
  }
}