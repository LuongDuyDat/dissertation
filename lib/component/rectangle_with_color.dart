import 'package:flutter/cupertino.dart';

class RectangleWithColor extends StatelessWidget{
  const RectangleWithColor({
    super.key,
    required this.color,
    required this.width,
    required this.height,
  });

  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: color,
    );
  }

}