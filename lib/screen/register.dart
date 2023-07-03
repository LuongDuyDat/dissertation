import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:learning_intern_support_system/component/dropdown_field.dart';
import 'package:learning_intern_support_system/screen/login.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/navigate.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../component/button.dart';
import '../component/input_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key, required this.number,});

  final int number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth),
          child: number == 0 ? registerForm0(context) : registerForm1(context),
        ),
      )
    );
  }

  Widget registerForm0(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final emailFieldKey = GlobalKey<FormBuilderFieldState>();
    final passwordFieldKey = GlobalKey<FormBuilderFieldState>();
    final rePasswordFieldKey = GlobalKey<FormBuilderFieldState>();
    return FormBuilder(
      key: formKey,
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
              Text(createAccountString, style: Theme.of(context).textTheme.displayLarge,),
              SizedBox(height: 0.004 * screenHeight,),
              Text(
                infoAccountString,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: hintLightText2, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 0.078 * screenHeight,),
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
              SizedBox(height: 0.03 * screenHeight,),
              Text(confirmPasswordString, style: Theme.of(context).textTheme.headlineSmall,),
              SizedBox(height: 0.004 * screenHeight),
              InputField(
                key: rePasswordFieldKey,
                name: passwordString,
                icon: const Icon(Icons.lock, ),
                hintText: passwordString,
                validator: FormBuilderValidators.required(),
              ),
              SizedBox(height: 0.11 * screenHeight),
            ],
          ),
          Button(
            type: 0,
            width: 0.58 * screenWidth,
            height: 0.056 * screenHeight,
            text: nextString,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigate.pushPage(context, const RegisterPage(number: 1));
              }
            },
          ),
          SizedBox(height: 0.01 * screenHeight),
          InkWell(
            child: Text(
              alreadyHaveAccount,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.normal,
                color: primaryLightColor,
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () {
              Navigate.pushPage(context, const LoginPage());
            },
          ),
        ],
      ),
    );
  }

  Widget registerForm1(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final fullNameFieldKey = GlobalKey<FormBuilderFieldState>();
    final idFieldKey = GlobalKey<FormBuilderFieldState>();
    final classFieldKey = GlobalKey<FormBuilderFieldState>();
    final facultyFieldKey = GlobalKey<FormBuilderFieldState>();
    return FormBuilder(
      key: formKey,
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
              Text(createAccountString, style: Theme.of(context).textTheme.displayLarge,),
              SizedBox(height: 0.004 * screenHeight,),
              Text(
                infoPersonalString,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: hintLightText2, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 0.05 * screenHeight,),
              Text(fullNameString, style: Theme.of(context).textTheme.headlineSmall,),
              SizedBox(height: 0.004 * screenHeight),
              InputField(
                key: fullNameFieldKey,
                name: fullNameString,
                icon: const Icon(Icons.person),
                hintText: fullNameString,
                validator: FormBuilderValidators.required(),
              ),
              SizedBox(height: 0.03 * screenHeight,),
              Text(studentIdString, style: Theme.of(context).textTheme.headlineSmall,),
              SizedBox(height: 0.004 * screenHeight),
              InputField(
                key: idFieldKey,
                name: studentIdString,
                icon: const Icon(Icons.credit_card),
                hintText: studentIdString,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              ),
              SizedBox(height: 0.03 * screenHeight,),
              Text(classString, style: Theme.of(context).textTheme.headlineSmall,),
              SizedBox(height: 0.004 * screenHeight),
              DropDownField(
                key: classFieldKey,
                name: classString,
                dropdownString: classDropDownString,
                hintText: classString,
                icon: const Icon(Icons.class_outlined,),
                validator: FormBuilderValidators.required(),
              ),
              SizedBox(height: 0.03 * screenHeight,),
              Text(facultyString, style: Theme.of(context).textTheme.headlineSmall,),
              SizedBox(height: 0.004 * screenHeight),
              DropDownField(
                key: facultyFieldKey,
                name: facultyString,
                dropdownString: facultyDropDownString,
                hintText: facultyString,
                icon: const Icon(Icons.account_balance,),
                validator: FormBuilderValidators.required(),
              ),
              SizedBox(height: 0.08 * screenHeight),
            ],
          ),
          Button(
            type: 0,
            width: 0.58 * screenWidth,
            height: 0.056 * screenHeight,
            text: signUpString,
            onPressed: () {
              if (formKey.currentState!.validate()) {

              }
            },
          ),
          SizedBox(height: 0.01 * screenHeight),
          InkWell(
            child: Text(
              alreadyHaveAccount,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.normal,
                color: primaryLightColor,
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () {
              Navigate.pushPage(context, const LoginPage());
            },
          ),
        ],
      ),
    );
  }
}