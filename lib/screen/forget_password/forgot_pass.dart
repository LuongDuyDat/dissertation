import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:learning_intern_support_system/screen/forget_password/bloc/forgot_pass_bloc.dart';
import 'package:learning_intern_support_system/screen/forget_password/bloc/forgot_pass_event.dart';
import 'package:learning_intern_support_system/screen/forget_password/bloc/forgot_pass_state.dart';
import 'package:learning_intern_support_system/screen/register/register.dart';
import 'package:learning_intern_support_system/util/global.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import '../../component/button.dart';
import '../../component/input_field.dart';
import '../../util/navigate.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordBloc(),
      child: ForgotPassView(),
    );
  }

}

class ForgotPassView extends StatelessWidget {
  ForgotPassView({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      body: SingleChildScrollView(
        child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
          buildWhen: ((previous, current) {
            return previous.forgotPasswordStatus != current.forgotPasswordStatus;
          }),
          listenWhen: (previous, current) {
            return previous.forgotPasswordStatus != current.forgotPasswordStatus;
          },
          builder: (context, state) {
            return Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth,),
                child: FormBuilder(
                  key: _formKey,
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
                            name: emailString,
                            icon: const Icon(Icons.person),
                            initialValue: state.email,
                            hintText: emailString,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.email(),
                            ]),
                            onChange: (text) {
                              context.read<ForgotPasswordBloc>().add(ForgotPasswordEmailChange(email: text ?? ''));
                            },
                          ),
                          SizedBox(height: 0.004 * screenHeight),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigate.popAll(context);
                            },
                            child: Text(
                              backToSignInString,
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: primaryLightColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 0.04 * screenHeight),
                      state.forgotPasswordStatus == ForgotPasswordStatus.loading ?
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                        ),
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
                        width: double.infinity,
                        height: 0.056 * screenHeight,
                        text: sendToEmailString,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<ForgotPasswordBloc>().add(const ForgotPasswordSubmit());
                          }
                        },
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
                          Navigate.pushPageReplacement(context, const RegisterPage());
                        },
                      ),
                    ],
                  ),
                )
            );
          },
          listener: (context, state) {
            if (state.forgotPasswordStatus == ForgotPasswordStatus.success) {
              Navigate.popAll(context);
            }
            if (state.forgotPasswordStatus == ForgotPasswordStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
        ),
      ),
    );
  }

}