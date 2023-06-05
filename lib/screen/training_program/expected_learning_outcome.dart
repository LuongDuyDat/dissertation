import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../util/theme.dart';

class ExpectedLearningOutcomePage extends StatelessWidget {
  const ExpectedLearningOutcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 0.032 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionListTile(
              context,
              aboutKnowledgeString,
              Icon(Icons.keyboard_arrow_down, size: 0.04 * screenHeight,),
            ),
            SizedBox(height: 0.0194 * screenHeight,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.051 * screenWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. Khối kiến thức chung', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800, ),),
                  SizedBox(height: 0.008 * screenHeight),
                  Text(
                    '    Trang bị những kiến thức cơ bản và chuyên sâu về Công nghệ thông tin. Các kiến thức này được nâng cao và một số trong đó đạt đến trình độ. Các kiến thức này được nâng cao và một số trong đó đạt đến trình độ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 0.004 * screenHeight,),
                  Text(
                    showMoreString,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0.032 * screenHeight,),
            sectionListTile(
              context,
              aboutSkillString,
              Icon(Icons.arrow_forward_ios, size: 0.025 * screenHeight,),
            ),
            SizedBox(height: 0.032 * screenHeight,),
            sectionListTile(
              context,
              aboutMoralQualityString,
              Icon(Icons.arrow_forward_ios, size: 0.025 * screenHeight,),
            ),
            SizedBox(height: 0.032 * screenHeight,),
            sectionListTile(
              context,
              careerPathString,
              Icon(Icons.arrow_forward_ios, size: 0.025 * screenHeight,),
            ),
            SizedBox(height: 0.032 * screenHeight,),
            sectionListTile(
              context,
              academicPathString,
              Icon(Icons.arrow_forward_ios, size: 0.025 * screenHeight,),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionListTile(BuildContext context, String label, Icon? suffixIcon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800, ),),
            suffixIcon ?? const SizedBox()
          ],
        ),
        SizedBox(height: 0.004 * screenHeight,),
        Divider(thickness: 1, color: textLightColor, height: 3,),
      ],
    );
  }
}