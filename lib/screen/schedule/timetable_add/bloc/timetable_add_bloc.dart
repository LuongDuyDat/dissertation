import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/screen/schedule/timetable_add/bloc/timetable_add_event.dart';
import 'package:learning_intern_support_system/screen/schedule/timetable_add/bloc/timetable_add_state.dart';

class TimetableAddBloc extends Bloc<TimeTableAddEvent, TimetableAddState> {
  TimetableAddBloc() :
      super(const TimetableAddState()) {
    on<TimeTableAddChangeType>(_onChangeType);
    on<TimeTableAddChangeTitle>(_onChangeTitle);
    on<TimeTableAddChangeFromTime>(_onChangeFromTime);
    on<TimeTableAddChangeToTime>(_onChangeToTime);
    on<TimeTableAddChangeLecturer>(_onChangeLecturer);
    on<TimeTableAddChangeLocation>(_onChangeLocation);
    on<TimeTableAddSubmit>(_onSubmit);
  }

  void _onChangeType(
      TimeTableAddChangeType event,
      Emitter<TimetableAddState> emit,
      ) {
    emit(state.copyWith(
      type: () => event.type,
    ));
  }

  void _onChangeTitle(
      TimeTableAddChangeTitle event,
      Emitter<TimetableAddState> emit,
      ) {
    emit(state.copyWith(
      type: () => event.title,
    ));
  }

  void _onChangeFromTime(
      TimeTableAddChangeFromTime event,
      Emitter<TimetableAddState> emit,
      ) {
    emit(state.copyWith(
      from: () => event.time,
    ));
  }

  void _onChangeToTime(
      TimeTableAddChangeToTime event,
      Emitter<TimetableAddState> emit,
      ) {
    emit(state.copyWith(
      to: () => event.time,
    ));
  }

  void _onChangeLecturer(
      TimeTableAddChangeLecturer event,
      Emitter<TimetableAddState> emit,
      ) {
    emit(state.copyWith(
      lecturer: () => event.lecturer,
    ));
  }

  void _onChangeLocation(
      TimeTableAddChangeLocation event,
      Emitter<TimetableAddState> emit,
      ) {
    emit(state.copyWith(
      location: () => event.location,
    ));
  }

  void _onSubmit(
      TimeTableAddSubmit event,
      Emitter<TimetableAddState> emit,
      ) async{
    emit(state.copyWith(
      submitStatus: () => TimetableAddStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      submitStatus: () => TimetableAddStatus.success,
    ));
  }
}