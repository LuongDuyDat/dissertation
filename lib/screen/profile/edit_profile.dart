import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/component/dropdown_field.dart';
import 'package:learning_intern_support_system/component/input_field.dart';
import 'package:learning_intern_support_system/util/navigate.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../util/global.dart';
import '../../util/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

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
        title: Text(editProfileString),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.save_alt),
          ),
          SizedBox(width: 0.03 * screenWidth,),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 0.055 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black54,
                      radius: 0.0648 * screenHeight,
                    ),
                    Positioned(
                      top: 0.081 * screenHeight,
                      left: 0.081 * screenHeight,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        radius: 0.027 * screenHeight,
                        child: Icon(Icons.camera_alt, color: backgroundLightColor2, size: 0.03 * screenHeight,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0.0475 * screenHeight,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fullNameString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                  EditInputField(
                    obscure: false,
                    style: Theme.of(context).textTheme.headlineMedium!,
                    initialText: 'Luong Duy Dat',
                  ),
                  SizedBox(height: 0.028 * screenHeight),
                  Text(emailString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                  EditInputField(
                    obscure: false,
                    style: Theme.of(context).textTheme.headlineMedium!,
                    initialText: '19020039@vnu.edu.vn',
                    suffixIcon: Icon(Icons.verified_user, size: 0.025 * screenHeight, color: Colors.green,),
                  ),
                  SizedBox(height: 0.028 * screenHeight),
                  Text(facultyString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                  DropDownField(
                    dropdownString: facultyDropDownString,
                    hintText: facultyString,
                    inputBorder: const UnderlineInputBorder(),
                    hintTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(color: hintLightText2),
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    iconSize: 0.05 * screenHeight,
                  ),
                  SizedBox(height: 0.028 * screenHeight),
                  Text(classString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                  DropDownField(
                    dropdownString: classDropDownString,
                    hintText: classString,
                    inputBorder: const UnderlineInputBorder(),
                    hintTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(color: hintLightText2),
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    iconSize: 0.05 * screenHeight,
                  ),
                  SizedBox(height: 0.028 * screenHeight),
                  Text(dateOfBirthString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                  EditInputField(
                    obscure: false,
                    style: Theme.of(context).textTheme.headlineMedium!,
                    initialText: '11/10/2001',
                    suffixIcon: Icon(Icons.calendar_month, size: 0.025 * screenHeight, color: Theme.of(context).primaryColor,),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}