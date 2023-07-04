import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'bloc_observer.dart';
import 'screen/app/app.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}
