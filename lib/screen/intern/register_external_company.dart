import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
    final formKey = GlobalKey<FormBuilderState>();
    final companyNameFieldKey = GlobalKey<FormBuilderFieldState>();
    final emailContactFieldKey = GlobalKey<FormBuilderFieldState>();
    final phoneNumberContactFieldKey = GlobalKey<FormBuilderFieldState>();
    final websiteFieldKey = GlobalKey<FormBuilderFieldState>();
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
        child: FormBuilder(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(companyNameString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
              EditInputField(
                key: companyNameFieldKey,
                name: companyNameString,
                obscure: false,
                style: Theme.of(context).textTheme.headlineMedium!,
                hintText: companyNameString,
                validator: FormBuilderValidators.required(),
              ),
              SizedBox(height: 0.028 * screenHeight),
              Text(emailContactString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
              EditInputField(
                key: emailContactFieldKey,
                name: emailContactString,
                obscure: false,
                style: Theme.of(context).textTheme.headlineMedium!,
                hintText: emailContactString,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              SizedBox(height: 0.028 * screenHeight),
              Text(phoneNumberContactString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
              EditInputField(
                key: phoneNumberContactFieldKey,
                name: phoneNumberContactString,
                obscure: false,
                style: Theme.of(context).textTheme.headlineMedium!,
                hintText: phoneNumberContactString,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              ),
              SizedBox(height: 0.028 * screenHeight),
              Text(websiteString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
              EditInputField(
                key: websiteFieldKey,
                name: websiteString,
                obscure: false,
                style: Theme.of(context).textTheme.headlineMedium!,
                hintText: websiteString,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.url(),
                ]),
              ),
              SizedBox(height: 0.0648 * screenHeight,),
              Align(
                alignment: Alignment.center,
                child: Button(
                  type: 0,
                  width: 0.58 * screenWidth,
                  height: 0.056 * screenHeight,
                  text: signUpString,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {

                    }
                  },
                ),
              )
            ],
          ),
        )
      ),
    );
  }
  
}