import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/service_locator.dart';

import 'bloc_observer.dart';
import 'screen/app/app.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(const MyApp());
}
