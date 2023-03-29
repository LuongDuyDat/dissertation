import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/component/button.dart';
import 'package:learning_intern_support_system/component/input_field.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 0.1 * screenHeight),
            Center(child: Image.asset('assets/images/logo.png', width: screenWidth * 0.4,),),
            SizedBox(height: 0.02 * screenHeight,),
            Text(loginString, style: Theme.of(context).textTheme.displayLarge,),
            SizedBox(height: 0.06 * screenHeight),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.064 * screenWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(emailString, style: Theme.of(context).textTheme.headlineSmall,),
                  SizedBox(height: 0.004 * screenHeight),
                  InputField(
                    icon: const Icon(Icons.person),
                    hintText: emailString,
                  ),
                  SizedBox(height: 0.03 * screenHeight,),
                  Text(passwordString, style: Theme.of(context).textTheme.headlineSmall,),
                  SizedBox(height: 0.004 * screenHeight),
                  InputField(
                    icon: const Icon(Icons.lock),
                    hintText: passwordString,
                  ),
                  SizedBox(height: 0.004 * screenHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        forgetPasswordString,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: primaryLightColor,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 0.075 * screenHeight),
                ],
              ),
            ),
            Button(
              type: 0,
              width: 0.58 * screenWidth,
              height: 0.056 * screenHeight,
              text: loginString,
            ),
            SizedBox(height: 0.01 * screenHeight),
            RichText(
              text: TextSpan(
                text: '$notHaveAccount ',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.normal,
                ),
                children: [
                  TextSpan(
                    text: registerNow,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: primaryLightColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }

}