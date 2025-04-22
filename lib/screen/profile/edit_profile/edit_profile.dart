import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:learning_intern_support_system/component/dropdown_field.dart';
import 'package:learning_intern_support_system/component/input_field.dart';
import 'package:learning_intern_support_system/component/text_underline.dart';
import 'package:learning_intern_support_system/domain/entities/student.dart';
import 'package:learning_intern_support_system/screen/profile/edit_profile/bloc/edit_profile_bloc.dart';
import 'package:learning_intern_support_system/screen/profile/edit_profile/bloc/edit_profile_event.dart';
import 'package:learning_intern_support_system/screen/profile/edit_profile/bloc/edit_profile_state.dart';
import 'package:learning_intern_support_system/util/navigate.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../../util/api_urls.dart';
import '../../../util/global.dart';
import '../../../util/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key, this.studentEntity,});

  final StudentEntity? studentEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditProfileBloc(),
      child: EditProfileView(studentEntity: studentEntity,),
    );
  }
}

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, this.studentEntity,});

  final StudentEntity? studentEntity;

  Future<File?> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final fullNameFieldKey = GlobalKey<FormBuilderFieldState>();
    final emailFieldKey = GlobalKey<FormBuilderFieldState>();
    final facultyFieldKey = GlobalKey<FormBuilderFieldState>();
    final classFieldKey = GlobalKey<FormBuilderFieldState>();
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigate.popPage(context, true);
          },
        ),
        title: Text(editProfileString),
        actions: [
          BlocBuilder<EditProfileBloc, EditProfileState>(
            builder: (context, state) {
              if (state.editProfileStatus == EditProfileStatus.loading) {
                return Transform.scale(
                  scale: 0.5,
                  child: const CircularProgressIndicator(),
                );
              }
              return IconButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<EditProfileBloc>().add(
                      EditProfileSubmit(
                        fullName: fullNameFieldKey.currentState!.value,
                        classId: classFieldKey.currentState!.value,
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.save_alt),
              );
            },
          ),
          SizedBox(width: 0.03 * screenWidth,),
        ],
        elevation: 0,
      ),
      body: BlocListener<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
          if (state.editProfileStatus == EditProfileStatus.success) {
            Navigate.popPage(context, true);
          }
          if (state.editProfileStatus == EditProfileStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 0.055 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                    child: InkWell(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          BlocBuilder<EditProfileBloc, EditProfileState>(
                            builder: (context, state) {
                              if (state.avatar != null) {
                                return CircleAvatar(
                                  backgroundColor: Colors.black54,
                                  radius: 0.0648 * screenHeight,
                                  backgroundImage: FileImage(state.avatar!) // If local file exists, use FileImage
                                );
                              }
                              return CircleAvatar(
                                  backgroundColor: Colors.black54,
                                  radius: 0.0648 * screenHeight,
                                  backgroundImage: studentEntity!.avatarPath.isNotEmpty
                                      ? NetworkImage(ApiUrls.baseURL + studentEntity!.avatarPath.replaceFirst("public/", "")) // If avatarPath is not empty, use NetworkImage
                                      : null,
                              );
                            },
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
                      onTap: () async{
                        final currentContext = context;
                        File? avatar = await _pickImage();

                        if (avatar != null) {
                          currentContext.read<EditProfileBloc>().add(EditProfilePickImage(avatar: avatar));
                        }
                      },
                    )
                ),
                SizedBox(height: 0.0475 * screenHeight,),
                FormBuilder(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(fullNameString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                      EditInputField(
                        formKey: fullNameFieldKey,
                        name: fullNameString,
                        obscure: false,
                        style: Theme.of(context).textTheme.headlineMedium!,
                        initialText: studentEntity?.name ?? '',
                        validator: FormBuilderValidators.required(),
                      ),
                      SizedBox(height: 0.028 * screenHeight),
                      Text(emailString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                      EditInputField(
                        formKey: emailFieldKey,
                        name: emailString,
                        readOnly: true,
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
                        formKey: facultyFieldKey,
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
                      EditInputField(
                        formKey: classFieldKey,
                        name: classString,
                        obscure: false,
                        initialText: studentEntity?.classId ?? '',
                        style: Theme.of(context).textTheme.headlineMedium!,
                        validator: FormBuilderValidators.required(),
                      ),
                      SizedBox(height: 0.028 * screenHeight),
                      Text(dateOfBirthString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                      BlocBuilder<EditProfileBloc, EditProfileState>(
                        buildWhen: (previous, current) {
                          return previous.birthDay != current.birthDay;
                        },
                        builder: (context, state) {
                          return GestureDetector(
                            child: TextUnderline(
                              style: Theme.of(context).textTheme.headlineMedium!,
                              dateTime: state.birthDay != null ? DateFormat('yyyy-MM-dd').format(state.birthDay!) : DateFormat('yyyy-MM-dd').format(studentEntity!.birthDay),
                              suffixIcon: Icon(Icons.calendar_month, size: 0.025 * screenHeight, color: Theme.of(context).primaryColor,),
                            ),
                            onTap: () async {
                              BuildContext currentContext = context;
                              final DateTime? result = await showDatePicker(
                                context: context,
                                cancelText: cancelString,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.utc(1990, 10, 16),
                                lastDate: DateTime.utc(2030, 3, 14),
                              );
                              if (result != null) {
                                currentContext.read<EditProfileBloc>().add(EditProfilePickBirthDay(birthDay: result));
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}