import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum AddModuleStatus {initial, loading, success, failure}

class AddModuleState extends Equatable {
  const AddModuleState({
    this.submitStatus = AddModuleStatus.initial,
    this.moduleName = '',
    this.color = Colors.transparent,
  });

  final AddModuleStatus submitStatus;
  final String moduleName;
  final Color color;

  AddModuleState copyWith({
    AddModuleStatus Function()? submitStatus,
    String Function()? moduleName,
    Color Function()? color,
  }) {
    return AddModuleState(
      submitStatus: submitStatus != null ? submitStatus() : this.submitStatus,
      moduleName: moduleName != null ? moduleName() : this.moduleName,
      color: color != null ? color() : this.color,
    );
  }

  @override
  List<Object?> get props => [submitStatus, moduleName, color,];
}