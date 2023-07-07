import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  //type = 0: elevated button, type = 1: outlined button
  final int type;
  final double width;
  final double height;
  final String text;
  final Function()? onPressed;
  final TextStyle? style;

  const Button({super.key, required this.type, required this.width, required this.height, required this.text, this.onPressed, this.style});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: type == 0 ? ElevatedButton(
        onPressed: onPressed,
        child: Text(text, style: style,),
      ) : OutlinedButton(
        onPressed: onPressed,
        child: Text(text, style: style,),
      ),
    );
  }
}

class Button2 extends StatelessWidget {
  const Button2({super.key, required this.text, this.onPressed, required this.style, required this.height,});

  final double height;
  final String text;
  final Function()? onPressed;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: style, textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}