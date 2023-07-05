import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:learning_intern_support_system/component/dropdown_field.dart';
import 'package:learning_intern_support_system/screen/register/bloc/register_bloc.dart';
import 'package:learning_intern_support_system/screen/register/bloc/register_event.dart';
import 'package:learning_intern_support_system/screen/register/bloc/register_state.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/navigate.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../../component/button.dart';
import '../../component/input_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(),
      child: const RegisterView(),
    );
  }
}

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundLightColor2,
        body: BlocConsumer<RegisterBloc, RegisterState>(
          buildWhen: ((previous, current) {
            return previous.registerStatus != current.registerStatus || previous.pageNumber != current.pageNumber;
          }),
          listenWhen: ((previous, current) {
            return previous.registerStatus != current.registerStatus;
          }),
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth),
                child: state.pageNumber == 0 ? registerForm0(context, state) : registerForm1(context, state),
              ),
            );
          },
          listener: (context, state){
            if (state.registerStatus == RegisterStatus.success) {
              Navigate.popAll(context);
            }
            if (state.registerStatus == RegisterStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
        ),
    );
  }

  Widget registerForm0(BuildContext context, RegisterState state) {
    final formKey = GlobalKey<FormBuilderState>();
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
                name: emailString,
                initialValue: state.email,
                icon: const Icon(Icons.person),
                hintText: emailString,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
                onChange: (text) {
                  context.read<RegisterBloc>().add(RegisterEmailChange(email: text ?? ''));
                },
              ),
              SizedBox(height: 0.03 * screenHeight,),
              Text(passwordString, style: Theme.of(context).textTheme.headlineSmall,),
              SizedBox(height: 0.004 * screenHeight),
              BlocBuilder<RegisterBloc, RegisterState>(
                buildWhen: ((previous, current) {
                  return previous.showPass != current.showPass;
                }),
                builder: (context, state) {
                  return InputField(
                    name: passwordString,
                    initialValue: state.password,
                    icon: const Icon(Icons.lock),
                    obscure: !state.showPass,
                    suffixIcon: state.showPass ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                    hintText: passwordString,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                    ]),
                    onChange: (text) {
                      context.read<RegisterBloc>().add(RegisterPasswordChange(password: text ?? ''));
                    },
                    onSuffixIconTap: () {
                      context.read<RegisterBloc>().add(const RegisterShowPassChange());
                    },
                  );
                },
              ),
              SizedBox(height: 0.03 * screenHeight,),
              Text(confirmPasswordString, style: Theme.of(context).textTheme.headlineSmall,),
              SizedBox(height: 0.004 * screenHeight),
              BlocBuilder<RegisterBloc, RegisterState>(
                buildWhen: ((previous, current) {
                  return previous.showRepass != current.showRepass;
                }),
                builder: (context, state) {
                  return InputField(
                    name: '${passwordString}2',
                    initialValue: state.rePassword,
                    icon: const Icon(Icons.lock,),
                    obscure: !state.showRepass,
                    suffixIcon: state.showRepass ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                    hintText: passwordString,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(6),
                    ]),
                    onChange: (text) {
                      context.read<RegisterBloc>().add(RegisterRePasswordChange(rePassword: text ?? ''));
                    },
                    onSuffixIconTap: () {
                      context.read<RegisterBloc>().add(const RegisterShowRePassChange());
                    },
                  );
                },
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
                context.read<RegisterBloc>().add(const RegisterOnNextClick());
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
              Navigate.popAll(context);
            },
          ),
        ],
      ),
    );
  }

  Widget registerForm1(BuildContext context, RegisterState state) {
    final formKey = GlobalKey<FormBuilderState>();
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
                name: fullNameString,
                initialValue: state.fullName,
                icon: const Icon(Icons.person),
                hintText: fullNameString,
                validator: FormBuilderValidators.required(),
                onChange: (text) {
                  context.read<RegisterBloc>().add(RegisterFullNameChange(fullName: text ?? ''));
                },
              ),
              SizedBox(height: 0.03 * screenHeight,),
              Text(studentIdString, style: Theme.of(context).textTheme.headlineSmall,),
              SizedBox(height: 0.004 * screenHeight),
              InputField(
                name: studentIdString,
                initialValue: state.studentId,
                icon: const Icon(Icons.credit_card),
                hintText: studentIdString,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
                onChange: (text) {
                  context.read<RegisterBloc>().add(RegisterStudentIdChange(studentId: text ?? ''));
                },
              ),
              SizedBox(height: 0.03 * screenHeight,),
              Text(classString, style: Theme.of(context).textTheme.headlineSmall,),
              SizedBox(height: 0.004 * screenHeight),
              DropDownField(
                name: classString,
                dropdownString: classDropDownString,
                initialValue: state.classID,
                hintText: classString,
                icon: const Icon(Icons.class_outlined,),
                validator: FormBuilderValidators.required(),
                onChange: (text) {
                  context.read<RegisterBloc>().add(RegisterClassChange(classID: text ?? ''));
                },
              ),
              SizedBox(height: 0.03 * screenHeight,),
              Text(facultyString, style: Theme.of(context).textTheme.headlineSmall,),
              SizedBox(height: 0.004 * screenHeight),
              DropDownField(
                name: facultyString,
                dropdownString: facultyDropDownString,
                initialValue: state.faculty,
                hintText: facultyString,
                icon: const Icon(Icons.account_balance,),
                validator: FormBuilderValidators.required(),
                onChange: (text) {
                  context.read<RegisterBloc>().add(RegisterFacultyChange(faculty: text ?? ''));
                },
              ),
              SizedBox(height: 0.06 * screenHeight),
            ],
          ),
          state.registerStatus == RegisterStatus.loading ?
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
            ),
            width: 0.58 * screenWidth,
            height: 0.056 * screenHeight,
            child: Center(
              child: SizedBox(
                width: 0.045 * screenHeight,
                height: 0.045 * screenHeight,
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white,),
                ),
              ),
            ),
          ) :
          Button(
            type: 0,
            width: 0.58 * screenWidth,
            height: 0.056 * screenHeight,
            text: signUpString,
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<RegisterBloc>().add(const RegisterOnSubmit());
              }
            },
          ),
          SizedBox(height: 0.03 * screenHeight),
          Button(
            type: 1,
            width: 0.58 * screenWidth,
            height: 0.056 * screenHeight,
            text: prevString,
            onPressed: () {
              context.read<RegisterBloc>().add(const RegisterOnPrevClick());
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
              Navigate.popAll(context);
            },
          ),
        ],
      ),
    );
  }
}