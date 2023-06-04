import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_add.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/term_detail.dart';
import 'package:learning_intern_support_system/util/navigate.dart';

import '../../util/global.dart';
import '../../util/strings.dart';
import '../../util/theme.dart';

List<String> termListString = [
  'Hoc ki I nam 1',
  'Hoc ki II nam 1',
  'Hoc ki I nam 2',
  'Hoc ki II nam 2'
];

class ScheduleTermPage extends StatelessWidget {
  const ScheduleTermPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.035 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    radius: 0.0216 * screenHeight,
                    child: Icon(Icons.add, color: backgroundLightColor2, size: screenHeight * 0.03,),
                  ),
                  SizedBox(width: 0.0234 * screenWidth,),
                  Text(addTermString, style: Theme.of(context).textTheme.titleLarge,)
                ],
              ),
              onTap: () {
                Navigate.pushNewScreen(context, const TermAddPage(), true);
              },
            ),
            SizedBox(height: 0.03 * screenHeight,),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: termListString.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            termListString.elementAt(index),
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700, ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 0.025 * screenHeight, weight: 100,),
                        ],
                      ),
                      SizedBox(height: 0.004 * screenHeight,),
                      Divider(thickness: 1, color: textLightColor, height: 3,),
                    ],
                  ),
                  onTap: () {
                    Navigate.pushNewScreen(context, TermDetailPage(termName: termListString.elementAt(index),), true);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 0.0324 * screenHeight,);
              },
            ),
          ],
        ),
      ),
    );
  }

}