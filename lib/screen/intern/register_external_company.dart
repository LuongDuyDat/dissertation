import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../component/button.dart';
import '../../component/input_field.dart';
import '../../util/global.dart';
import '../../util/navigate.dart';
import '../../util/theme.dart';

class RegisterExternalCompanyPage extends StatelessWidget {
  const RegisterExternalCompanyPage({super.key});

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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 0.01 * screenHeight,),
            Text(internshipRegisterString, style: Theme.of(context).textTheme.displayLarge,),
            SizedBox(height: 0.004 * screenHeight,),
            Text(trainingProgramString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText, fontWeight: FontWeight.w700),),
          ],
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 0.032 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(companyNameString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
            EditInputField(
              obscure: false,
              style: Theme.of(context).textTheme.headlineMedium!,
              hintText: companyNameString,
            ),
            SizedBox(height: 0.028 * screenHeight),
            Text(emailContactString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
            EditInputField(
              obscure: false,
              style: Theme.of(context).textTheme.headlineMedium!,
              hintText: emailContactString,
            ),
            SizedBox(height: 0.028 * screenHeight),
            Text(phoneNumberContactString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
            EditInputField(
              obscure: false,
              style: Theme.of(context).textTheme.headlineMedium!,
              hintText: phoneNumberContactString,
            ),
            SizedBox(height: 0.028 * screenHeight),
            Text(websiteString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
            EditInputField(
              obscure: false,
              style: Theme.of(context).textTheme.headlineMedium!,
              hintText: websiteString,
            ),
            SizedBox(height: 0.0648 * screenHeight,),
            Align(
              alignment: Alignment.center,
              child: Button(
                type: 0,
                width: 0.58 * screenWidth,
                height: 0.056 * screenHeight,
                text: signUpString,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
  
}