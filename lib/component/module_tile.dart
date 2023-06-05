import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/theme.dart';

class ModuleTile extends StatelessWidget {
  const ModuleTile({super.key, required this.moduleId, required this.moduleName, required this.numberOfCredit});

  final String moduleId;
  final String moduleName;
  final int numberOfCredit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.792 * screenWidth,
      height: 0.0756 * screenHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(0.0162 * screenHeight),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.02 * screenWidth, ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.004 * screenHeight,),
                Text(moduleId, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800),),
                SizedBox(height: 0.006 * screenHeight,),
                SizedBox(
                  width: 0.63 * screenWidth,
                  child: Text(
                    moduleName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ]
            ),
            Container(
              height: 0.0324 * screenHeight,
              width: 0.0324 * screenHeight,
              decoration: BoxDecoration(
                color: hintLightText2,
                borderRadius: BorderRadius.circular(0.0108 * screenHeight),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  numberOfCredit.toString(),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800, color: backgroundLightColor2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}