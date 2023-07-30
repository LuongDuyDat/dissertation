import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'add_class_event.dart';
import 'add_class_state.dart';

class AddClassBloc extends Bloc<AddClassEvent, AddClassState> {
  AddClassBloc({this.category, this.fromTime, this.toTime, this.numberRepeat, this.unitRepeat, this.datOfWeek, this.lecturer, this.location,}) :
      super(AddClassState(
        category: category,
        from: fromTime,
        to: toTime,
        number: numberRepeat,
        unitRepeat: unitRepeat,
        dayOfWeek: datOfWeek,
        lecturer: lecturer ?? '',
        location: location ?? '',
      )) {
    on<AddClassChangeCategory>(_onChangeCategory);
    on<AddClassChangeFromTime>(_onChangeFromTime);
    on<AddClassChangeToTime>(_onChangeToTime);
    on<AddClassChangeNumberRepeat>(_onChangeNumberRepeat);
    on<AddClassChangeUnitRepeat>(_onChangeUnitRepeat);
    on<AddClassChangeWeekDay>(_onChangeWeekDay);
    on<AddClassChangeLecturer>(_onChangeLecturer);
    on<AddClassChangeLocation>(_onChangeLocation);
    on<AddClassSubmit>(_onSubmit);
  }

  final String? category;
  final TimeOfDay? fromTime;
  final TimeOfDay? toTime;
  final int? numberRepeat;
  final String? unitRepeat;
  final int? datOfWeek;
  final String? lecturer;
  final String? location;

  void _onChangeCategory(
      AddClassChangeCategory event,
      Emitter<AddClassState> emit,
      ) {
    emit(state.copyWith(
      category: () => event.category,
    ));
  }

  void _onChangeFromTime(
      AddClassChangeFromTime event,
      Emitter<AddClassState> emit,
      ) {
    emit(state.copyWith(
      from: () => event.time,
    ));
  }

  void _onChangeToTime(
      AddClassChangeToTime event,
      Emitter<AddClassState> emit,
      ) {
    emit(state.copyWith(
      to: () => event.time,
    ));
  }

  void _onChangeNumberRepeat(
      AddClassChangeNumberRepeat event,
      Emitter<AddClassState> emit,
      ) {
    emit(state.copyWith(
      number: () => event.number,
    ));
  }

  void _onChangeUnitRepeat(
      AddClassChangeUnitRepeat event,
      Emitter<AddClassState> emit,
      ) {
    emit(state.copyWith(
      unitRepeat: () => event.unit,
    ));
  }

  void _onChangeWeekDay(
      AddClassChangeWeekDay event,
      Emitter<AddClassState> emit,
      ) {
    emit(state.copyWith(
      dayOfWeek: () => event.dayOfWeek,
    ));
  }

  void _onChangeLecturer(
      AddClassChangeLecturer event,
      Emitter<AddClassState> emit,
      ) {
    emit(state.copyWith(
      lecturer: () => event.lecturer,
    ));
  }

  void _onChangeLocation(
      AddClassChangeLocation event,
      Emitter<AddClassState> emit,
      ) {
    emit(state.copyWith(
      location: () => event.location,
    ));
  }

  void _onSubmit(
      AddClassSubmit event,
      Emitter<AddClassState> emit,
      ) async{
    emit(state.copyWith(
      submitStatus: () => AddClassStatus.loading,
    ));
    await Future.delayed(const Duration(milliseconds: 500));
    emit(state.copyWith(
      submitStatus: () => AddClassStatus.success,
    ));
  }
}