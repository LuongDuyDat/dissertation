import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/component/list_tile.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:readmore/readmore.dart';

import '../../component/post.dart';
import '../../util/global.dart';
import '../../util/navigate.dart';
import '../../util/theme.dart';

class CompanyProfile extends StatelessWidget {
  const CompanyProfile({super.key, required this.name});

  final String name;

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
        title: Text(name, style: Theme.of(context).textTheme.displayMedium,),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 0.086 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black54,
                radius: 0.0648 * screenHeight,
              ),
              SizedBox(height: 0.018 * screenHeight,),
              Text(name, style: Theme.of(context).textTheme.displaySmall,),
              SizedBox(height: 0.006 * screenHeight,),
              Text('Cong ty phan mem', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500,),),
              SizedBox(height: 0.045 * screenHeight,),
              MoreListTile(title: contactInformationString, icon: Icon(Icons.keyboard_arrow_down, size: 0.04 * screenHeight,)),
              Padding(
                padding: EdgeInsets.only(top: 0.029 * screenHeight, left: 0.046 * screenWidth, right: 0.046 * screenWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: '$telephoneString: ',
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                              text: '+84 123 456 789',
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.normal),
                            ),
                          ]
                      ),
                    ),
                    SizedBox(height: 0.016 * screenHeight,),
                    RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: '$emailString: ',
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                              text: 'companyA@gmail.com',
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.normal),
                            ),
                          ]
                      ),
                    ),
                    SizedBox(height: 0.016 * screenHeight,),
                    RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(
                              text: '$headOfficeString: ',
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(
                              text: 'Số 1 - Toà A - Chung cư B - Phường C - Quận D - Hà Nội',
                              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.normal,),

                            ),
                          ]
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.0356 * screenHeight,),
              MoreListTile(title: introductionString, icon: Icon(Icons.keyboard_arrow_down, size: 0.04 * screenHeight,)),
              Padding(
                padding: EdgeInsets.only(top: 0.029 * screenHeight, left: 0.046 * screenWidth, right: 0.046 * screenWidth),
                child: ReadMoreText(
                  'Trang bị những kiến thức cơ bản và chuyên sâu về Công nghệ thông tin. Các kiến thức này được nâng cao và một số trong đó đạt đến trình độ. Các kiến thức này được nâng cao và một số trong đó đạt đến trình độ.\n       Trang bị những kiến thức cơ bản và chuyên sâu về Công nghệ thông tin. Các kiến thức này được nâng cao và một số trong đó đạt đến trình độ.',
                  preDataText: '    ',
                  trimLines: 4,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: showMoreString,
                  trimExpandedText: showLessString,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500,),
                  preDataTextStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500,),
                  moreStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor),
                  lessStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800, color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(height: 0.0356 * screenHeight,),
              MoreListTile(title: recruitmentPostString, icon: Icon(Icons.keyboard_arrow_down, size: 0.04 * screenHeight,)),
              ListView(
                padding: EdgeInsets.only(top: 0.022 * screenHeight),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Post(
                    type: 1,
                    author: 'Công ty cổ phần FPT',
                    date: DateTime.now(),
                    image: 'assets/images/post_image.jpg',
                    status: signUpString,
                    title: 'Tuyển thực tập sinh Web Frontend',
                  ),
                  SizedBox(height: 0.037 * screenHeight,),
                  Post(
                    type: 1,
                    author: 'Công ty cổ phần FPT',
                    date: DateTime.now(),
                    image: 'assets/images/post_image.jpg',
                    status: signUpString,
                    title: 'Tuyển thực tập sinh Web Frontend',
                  ),
                  SizedBox(height: 0.037 * screenHeight,),
                  Post(
                    type: 1,
                    author: 'Công ty cổ phần FPT',
                    date: DateTime.now(),
                    image: 'assets/images/post_image.jpg',
                    status: signUpString,
                    title: 'Tuyển thực tập sinh Web Frontend',
                  ),
                  SizedBox(height: 0.037 * screenHeight,),
                  Post(
                    type: 1,
                    author: 'Công ty cổ phần FPT',
                    date: DateTime.now(),
                    image: 'assets/images/post_image.jpg',
                    status: signUpString,
                    title: 'Tuyển thực tập sinh Web Frontend',
                  ),
                ],
              ),
              SizedBox(height: 0.04 * screenHeight,),
            ],
          ),
        ),
      ),
    );
  }

}