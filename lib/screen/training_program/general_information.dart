import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

class GeneralInformationPage extends StatelessWidget {
  const GeneralInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 0.04 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$trainingProgramNameString:', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800),),
          SizedBox(height: 0.0095 * screenHeight,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 0.07 * screenWidth,),
              CircleAvatar(
                radius: 0.002 * screenHeight,
                backgroundColor: hintLightText,
              ),
              SizedBox(width: 0.03 * screenWidth,),
              RichText(
                text: TextSpan(
                    text: '$vietnameseString:',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800),
                    children: [
                      TextSpan(
                        text: ' Cong nghe thong tin',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ]
                ),
              ),
            ],
          ),
          SizedBox(height: 0.0095 * screenHeight,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 0.07 * screenWidth,),
              CircleAvatar(
                radius: 0.002 * screenHeight,
                backgroundColor: hintLightText,
              ),
              SizedBox(width: 0.03 * screenWidth,),
              RichText(
                text: TextSpan(
                    text: '$englishString:',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800),
                    children: [
                      TextSpan(
                        text: ' Information Technology',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ]
                ),
              ),
            ],
          ),
          SizedBox(height: 0.04 * screenHeight,),
          RichText(
            text: TextSpan(
                text: '$trainingProgramIdString:',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800),
                children: [
                  TextSpan(
                    text: ' 7480201',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.normal),
                  ),
                ]
            ),
          ),
          SizedBox(height: 0.04 * screenHeight,),
          RichText(
            text: TextSpan(
                text: '$trainingTimeString:',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800),
                children: [
                  TextSpan(
                    text: ' 7480201',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.normal),
                  ),
                ]
            ),
          ),
          SizedBox(height: 0.04 * screenHeight,),
          Text('$diplomaString:', style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800),),
          SizedBox(height: 0.0095 * screenHeight,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 0.07 * screenWidth,),
              SizedBox(
                height: Theme.of(context).textTheme.titleMedium!.fontSize! + 0.00648 * screenHeight,
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 0.002 * screenHeight,
                    backgroundColor: hintLightText,
                  ),
                ),
              ),
              SizedBox(width: 0.03 * screenWidth,),
              Text(
                '$vietnameseString:',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800,),
              ),
              SizedBox(width: 0.012 * screenWidth,),
              SizedBox(
                width: 0.567 * screenWidth,
                child: Text(
                  'Cử nhân ngành Công nghệ Thông tin',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
          SizedBox(height: 0.0095 * screenHeight,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 0.07 * screenWidth,),
              SizedBox(
                height: Theme.of(context).textTheme.titleMedium!.fontSize! + 0.00648 * screenHeight,
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 0.002 * screenHeight,
                    backgroundColor: hintLightText,
                  ),
                ),
              ),
              SizedBox(width: 0.03 * screenWidth,),
              Text(
                '$englishString:',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w800,),
              ),
              SizedBox(width: 0.012 * screenWidth,),
              SizedBox(
                width: 0.567 * screenWidth,
                child: Text(
                  'The Degree of Bachelor in Information Technology',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
          SizedBox(height: 0.04 * screenHeight,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$unitString:',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w800),
              ),
              SizedBox(width: 0.02 * screenWidth,),
              SizedBox(
                width: 0.7 * screenWidth,
                child: Text(
                  'Trường Đại học Công nghệ, ĐHQGHN',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.normal),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

}