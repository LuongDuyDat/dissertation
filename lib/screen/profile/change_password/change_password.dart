import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:learning_intern_support_system/component/button.dart';

import 'package:learning_intern_support_system/screen/profile/change_password/bloc/change_password_bloc.dart';
import 'package:learning_intern_support_system/screen/profile/change_password/bloc/change_password_state.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../../../component/input_field.dart';
import '../../../util/global.dart';
import '../../../util/navigate.dart';
import 'bloc/change_password_event.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChangePasswordBloc(),
      child: const ChangePasswordView(),
    );
  }
}

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final oldPasswordFieldKey = GlobalKey<FormBuilderFieldState>();
    final newPasswordFieldKey = GlobalKey<FormBuilderFieldState>();
    final rePasswordFieldKey = GlobalKey<FormBuilderFieldState>();
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
      body: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) {
          if (state.changePasswordStatus == ChangePasswordStatus.success) {
            Navigate.popPage(context);
          }
          if (state.changePasswordStatus == ChangePasswordStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 0.035 * screenHeight, left: 0.056 * screenWidth, right: 0.056 * screenWidth),
              child: FormBuilder(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(oldPasswordString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                    EditInputField(
                      formKey: oldPasswordFieldKey,
                      name: oldPasswordString,
                      obscure: !state.showPass,
                      style: Theme.of(context).textTheme.headlineMedium!,
                      suffixIcon: Icon(Icons.visibility, size: 0.025 * screenHeight,),
                      validator: FormBuilderValidators.minLength(6),
                      onSuffixIconTap: () {
                        context.read<ChangePasswordBloc>().add(const ChangePasswordShowPassChange());
                      },
                    ),
                    SizedBox(height: 0.028 * screenHeight),
                    Text(newPasswordString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                    EditInputField(
                      formKey: newPasswordFieldKey,
                      name: newPasswordString,
                      obscure: !state.showPass,
                      style: Theme.of(context).textTheme.headlineMedium!,
                      suffixIcon: Icon(Icons.visibility, size: 0.025 * screenHeight,),
                      validator: FormBuilderValidators.minLength(6),
                      onSuffixIconTap: () {
                        context.read<ChangePasswordBloc>().add(const ChangePasswordShowPassChange());
                      },
                    ),
                    SizedBox(height: 0.028 * screenHeight),
                    Text(reEnterPasswordString, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: hintLightText),),
                    EditInputField(
                      formKey: rePasswordFieldKey,
                      name: reEnterPasswordString,
                      obscure: !state.showPass,
                      style: Theme.of(context).textTheme.headlineMedium!,
                      suffixIcon: state.showPass ? Icon(Icons.visibility_off, size: 0.025*screenHeight,) : Icon(Icons.visibility, size: 0.025*screenHeight,),
                      validator: FormBuilderValidators.minLength(6),
                      onSuffixIconTap: () {
                        context.read<ChangePasswordBloc>().add(const ChangePasswordShowPassChange());
                      },
                    ),
                    SizedBox(height: 0.0864 * screenHeight,),
                    Center(
                      child: Button(
                        type: 0,
                        width: 0.58 * screenWidth,
                        height: 0.056 * screenHeight,
                        text: changePasswordString2,
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (formKey.currentState!.validate()) {
                            if (newPasswordFieldKey.currentState!.value == rePasswordFieldKey.currentState!.value) {
                              context.read<ChangePasswordBloc>().add(ChangePasswordSubmit(oldPassword: oldPasswordFieldKey.currentState!.value, newPassword: newPasswordFieldKey.currentState!.value));
                            } else {
                              context.read<ChangePasswordBloc>().add(ChangePasswordError(error: checkInputFieldString));
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}