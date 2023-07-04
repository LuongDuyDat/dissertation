import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_intern_support_system/screen/app/bloc/app_bloc.dart';
import 'package:learning_intern_support_system/screen/app/bloc/app_state.dart';
import 'package:learning_intern_support_system/screen/home.dart';
import 'package:learning_intern_support_system/screen/login/login.dart';
import 'package:learning_intern_support_system/util/theme.dart';

import 'bloc/app_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppBloc()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: appThemeLight.copyWith(colorScheme: appThemeLight.colorScheme.copyWith(primary: primaryLightColor)),
          home: BlocConsumer<AppBloc, AppState>(
            builder: (context, state) {
              switch (state.appStatus) {
                case AppStatus.authenticated:
                  return const HomePage();
                default:
                  return const LoginPage();
              }

            },
            listener: (context, state) {
              if (state.appStatus == AppStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
          ),
        );
        },
      ),
    );

  }
}