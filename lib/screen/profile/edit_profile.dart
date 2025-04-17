import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:learning_intern_support_system/component/dropdown_field.dart';
import 'package:learning_intern_support_system/component/input_field.dart';
import 'package:learning_intern_support_system/domain/entities/student.dart';
import 'package:learning_intern_support_system/util/navigate.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../util/global.dart';
import '../../util/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key, this.studentEntity,});

  final StudentEntity? studentEntity;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final fullNameFieldKey = GlobalKey<FormBuilderFieldState>();
    final emailFieldKey = GlobalKey<FormBuilderFieldState>();
    final dateOfBirthFieldKey = GlobalKey<FormBuilderFieldState>();
    final facultyFieldKey = GlobalKey<FormBuilderFieldState>();
    final classFieldKey = GlobalKey<FormBuilderFieldState>();
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
            onPressed: () {
              if (formKey.currentState!.validate()) {

              }
            },
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
              FormBuilder(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(fullNameString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                    EditInputField(
                      key: fullNameFieldKey,
                      name: fullNameString,
                      obscure: false,
                      style: Theme.of(context).textTheme.headlineMedium!,
                      initialText: studentEntity?.name ?? '',
                      validator: FormBuilderValidators.required(),
                    ),
                    SizedBox(height: 0.028 * screenHeight),
                    Text(emailString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                    EditInputField(
                      key: emailFieldKey,
                      name: emailString,
                      obscure: false,
                      style: Theme.of(context).textTheme.headlineMedium!,
                      initialText: studentEntity?.email ?? '',
                      suffixIcon: Icon(Icons.verified_user, size: 0.025 * screenHeight, color: Colors.green,),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    SizedBox(height: 0.028 * screenHeight),
                    Text(facultyString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                    DropDownField(
                      key: facultyFieldKey,
                      name: facultyString,
                      dropdownString: facultyDropDownString,
                      hintText: facultyString,
                      inputBorder: const UnderlineInputBorder(),
                      hintTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(color: hintLightText2),
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      iconSize: 0.05 * screenHeight,
                      validator: FormBuilderValidators.required(),
                    ),
                    SizedBox(height: 0.028 * screenHeight),
                    Text(classString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                    DropDownField(
                      key: classFieldKey,
                      name: classString,
                      dropdownString: classDropDownString,
                      hintText: studentEntity?.classId ?? '',
                      inputBorder: const UnderlineInputBorder(),
                      hintTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(color: hintLightText2),
                      textStyle: Theme.of(context).textTheme.headlineMedium,
                      iconSize: 0.05 * screenHeight,
                      validator: FormBuilderValidators.required(),
                    ),
                    SizedBox(height: 0.028 * screenHeight),
                    Text(dateOfBirthString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                    EditInputField(
                      key: dateOfBirthFieldKey,
                      name: dateOfBirthString,
                      obscure: false,
                      style: Theme.of(context).textTheme.headlineMedium!,
                      initialText: DateFormat('dd/MM/yyyy').format(studentEntity!.birthDay),
                      suffixIcon: Icon(Icons.calendar_month, size: 0.025 * screenHeight, color: Theme.of(context).primaryColor,),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.dateString(),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}