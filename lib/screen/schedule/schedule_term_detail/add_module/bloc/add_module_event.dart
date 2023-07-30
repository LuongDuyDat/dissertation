import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';

class AddModuleEvent extends Equatable{
  const AddModuleEvent();

  @override
  List<Object?> get props => [];
}

class AddModuleChangeModuleName extends AddModuleEvent{
  const AddModuleChangeModuleName({required this.moduleName,});

  final String moduleName;

  @override
  List<Object?> get props => [moduleName];
}

class AddModuleChangeColor extends AddModuleEvent{
  const AddModuleChangeColor({required this.color,});

  final Color color;

  @override
  List<Object?> get props => [color];
}

class AddModuleSubmit extends AddModuleEvent{
  const AddModuleSubmit();
}