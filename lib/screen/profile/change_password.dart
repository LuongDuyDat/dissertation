import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/component/button.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../../component/input_field.dart';
import '../../util/global.dart';
import '../../util/navigate.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

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
        title: Text(changePasswordString2),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 0.035 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(oldPasswordString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
              EditInputField(
                obscure: true,
                style: Theme.of(context).textTheme.headlineMedium!,
                suffixIcon: Icon(Icons.visibility, size: 0.025 * screenHeight,),
              ),
              SizedBox(height: 0.028 * screenHeight),
              Text(newPasswordString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
              EditInputField(
                obscure: true,
                style: Theme.of(context).textTheme.headlineMedium!,
                suffixIcon: Icon(Icons.visibility, size: 0.025 * screenHeight,),
              ),
              SizedBox(height: 0.028 * screenHeight),
              Text(reEnterPasswordString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
              EditInputField(
                obscure: true,
                style: Theme.of(context).textTheme.headlineMedium!,
                suffixIcon: Icon(Icons.visibility, size: 0.025 * screenHeight,),
              ),
              SizedBox(height: 0.0864 * screenHeight,),
              Center(
                child: Button(
                  type: 0,
                  width: 0.58 * screenWidth,
                  height: 0.056 * screenHeight,
                  text: changePasswordString2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}