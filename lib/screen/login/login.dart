import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:learning_intern_support_system/component/button.dart';
import 'package:learning_intern_support_system/component/input_field.dart';
import 'package:learning_intern_support_system/screen/app/bloc/app_bloc.dart';
import 'package:learning_intern_support_system/screen/app/bloc/app_event.dart';
import 'package:learning_intern_support_system/screen/login/bloc/login_bloc.dart';
import 'package:learning_intern_support_system/screen/login/bloc/login_event.dart';
import 'package:learning_intern_support_system/screen/login/bloc/login_state.dart';
import 'package:learning_intern_support_system/screen/register/register.dart';
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
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: LoginView(),
    );
  }

}

class LoginView extends StatelessWidget {
  LoginView({super.key,});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLightColor2,
      body: BlocConsumer<LoginBloc, LoginState>(
        listenWhen: ((previous, current) {
          return previous.loginStatus != current.loginStatus;
        }),
        buildWhen: ((previous, current) {
          return previous.loginStatus != current.loginStatus;
        }),
        listener: (context, state) {
          if (state.loginStatus == LoginStatus.success) {
            context.read<AppBloc>().add(const AppAuthenticating());
          }
          if (state.loginStatus == LoginStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              SizedBox(height: 0.1 * screenHeight),
              Center(child: Image.asset('assets/images/logo.png', width: screenWidth * 0.4,),),
              SizedBox(height: 0.02 * screenHeight,),
              Text(loginString, style: Theme.of(context).textTheme.displayLarge,),
              SizedBox(height: 0.06 * screenHeight),
              FormBuilder(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.056 * screenWidth),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(emailString, style: Theme.of(context).textTheme.headlineSmall,),
                      SizedBox(height: 0.004 * screenHeight),
                      InputField(
                        name: emailString,
                        icon: const Icon(Icons.person),
                        hintText: emailString,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                        onChange: (String? text) {
                          context.read<LoginBloc>().add(LoginEmailChange(email: text ?? ''));
                        },
                      ),
                      SizedBox(height: 0.03 * screenHeight,),
                      Text(passwordString, style: Theme.of(context).textTheme.headlineSmall,),
                      SizedBox(height: 0.004 * screenHeight),
                      BlocBuilder<LoginBloc, LoginState>(
                        buildWhen: ((previous, current) {
                          return previous.showPass != current.showPass;
                        }),
                        builder: (context, state) {
                          return InputField(
                            name: passwordString,
                            icon: const Icon(Icons.lock),
                            obscure: !state.showPass,
                            suffixIcon: state.showPass ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                            hintText: passwordString,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6),
                            ]),
                            onChange: (String? text) {
                              context.read<LoginBloc>().add(LoginEmailChange(email: text ?? ''));
                            },
                            onSuffixIconTap: () {
                              context.read<LoginBloc>().add(const LoginShowPassChange());
                            },
                          );
                        },
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
                              Navigate.popPage(context);
                              //Navigate.pushPage(context, const ForgotPassPage());
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 0.075 * screenHeight),
                      state.loginStatus == LoginStatus.loading
                          ? Align(
                        alignment: Alignment.center,
                        child: Container(
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
                        ),
                      )
                          : Align(
                        alignment: Alignment.center,
                        child: Button(
                          type: 0,
                          width: 0.58 * screenWidth,
                          height: 0.056 * screenHeight,
                          text: loginString,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<LoginBloc>().add(const LoginSubmit());
                            } else {
                              context.read<LoginBloc>().add(LoginError(error: _formKey.currentState!.errors.values.elementAt(0)));
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: primaryLightColor,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {
                        Navigate.pushPage(context, const RegisterPage());
                        },
                      ),
                    ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

}