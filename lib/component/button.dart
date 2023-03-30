import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  //type = 0: elevated button, type = 1: outlined button
  final int type;
  final double width;
  final double height;
  final String text;
  final Function()? onPressed;

  const Button({super.key, required this.type, required this.width, required this.height, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: type == 0 ? ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      ) : OutlinedButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}