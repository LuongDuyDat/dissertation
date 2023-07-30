import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term/bloc/schedule_term_event.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term/bloc/schedule_term_state.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term/schedule_term.dart';

class ScheduleTermBloc extends Bloc<ScheduleTermEvent, ScheduleTermState> {
  ScheduleTermBloc() :
      super(const ScheduleTermState()) {
    on<ScheduleTermLoadTerm>(_onLoadTerm);
    on<ScheduleTermDelete>(_onDelete);
  }

  void _onLoadTerm(
      ScheduleTermLoadTerm event,
      Emitter<ScheduleTermState> emit,
      ) async{
    emit(state.copyWith(
      termStatus: () => ScheduleTermStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      termStatus: () => ScheduleTermStatus.success,
      termList: () => termListString,
    ));
  }

  void _onDelete(
      ScheduleTermDelete event,
      Emitter<ScheduleTermState> emit,
      ) {
    List<String> tempList = List.from(state.termList);
    tempList.removeAt(event.index);
    emit(state.copyWith(
      termList: () => tempList,
    ));
  }
}