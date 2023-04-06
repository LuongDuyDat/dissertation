import 'package:flutter/material.dart';

import '../util/global.dart';

class TopicWithImage extends StatelessWidget {
  const TopicWithImage({super.key, required this.logo, required this.name});

  final String logo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 0.13 * screenHeight,
          height: 0.13 * screenHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Image.asset(logo, fit: BoxFit.contain,),
          ),
        ),
        SizedBox(height: 0.004 * screenHeight,),
        SizedBox(
          width: 0.13 * screenHeight,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

}