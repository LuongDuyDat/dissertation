import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/theme.dart';

class ModuleTile extends StatelessWidget {
  const ModuleTile({super.key, required this.moduleId, required this.moduleName, required this.numberOfCredit, this.type});

  final String moduleId;
  final String moduleName;
  final int numberOfCredit;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.792 * screenWidth,
      height: 0.078 * screenHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(0.0162 * screenHeight),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.03 * screenWidth, ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.008 * screenHeight,),
                type == null
                    ? Text(moduleId, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800),)
                    : Row(
                  children: [
                    Text(moduleId, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800),),
                    SizedBox(width: 0.01 * screenWidth,),
                    Container(
                      height: 0.015 * screenHeight,
                      width: 0.015 * screenHeight,
                      decoration: BoxDecoration(
                        color: hintLightText2,
                        borderRadius: BorderRadius.circular(0.004 * screenHeight),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          numberOfCredit.toString(),
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w800, color: backgroundLightColor2),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.006 * screenHeight,),
                SizedBox(
                  width: 0.61 * screenWidth,
                  child: Text(
                    moduleName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),
                  ),
                ),
              ]
            ),
            type == null ?
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
            ) :
            SizedBox(
              width: 0.121 * screenWidth,
              child: Text(
                type!,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700,),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

}