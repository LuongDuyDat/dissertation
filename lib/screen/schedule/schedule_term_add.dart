import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../component/button.dart';
import '../../component/input_field.dart';
import '../../util/global.dart';
import '../../util/navigate.dart';
import '../../util/theme.dart';

class TermAddPage extends StatelessWidget {
  const TermAddPage({super.key});

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
        title: Text(addTermString),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0.035 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(termString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
            SizedBox(height: 0.004 * screenHeight,),
            SizedBox(
              height: 0.06 * screenHeight,
              child: InputField(
                icon: Icon(Icons.title, size: 0.03 * screenHeight,),
                hintText: termString,
                hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                textStyle: Theme.of(context).textTheme.bodyLarge,
                obscure: false,
                inputBorder: const UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 0.02 * screenHeight,),
            Text(startString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
            SizedBox(height: 0.004 * screenHeight,),
            SizedBox(
              height: 0.06 * screenHeight,
              //todo: date picker
              child: InputField(
                icon: Icon(Icons.calendar_month, size: 0.03 * screenHeight,),
                hintText: startString,
                hintTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: hintLightText2),
                textStyle: Theme.of(context).textTheme.bodyLarge,
                obscure: false,
                inputBorder: const UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 0.02 * screenHeight,),
            Text(endString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
            SizedBox(height: 0.004 * screenHeight,),
            SizedBox(
              height: 0.06 * screenHeight,
              //todo: date picker
              child: InputField(
                icon: Icon(Icons.calendar_month, size: 0.03 * screenHeight,),
                hintText: endString,
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