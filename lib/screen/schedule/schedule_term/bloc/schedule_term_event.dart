import 'package:equatable/equatable.dart';

class ScheduleTermEvent extends Equatable {
  const ScheduleTermEvent();

  @override
  List<Object?> get props => [];
}

class ScheduleTermLoadTerm extends ScheduleTermEvent {
  const ScheduleTermLoadTerm();
}

class ScheduleTermDelete extends ScheduleTermEvent {
  const ScheduleTermDelete({required this.index,});

  final int index;

  @override
  List<Object?> get props => [index];
}