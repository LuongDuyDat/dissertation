import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/global.dart';

class Indicator extends StatelessWidget {
  const Indicator({
  super.key,
  required this.color,
  required this.text,
  required this.isSquare,
  this.size,
  this.textColor,
  });
  final Color color;
  final String text;
  final bool isSquare;
  final double? size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size ?? 0.013 * screenHeight,
          height: size ?? 0.013 * screenHeight,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 10, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}