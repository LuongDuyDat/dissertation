import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TimeTableAddEvent extends Equatable {
  const TimeTableAddEvent();


  @override
  List<Object?> get props => [];
}

class TimeTableAddChangeType extends TimeTableAddEvent {
  const TimeTableAddChangeType({required this.type,});

  final String type;

  @override
  List<Object?> get props => [type];
}

class TimeTableAddChangeTitle extends TimeTableAddEvent {
  const TimeTableAddChangeTitle({required this.title,});

  final String title;

  @override
  List<Object?> get props => [title];
}

class TimeTableAddChangeFromTime extends TimeTableAddEvent {
  const TimeTableAddChangeFromTime({required this.time,});

  final TimeOfDay time;

  @override
  List<Object?> get props => [time];
}

class TimeTableAddChangeToTime extends TimeTableAddEvent {
  const TimeTableAddChangeToTime({required this.time,});

  final TimeOfDay time;

  @override
  List<Object?> get props => [time];
}

class TimeTableAddChangeLocation extends TimeTableAddEvent {
  const TimeTableAddChangeLocation({required this.location,});

  final String location;

  @override
  List<Object?> get props => [location];
}

class TimeTableAddChangeLecturer extends TimeTableAddEvent {
  const TimeTableAddChangeLecturer({required this.lecturer,});

  final String lecturer;

  @override
  List<Object?> get props => [lecturer];
}

class TimeTableAddSubmit extends TimeTableAddEvent {
  const TimeTableAddSubmit();

  @override
  List<Object?> get props => [];
}