import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_add/bloc/schedule_term_add_event.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_add/bloc/schedule_term_add_state.dart';

class ScheduleTermAddBloc extends Bloc<ScheduleTermAddEvent, ScheduleTermAddState> {
  ScheduleTermAddBloc() :
      super(const ScheduleTermAddState()) {
    on<ScheduleTermAddChangeTitle>(_onChangeTitle);
    on<ScheduleTermAddChangeStartDate>(_onChangeStartDate);
    on<ScheduleTermAddChangeEndDate>(_onChangeEndDate);
    on<ScheduleTermAddSubmit>(_onSubmit);
  }

  void _onChangeTitle(
      ScheduleTermAddChangeTitle event,
      Emitter<ScheduleTermAddState> emit,
      ) {
    emit(state.copyWith(
      title: () => event.title,
    ));
  }

  void _onChangeStartDate(
      ScheduleTermAddChangeStartDate event,
      Emitter<ScheduleTermAddState> emit,
      ) {
    emit(state.copyWith(
      start: () => event.date,
    ));
  }

  void _onChangeEndDate(
      ScheduleTermAddChangeEndDate event,
      Emitter<ScheduleTermAddState> emit,
      ) {
    emit(state.copyWith(
      end: () => event.date,
    ));
  }

  void _onSubmit(
      ScheduleTermAddSubmit event,
      Emitter<ScheduleTermAddState> emit,
      ) async{
    emit(state.copyWith(
      submitStatus: () => ScheduleTermAddStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      submitStatus: () => ScheduleTermAddStatus.success,
    ));
  }
}