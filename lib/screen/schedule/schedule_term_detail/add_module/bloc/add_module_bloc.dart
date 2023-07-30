import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'add_module_event.dart';
import 'add_module_state.dart';

class AddModuleBloc extends Bloc<AddModuleEvent, AddModuleState> {
  AddModuleBloc({this.initialColor}) :
      super(AddModuleState(color: initialColor ?? Colors.transparent,)) {
    on<AddModuleChangeModuleName>(_onChangeModuleName);
    on<AddModuleChangeColor>(_onChangeColor);
    on<AddModuleSubmit>(_onSubmit);
  }

  final Color? initialColor;

  void _onChangeModuleName(
      AddModuleChangeModuleName event,
      Emitter<AddModuleState> emit,
      ) {
    emit(state.copyWith(
      moduleName: () => event.moduleName,
    ));
  }

  void _onChangeColor(
      AddModuleChangeColor event,
      Emitter<AddModuleState> emit,
      ) {
    emit(state.copyWith(
      color: () => event.color,
    ));
  }

  void _onSubmit(
      AddModuleSubmit event,
      Emitter<AddModuleState> emit,
      ) async{
    emit(state.copyWith(
      submitStatus: () => AddModuleStatus.loading,
    ));
    await Future.delayed(const Duration(milliseconds: 500,));
    emit(state.copyWith(
      submitStatus: () => AddModuleStatus.success,
    ));
  }
}