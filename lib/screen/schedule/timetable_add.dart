import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/component/input_field.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../../component/button.dart';
import '../../component/dropdown_field.dart';
import '../../util/global.dart';
import '../../util/navigate.dart';

class TimetableAddPage extends StatelessWidget {
  const TimetableAddPage({super.key});

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
        title: Text(addTimetableString),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0.035 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(categoryString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
            SizedBox(
              height: 0.06 * screenHeight,
              child: DropDownField(
                icon: Icon(Icons.school, size: 0.03 * screenHeight,),
                dropdownString: categoryDropDownString,
                hintText: categoryString,
                inputBorder: const UnderlineInputBorder(),
                hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                textStyle: Theme.of(context).textTheme.bodyLarge,
                iconSize: 0.05 * screenHeight,
              ),
            ),
            SizedBox(height: 0.0324 * screenHeight,),
            Text(subjectNameString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
            SizedBox(
              height: 0.06 * screenHeight,
              child: InputField(
                icon: Icon(Icons.title, size: 0.03 * screenHeight,),
                hintText: subjectNameString,
                hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                textStyle: Theme.of(context).textTheme.bodyLarge,
                obscure: false,
                inputBorder: const UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 0.02 * screenHeight,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fromString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                    SizedBox(
                      height: 0.06 * screenHeight,
                      width: 0.418 * screenWidth,
                      //timepicker
                      child: DropDownField(
                        icon: Icon(Icons.timer, size: 0.03 * screenHeight,),
                        dropdownString: categoryDropDownString,
                        hintText: fromString,
                        inputBorder: const UnderlineInputBorder(),
                        hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        iconSize: 0.05 * screenHeight,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(toString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                    //time picker
                    SizedBox(
                      height: 0.06 * screenHeight,
                      width: 0.418 * screenWidth,
                      child: DropDownField(
                        icon: Icon(Icons.timer, size: 0.03 * screenHeight,),
                        dropdownString: categoryDropDownString,
                        hintText: toString,
                        inputBorder: const UnderlineInputBorder(),
                        hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                        textStyle: Theme.of(context).textTheme.bodyLarge,
                        iconSize: 0.05 * screenHeight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 0.0324 * screenHeight,),
            Text(lecturerString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
            SizedBox(
              height: 0.06 * screenHeight,
              child: InputField(
                icon: Icon(Icons.person, size: 0.03 * screenHeight,),
                hintText: lecturerString,
                hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                textStyle: Theme.of(context).textTheme.bodyLarge,
                obscure: false,
                inputBorder: const UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 0.0324 * screenHeight,),
            Text(locationString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
            SizedBox(
              height: 0.06 * screenHeight,
              child: InputField(
                icon: Icon(Icons.title, size: 0.03 * screenHeight,),
                hintText: locationString,
                hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                textStyle: Theme.of(context).textTheme.bodyLarge,
                obscure: false,
                inputBorder: const UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 0.0648 * screenHeight,),
            Align(
              alignment: Alignment.center,
              child: Button(
                type: 0,
                width: 0.58 * screenWidth,
                height: 0.056 * screenHeight,
                text: addString,
                onPressed: () {

                },
              ),
            )
          ],
        ),
      ),
    );
  }

}