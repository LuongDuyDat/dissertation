import 'package:flutter/material.dart';

import '../util/global.dart';

class TopicWithImage extends StatelessWidget {
  const TopicWithImage({super.key, required this.logo, this.name, this.onTap});

  final String logo;
  final String? name;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
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
          SizedBox(height: name != null ? 0.004 * screenHeight : 0,),
          name != null ?
          SizedBox(
            width: 0.13 * screenHeight,
            child: Text(
              name!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ) : const SizedBox(width: 0, height: 0,),
        ],
      ),
    );
  }

}