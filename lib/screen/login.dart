import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:learning_intern_support_system/component/button.dart';
import 'package:learning_intern_support_system/component/input_field.dart';
import 'package:learning_intern_support_system/screen/forgot_pass.dart';
import 'package:learning_intern_support_system/screen/persistent_bottom_nav_bar.dart';
import 'package:learning_intern_support_system/screen/register.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/navigate.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    final formKey = GlobalKey<FormBuilderState>();
    final emailFieldKey = GlobalKey<FormBuilderFieldState>();
    final passwordFieldKey = GlobalKey<FormBuilderFieldState>();
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
            FormBuilder(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(emailString, style: Theme.of(context).textTheme.headlineSmall,),
                    SizedBox(height: 0.004 * screenHeight),
                    InputField(
                      key: emailFieldKey,
                      name: emailString,
                      icon: const Icon(Icons.person),
                      hintText: emailString,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    SizedBox(height: 0.03 * screenHeight,),
                    Text(passwordString, style: Theme.of(context).textTheme.headlineSmall,),
                    SizedBox(height: 0.004 * screenHeight),
                    InputField(
                      key: passwordFieldKey,
                      name: passwordString,
                      icon: const Icon(Icons.lock),
                      hintText: passwordString,
                      validator: FormBuilderValidators.required(),
                    ),
                    SizedBox(height: 0.004 * screenHeight),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Text(
                            forgetPasswordString,
                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.normal,
                              color: primaryLightColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {
                            Navigate.pushPage(context, const ForgotPassPage());
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 0.075 * screenHeight),
                    Align(
                      alignment: Alignment.center,
                      child: Button(
                        type: 0,
                        width: 0.58 * screenWidth,
                        height: 0.056 * screenHeight,
                        text: loginString,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Navigate.pushPage(context, const PersistentNavbar());
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 0.01 * screenHeight),
            RichText(
              text: TextSpan(
                text: '$notHaveAccountString ',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.normal,
                ),
                children: [
                  TextSpan(
                    text: registerNowString,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: primaryLightColor,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      Navigate.pushPage(context, const RegisterPage(number: 0));
                    }
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