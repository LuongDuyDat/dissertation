import 'package:equatable/equatable.dart';

class ScheduleTermAddEvent extends Equatable {
  const ScheduleTermAddEvent();

  @override
  List<Object?> get props => [];
}

class ScheduleTermAddChangeTitle extends ScheduleTermAddEvent {
  const ScheduleTermAddChangeTitle({required this.title,});

  final String title;

  @override
  List<Object?> get props => [title];
}

class ScheduleTermAddChangeStartDate extends ScheduleTermAddEvent {
  const ScheduleTermAddChangeStartDate({required this.date,});

  final DateTime date;

  @override
  List<Object?> get props => [date];
}

class ScheduleTermAddChangeEndDate extends ScheduleTermAddEvent {
  const ScheduleTermAddChangeEndDate({required this.date,});

  final DateTime date;

  @override
  List<Object?> get props => [date];
}

class ScheduleTermAddSubmit extends ScheduleTermAddEvent {
  const ScheduleTermAddSubmit();
}