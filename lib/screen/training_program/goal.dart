import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:readmore/readmore.dart';

import '../../util/global.dart';
import '../../util/theme.dart';

class GoalPage extends StatelessWidget {
  const GoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.032 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      generalGoalString,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800, ),
                    ),
                    Icon(Icons.keyboard_arrow_down, size: 0.04 * screenHeight, weight: 100,),
                  ],
                ),
                SizedBox(height: 0.004 * screenHeight,),
                Divider(thickness: 1, color: textLightColor, height: 3,),
              ],
            ),
            onTap: () {

            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.05 * screenWidth, vertical: 0.01727 * screenHeight,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(aboutKnowledgeString, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700,),),
                SizedBox(height: 0.008 * screenHeight,),
                ReadMoreText(
                  'Trang bị những kiến thức cơ bản và chuyên sâu về Công nghệ thông tin. Các kiến thức này được nâng cao và một số trong đó đạt đến trình độ. Các kiến thức này được nâng cao và một số trong đó đạt đến trình độ.',
                  preDataText: '    ',
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: showMoreString,
                  trimExpandedText: showLessString,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,),
                  preDataTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,),
                  moreStyle: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor),
                  lessStyle: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor),
                ),
                SizedBox(height: 0.01727 * screenHeight,),
                Text(aboutSkillString, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700,),),
                SizedBox(height: 0.008 * screenHeight,),
                ReadMoreText(
                  'Trang bị những kiến thức cơ bản và chuyên sâu về Công nghệ thông tin. Các kiến thức này được nâng cao và một số trong đó đạt đến trình độ. Các kiến thức này được nâng cao và một số trong đó đạt đến trình độ.',
                  preDataText: '    ',
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: showMoreString,
                  trimExpandedText: showLessString,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,),
                  preDataTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,),
                  moreStyle: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor),
                  lessStyle: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor),
                ),
                SizedBox(height: 0.01727 * screenHeight,),
                Text(aboutAttitudeString, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700,),),
                SizedBox(height: 0.008 * screenHeight,),
                ReadMoreText(
                  'Trang bị những kiến thức cơ bản và chuyên sâu về Công nghệ thông tin. Các kiến thức này được nâng cao và một số trong đó đạt đến trình độ. Các kiến thức này được nâng cao và một số trong đó đạt đến trình độ.',
                  preDataText: '    ',
                  trimLines: 3,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: showMoreString,
                  trimExpandedText: showLessString,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,),
                  preDataTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500,),
                  moreStyle: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor),
                  lessStyle: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
          SizedBox(height: 0.02 * screenHeight,),
          InkWell(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      specificGoalsString,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800, ),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 0.025 * screenHeight, weight: 100,),
                  ],
                ),
                SizedBox(height: 0.004 * screenHeight,),
                Divider(thickness: 1, color: textLightColor, height: 3,),
              ],
            ),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }

}