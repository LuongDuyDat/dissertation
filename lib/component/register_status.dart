import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../util/global.dart';

class RegisterStatusTile extends StatelessWidget {
  final String status;
  final String company;
  final String image;
  final String title;

  const RegisterStatusTile({super.key, required this.status, required this.company, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.13 * screenHeight,
      color: status == acceptString ? chartLightColor.elementAt(3).withOpacity(0.2)
          : (status == inProgressString ? chartLightColor.elementAt(1).withOpacity(0.2)
          : chartLightColor.elementAt(4).withOpacity(0.2)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 0.037 * screenWidth,),
          SizedBox(
            width: 0.35 * screenWidth,
            height: 0.1 * screenHeight,
            child: Image.asset(image, fit: BoxFit.cover,),
          ),
          SizedBox(width: 0.025 * screenWidth,),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.015 * screenHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  status,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    color: status == acceptString ? chartLightColor.elementAt(3)
                        : (status == inProgressString ? chartLightColor.elementAt(1)
                        : chartLightColor.elementAt(4)),
                  ),
                ),
                SizedBox(height: 0.006 * screenHeight,),
                SizedBox(
                  width: 0.467 * screenWidth,
                  height: 0.0476 * screenWidth,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800),
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: 0.006 * screenHeight,),
                Text(company, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),),

              ],
            ),
          ),
        ],
      ),
    );
  }

}