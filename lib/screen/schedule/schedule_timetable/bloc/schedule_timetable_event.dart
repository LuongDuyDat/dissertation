import 'package:equatable/equatable.dart';

class ScheduleTimetableEvent extends Equatable {
  const ScheduleTimetableEvent();

  @override
  List<Object?> get props => [];
}

class ScheduleTimetableInit extends ScheduleTimetableEvent {
  const ScheduleTimetableInit();
}

class ScheduleTimetableChangeFocusDay extends ScheduleTimetableEvent {
  const ScheduleTimetableChangeFocusDay({required this.dateTime,});

  final DateTime dateTime;

  @override
  List<Object?> get props => [dateTime,];
}

class ScheduleTimetableGetEvent extends ScheduleTimetableEvent {
  const ScheduleTimetableGetEvent();
}