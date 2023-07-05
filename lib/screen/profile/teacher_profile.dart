import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../component/module_tile.dart';
import '../../model/module_model.dart';
import '../../util/global.dart';
import '../../util/navigate.dart';
import '../../util/theme.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({super.key, required this.name});

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
              Text('Tien si', style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500,),),
              SizedBox(height: 0.018 * screenHeight,),
              Divider(thickness: 1, color: textLightColor, height: 3,),
              SizedBox(height: 0.018 * screenHeight,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  personalInformationString,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(height: 0.015 * screenHeight,),
              Container(
                width: 0.79 * screenWidth,
                height: 0.15 * screenHeight,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(0.0324 * screenHeight),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.04 * screenWidth, vertical: 0.019 * screenHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: textLightColor,
                            radius: 0.002 * screenHeight,
                          ),
                          SizedBox(width: 0.018 * screenWidth,),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '$telephoneString: ',
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
                                ),
                                TextSpan(
                                  text: '+84 123 456 789',
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal),
                                ),
                              ]
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: textLightColor,
                            radius: 0.002 * screenHeight,
                          ),
                          SizedBox(width: 0.018 * screenWidth,),
                          RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '$faxString: ',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text: '+84 123 456 789',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal),
                                  ),
                                ]
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: textLightColor,
                            radius: 0.002 * screenHeight,
                          ),
                          SizedBox(width: 0.018 * screenWidth,),
                          RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '$emailString: ',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text: 'teachera@vnu.edu.vn',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal),
                                  ),
                                ]
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: textLightColor,
                            radius: 0.002 * screenHeight,
                          ),
                          SizedBox(width: 0.018 * screenWidth,),
                          RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '$facultyString: ',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  TextSpan(
                                    text: 'Công nghệ thông tin',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal),
                                  ),
                                ]
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 0.0324 * screenHeight,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  moduleInChargeString,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(height: 0.015 * screenHeight,),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.center,
                    child: ModuleTile(
                      moduleId: moduleList.elementAt(index).moduleId,
                      moduleName: moduleList.elementAt(index).moduleName,
                      numberOfCredit: moduleList.elementAt(index).creditNumber,
                      type: moduleList.elementAt(index).type,
                    ),
                  );
                },
                itemCount: moduleList.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 0.0194 * screenHeight,);
                },
              ),
              SizedBox(height: 0.03 * screenHeight,),
            ],
          ),
        ),
      ),
    );
  }

}