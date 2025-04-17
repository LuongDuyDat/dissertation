import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../util/strings.dart';


class ClassScheduleModel extends Equatable {
  const ClassScheduleModel({
    required this.category,
    required this.startTime,
    required this.endTime,
    required this.numberRepeat,
    required this.unitRepeat,
    this.dayOfWeek,
    required this.lecturer,
    required this.location,
  });

  final String category;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final int numberRepeat;
  final String unitRepeat;
  final int? dayOfWeek;
  final String lecturer;
  final String location;

  @override
  List<Object?> get props => [
    category,
    startTime,
    endTime,
    numberRepeat,
    unitRepeat,
    dayOfWeek,
    lecturer,
    location,
  ];
}

List<ClassScheduleModel> classScheduleList = [
  ClassScheduleModel(
    category: lectureString,
    startTime: const TimeOfDay(hour: 13, minute: 0),
    endTime: const TimeOfDay(hour: 15, minute: 0),
    numberRepeat: 1,
    unitRepeat: unitRepeatDropDownString[0],
    dayOfWeek: 3,
    lecturer: 'Dương Lê Minh',
    location: 'PM313 G2',
  ),
  ClassScheduleModel(
    category: lectureString,
    startTime: const TimeOfDay(hour: 7, minute: 0),
    endTime: const TimeOfDay(hour: 10, minute: 0),
    numberRepeat: 2,
    unitRepeat: unitRepeatDropDownString[1],
    lecturer: 'Hà Quang Thuỵ',
    location: '307 GD2',
  ),
];