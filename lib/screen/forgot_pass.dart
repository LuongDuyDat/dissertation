import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/screen/register.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../component/button.dart';
import '../component/input_field.dart';
import '../util/navigate.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0.06 * screenHeight,),
                  IconButton(
                    icon: const Icon(Icons.arrow_back,),
                    iconSize: 30,
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigate.popPage(context);
                    },
                  ),
                  SizedBox(height: 0.04 * screenHeight,),
                  Text(forgotPasswordString, style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center,),
                  SizedBox(height: 0.05 * screenHeight,),
                  Text(enterEmailString, style: Theme.of(context).textTheme.headlineSmall,),
                  SizedBox(height: 0.004 * screenHeight),
                  InputField(
                    icon: const Icon(Icons.person),
                    hintText: emailString,
                  ),
                  SizedBox(height: 0.004 * screenHeight),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    backToSignInString,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: primaryLightColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.04 * screenHeight),
              Button(
                type: 0,
                width: double.infinity,
                height: 0.056 * screenHeight,
                text: sendToEmailString,
              ),
              SizedBox(height: 0.05 * screenHeight),
              Text(orString, style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700),),
              SizedBox(height: 0.05 * screenHeight),
              Button(
                type: 1,
                width: double.infinity,
                height: 0.056 * screenHeight,
                text: signUpString,
                onPressed: () {
                  Navigate.pushPage(context, const RegisterPage(number: 0));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}