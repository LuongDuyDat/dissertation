import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/model/module_model.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/term_detail/bloc/term_detail_event.dart';
import 'package:learning_intern_support_system/screen/schedule/schedule_term_detail/term_detail/bloc/term_detail_state.dart';

class TermDetailBloc extends Bloc<TermDetailEvent, TermDetailState> {
  TermDetailBloc() :
      super(const TermDetailState()) {
    on<TermDetailLoadModuleList>(_onLoadModuleList);
    on<TermDetailChangeEditModuleStatus>(_onEditModule);
    on<TermDetailOnClickEditModule>(_onClickEditModule);
    on<TermDetailDeleteTerm>(_onDeleteTerm);
    on<TermDetailDeleteModule>(_onDeleteModule);
    on<TermDetailEditModule>(_onEditModule2);
    on<TermDetailAddModule>(_onAddModule);
  }

  void _onLoadModuleList(
      TermDetailLoadModuleList event,
      Emitter<TermDetailState> emit,
      ) async{
    emit(state.copyWith(
      moduleListStatus: () => TermDetailStatus.loading,
    ));
    List<bool> moduleIsEdit = List.filled(moduleInTermList.length, false);
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      moduleListStatus: () => TermDetailStatus.success,
      moduleList: () => moduleInTermList,
      moduleIsEdit: () => moduleIsEdit,
    ));
  }

  void _onEditModule(
      TermDetailChangeEditModuleStatus event,
      Emitter<TermDetailState> emit,
      ) async{
    List<bool> moduleIsEdit = List.filled(moduleInTermList.length, false);
    emit(state.copyWith(
      editModuleStatus: () => !state.editModuleStatus,
      moduleIsEdit: () => moduleIsEdit,
    ));
  }

  void _onClickEditModule(
      TermDetailOnClickEditModule event,
      Emitter<TermDetailState> emit,
      ) {
    List<bool> tempModuleIsEdit = List.from(state.moduleIsEdit);
    tempModuleIsEdit[event.index] = true;
    emit(state.copyWith(
      moduleIsEdit: () => tempModuleIsEdit,
    ));
  }

  void _onDeleteTerm(
      TermDetailDeleteTerm event,
      Emitter<TermDetailState> emit,
      ) async{
    emit(state.copyWith(
      deleteTermStatus: () => TermDetailStatus.loading,
    ));
    await Future.delayed(const Duration(milliseconds: 500));
    emit(state.copyWith(
      deleteTermStatus: () => TermDetailStatus.success,
    ));
  }

  void _onDeleteModule(
      TermDetailDeleteModule event,
      Emitter<TermDetailState> emit,
      ) async{
    emit(state.copyWith(
      deleteModuleStatus: () => TermDetailStatus.loading,
    ));
    await Future.delayed(const Duration(milliseconds: 500));
    List<ModuleInTerm> tempModuleList = List.from(state.moduleList);
    List<bool> tempIsEdit = List.from(state.moduleIsEdit);
    tempModuleList.removeAt(event.index);
    tempIsEdit.removeAt(event.index);
    emit(state.copyWith(
      deleteModuleStatus: () => TermDetailStatus.success,
      moduleList: () => tempModuleList,
      moduleIsEdit: () => tempIsEdit,
    ));
  }

  void _onEditModule2(
      TermDetailEditModule event,
      Emitter<TermDetailState> emit,
      ) {
    List<ModuleInTerm> tempModuleList = List.from(state.moduleList);
    tempModuleList[event.index] = ModuleInTerm(moduleName: event.moduleName, color: event.color);
    emit(state.copyWith(
      moduleList: () => tempModuleList,
    ));
  }

  void _onAddModule(
      TermDetailAddModule event,
      Emitter<TermDetailState> emit,
      ) {
    List<ModuleInTerm> tempModuleList = List.from(state.moduleList);
    List<bool> tempIsEdit = List.from(state.moduleIsEdit);
    tempModuleList.add(ModuleInTerm(moduleName: event.moduleName, color: event.color));
    tempIsEdit.add(false);
    emit(state.copyWith(
      moduleList: () => tempModuleList,
      moduleIsEdit: () => tempIsEdit,
    ));
  }
}