import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class AddClassEvent extends Equatable {
  const AddClassEvent();

  @override
  List<Object?> get props => [];
}

class AddClassChangeCategory extends AddClassEvent {
  const AddClassChangeCategory({required this.category});

  final String category;

  @override
  List<Object?> get props => [category];
}

class AddClassChangeFromTime extends AddClassEvent {
  const AddClassChangeFromTime({required this.time});

  final TimeOfDay time;

  @override
  List<Object?> get props => [time];
}

class AddClassChangeToTime extends AddClassEvent {
  const AddClassChangeToTime({required this.time});

  final TimeOfDay time;

  @override
  List<Object?> get props => [time];
}

class AddClassChangeNumberRepeat extends AddClassEvent {
  const AddClassChangeNumberRepeat({required this.number});

  final int number;

  @override
  List<Object?> get props => [number];
}

class AddClassChangeUnitRepeat extends AddClassEvent {
  const AddClassChangeUnitRepeat({required this.unit});

  final String unit;

  @override
  List<Object?> get props => [unit];
}

class AddClassChangeWeekDay extends AddClassEvent {
  const AddClassChangeWeekDay({required this.dayOfWeek});

  final int dayOfWeek;

  @override
  List<Object?> get props => [dayOfWeek];
}

class AddClassChangeLecturer extends AddClassEvent {
  const AddClassChangeLecturer({required this.lecturer});

  final String lecturer;

  @override
  List<Object?> get props => [lecturer];
}

class AddClassChangeLocation extends AddClassEvent {
  const AddClassChangeLocation({required this.location});

  final String location;

  @override
  List<Object?> get props => [location];
}

class AddClassSubmit extends AddClassEvent {
  const AddClassSubmit();
}