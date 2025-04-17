import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/module_model.dart';

enum TermDetailStatus {initial, loading, success, failure}

class TermDetailState extends Equatable {
  const TermDetailState({
    this.editModuleStatus = false,
    this.deleteModuleStatus = TermDetailStatus.initial,
    this.deleteTermStatus = TermDetailStatus.initial,
    this.moduleListStatus = TermDetailStatus.initial,
    this.moduleList = const [],
    this.moduleIsEdit = const [],
  });

  final bool editModuleStatus;
  final TermDetailStatus deleteModuleStatus;
  final TermDetailStatus deleteTermStatus;
  final TermDetailStatus moduleListStatus;
  final List<ModuleInTerm> moduleList;
  final List<bool> moduleIsEdit;

  TermDetailState copyWith ({
    bool Function()? editModuleStatus,
    TermDetailStatus Function()? deleteModuleStatus,
    TermDetailStatus Function()? deleteTermStatus,
    TermDetailStatus Function()? moduleListStatus,
    List<ModuleInTerm> Function()? moduleList,
    List<bool> Function()? moduleIsEdit,
  }) {
    return TermDetailState(
      editModuleStatus: editModuleStatus != null ? editModuleStatus() : this.editModuleStatus,
      deleteModuleStatus: deleteModuleStatus != null ? deleteModuleStatus() : this.deleteModuleStatus,
      deleteTermStatus: deleteTermStatus != null ? deleteTermStatus() : this.deleteTermStatus,
      moduleListStatus: moduleListStatus != null ? moduleListStatus() : this.moduleListStatus,
      moduleList: moduleList != null ? moduleList() : this.moduleList,
      moduleIsEdit: moduleIsEdit != null ? moduleIsEdit() : this.moduleIsEdit,
    );
  }

  @override
  List<Object?> get props => [
    editModuleStatus,
    deleteModuleStatus,
    deleteTermStatus,
    moduleListStatus,
    moduleList,
    moduleIsEdit,
  ];

}