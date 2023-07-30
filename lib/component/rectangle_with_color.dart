import 'package:flutter/material.dart';

class RectangleWithColor extends StatelessWidget{
  const RectangleWithColor({
    super.key,
    required this.color,
    required this.width,
    required this.height,
    this.border = false,
    this.onPressed,
  });

  final Color color;
  final double width;
  final double height;
  final bool border;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: border ? BoxDecoration(
          color: color,
          border: Border.all(color: Theme.of(context).primaryColor, width: 4,),
        ) : BoxDecoration(color: color),
      ),
    );
  }

}