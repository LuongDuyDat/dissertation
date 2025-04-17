import 'package:equatable/equatable.dart';
import 'package:learning_intern_support_system/domain/entities/schedule_event_model.dart';

enum ScheduleTimeTableStatus {initial, loading, success, failure}

class ScheduleTimetableState extends Equatable {
  const ScheduleTimetableState({
    this.focusDay,
    this.eventList = const [],
    this.eventStatus = ScheduleTimeTableStatus.initial,
  });

  final DateTime? focusDay;
  final List<ScheduleEventModel> eventList;
  final ScheduleTimeTableStatus eventStatus;

  ScheduleTimetableState copyWith({
    DateTime Function()? focusDay,
    List<ScheduleEventModel> Function()? eventList,
    ScheduleTimeTableStatus Function()? eventStatus
  }) {
    return ScheduleTimetableState(
      focusDay: focusDay != null ? focusDay() : this.focusDay,
      eventList: eventList != null ? eventList() : this.eventList,
      eventStatus: eventStatus != null ? eventStatus() : this.eventStatus,
    );
  }

  @override
  List<Object?> get props => [
    focusDay,
    eventList,
    eventStatus,
  ];
}