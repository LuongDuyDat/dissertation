import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../util/navigate.dart';
import '../../util/theme.dart';

class InternshipReportPage extends StatelessWidget {
  const InternshipReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigate.popPage(context);
          },
        ),
        title: Text(internshipReportString, style: Theme.of(context).textTheme.displayMedium,),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0.02 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              internshipInformationString,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 0.028 * screenHeight,),
            Padding(
              padding: EdgeInsets.only(left: 0.053 * screenWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richText(context, lecturerString, 'Nguyễn Đại Thọ'),
                  SizedBox(height: 0.004 * screenHeight,),
                  richText(context, internshipTypeString, 'Công ty ngoài'),
                  SizedBox(height: 0.004 * screenHeight,),
                  richText(context, internshipCompanyString, 'CMK Group'),
                  SizedBox(height: 0.004 * screenHeight,),
                  richText(context, reportString, 'Đã nộp'),
                ],
              ),
            ),
            SizedBox(height: 0.0378 * screenHeight,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  submitReportString,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w800,),
                ),
                Text(replaceString, style: Theme.of(context).textTheme.titleMedium,),
              ],
            ),
            SizedBox(height: 0.0237 * screenHeight,),
            Container(
              height: 0.069 * screenHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor,),
                borderRadius: BorderRadius.circular(0.0162 * screenHeight,),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.028 * screenWidth),
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 0.0432 * screenHeight,
                            height: 0.0432 * screenHeight,
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(0.0108 * screenHeight),
                            ),
                            child: Icon(Icons.insert_drive_file, size: 0.03 * screenHeight,),
                          ),
                          SizedBox(width: 0.035 * screenWidth,),
                          Text('Báo cáo thực tập.docx', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),),
                        ],
                      ),
                      Text('1MB', style: Theme.of(context).textTheme.bodyMedium,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.04 * screenHeight,),
            Text(
              resultString,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w800,),
            ),
            SizedBox(height: 0.0216 * screenHeight,),
            Container(
              height: 0.216 * screenHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor,),
                borderRadius: BorderRadius.circular(0.0162 * screenHeight,),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.028 * screenWidth, vertical: 0.014 * screenHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 0.0432 * screenHeight,
                          height: 0.0432 * screenHeight,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(0.0108 * screenHeight),
                          ),
                          child: Icon(Icons.scoreboard, size: 0.035 * screenHeight,),
                        ),
                        SizedBox(width: 0.0327 * screenWidth,),
                        Text('$pointString: 10', style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700),),
                      ],
                    ),
                    SizedBox(height: 0.012 * screenHeight,),
                    Text(
                      'Đây là chỗ nhẫn xét. Đây là chỗ nhẫn xét. Đây là chỗ nhẫn xét. Đây là chỗ nhẫn xét. Đây là chỗ nhẫn xét. Đây là chỗ nhẫn xét.Đây là chỗ nhẫn xét. Đây là chỗ nhẫn xét. Đây là chỗ nhẫn xét.Đây là chỗ nhẫn xét. Đây là chỗ nhẫn xét. Đây là chỗ nhẫn xét.',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget richText(BuildContext context, String title, String content) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: '$title: ', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700,)),
          TextSpan(text: content, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal,)),
        ]
      ),
    );
  }
}