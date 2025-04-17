import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/domain/entities/schedule_event_model.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_timetable/bloc/schedule_timetable_event.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_timetable/bloc/schedule_timetable_state.dart';

class ScheduleTimetableBloc extends Bloc<ScheduleTimetableEvent, ScheduleTimetableState> {
  ScheduleTimetableBloc() :
      super(const ScheduleTimetableState()) {
    on<ScheduleTimetableInit>(_onInit);
    on<ScheduleTimetableChangeFocusDay>(_onChangeFocusDay);
    on<ScheduleTimetableGetEvent>(_onGetEvent);
  }

  void _onInit(
      ScheduleTimetableInit event,
      Emitter<ScheduleTimetableState> emit,
      ) {
    emit(state.copyWith(
      focusDay: () => DateTime.now(),
    ));
  }

  void _onChangeFocusDay(
      ScheduleTimetableChangeFocusDay event,
      Emitter<ScheduleTimetableState> emit,
      ) {
    emit(state.copyWith(
      focusDay: () => event.dateTime,
      eventStatus: () => ScheduleTimeTableStatus.initial,
    ));
  }

  void _onGetEvent(
      ScheduleTimetableGetEvent event,
      Emitter<ScheduleTimetableState> emit,
      ) async{
    emit(state.copyWith(
      eventStatus: () => ScheduleTimeTableStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      eventStatus: () => ScheduleTimeTableStatus.success,
      eventList: () => events,

    ));
  }
}