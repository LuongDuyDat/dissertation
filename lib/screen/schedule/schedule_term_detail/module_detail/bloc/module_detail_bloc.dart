import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/model/class_schedule_model.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/module_detail/bloc/module_detail_event.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/module_detail/bloc/module_detail_state.dart';

class ModuleDetailBloc extends Bloc<ModuleDetailEvent, ModuleDetailState> {
  ModuleDetailBloc() :
      super(const ModuleDetailState()) {
    on<ModuleDetailInit>(_onInit);
    on<ModuleDetailAddClass>(_onAddClass);
    on<ModuleDetailEditClass>(_onEditClass);
    on<ModuleDetailDeleteClass>(_onDeleteClass);
  }

  void _onInit(
      ModuleDetailInit event,
      Emitter<ModuleDetailState> emit,
      ) async{
    emit(state.copyWith(
      loadStatus: () => ModuleDetailStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      loadStatus: () => ModuleDetailStatus.success,
      classScheduleList: () => classScheduleList,
    ));
  }

  void _onAddClass(
      ModuleDetailAddClass event,
      Emitter<ModuleDetailState> emit,
      ) async{
    emit(state.copyWith(
      addStatus: () => ModuleDetailStatus.loading,
    ));
    await Future.delayed(const Duration(milliseconds: 500));

    List<ClassScheduleModel> tempList = List.from(state.classScheduleList);
    tempList.add(event.classSchedule);

    emit(state.copyWith(
      addStatus: () => ModuleDetailStatus.success,
      classScheduleList: () => tempList,
    ));
  }

  void _onEditClass(
      ModuleDetailEditClass event,
      Emitter<ModuleDetailState> emit,
      ) async{
    emit(state.copyWith(
      editStatus: () => ModuleDetailStatus.loading,
    ));
    await Future.delayed(const Duration(milliseconds: 500));

    List<ClassScheduleModel> tempList = List.from(state.classScheduleList);
    tempList[event.index] = event.classSchedule;

    emit(state.copyWith(
      editStatus: () => ModuleDetailStatus.success,
      classScheduleList: () => tempList,
    ));
  }

  void _onDeleteClass(
      ModuleDetailDeleteClass event,
      Emitter<ModuleDetailState> emit,
      ) async{
    emit(state.copyWith(
      deleteStatus: () => ModuleDetailStatus.loading,
    ));
    await Future.delayed(const Duration(milliseconds: 500));

    List<ClassScheduleModel> tempList = List.from(state.classScheduleList);
    tempList.removeAt(event.index);

    emit(state.copyWith(
      deleteStatus: () => ModuleDetailStatus.success,
      classScheduleList: () => tempList,
    ));
  }
}