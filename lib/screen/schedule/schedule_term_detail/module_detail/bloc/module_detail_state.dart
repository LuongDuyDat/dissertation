import 'package:equatable/equatable.dart';
import 'package:learning_intern_support_system/domain/entities/class_schedule_model.dart';

enum ModuleDetailStatus {initial, loading, success, failure}

class ModuleDetailState extends Equatable {
  const ModuleDetailState({
    this.deleteStatus = ModuleDetailStatus.initial,
    this.editStatus = ModuleDetailStatus.initial,
    this.addStatus = ModuleDetailStatus.initial,
    this.loadStatus = ModuleDetailStatus.initial,
    this.classScheduleList = const [],
  });

  final ModuleDetailStatus deleteStatus;
  final ModuleDetailStatus editStatus;
  final ModuleDetailStatus addStatus;
  final ModuleDetailStatus loadStatus;
  final List<ClassScheduleModel> classScheduleList;

  ModuleDetailState copyWith({
    ModuleDetailStatus Function()? deleteStatus,
    ModuleDetailStatus Function()? editStatus,
    ModuleDetailStatus Function()? addStatus,
    ModuleDetailStatus Function()? loadStatus,
    List<ClassScheduleModel> Function()? classScheduleList,
  }) {
    return ModuleDetailState(
      deleteStatus: deleteStatus != null ? deleteStatus() : this.deleteStatus,
      editStatus: editStatus != null ? editStatus() : this.editStatus,
      addStatus: addStatus != null ? addStatus() : this.addStatus,
      loadStatus: loadStatus != null ? loadStatus() : this.loadStatus,
      classScheduleList: classScheduleList != null ? classScheduleList() : this.classScheduleList,
    );
  }

  @override
  List<Object?> get props => [
    deleteStatus,
    editStatus,
    addStatus,
    loadStatus,
    classScheduleList,
  ];
}