import 'package:equatable/equatable.dart';
import 'package:learning_intern_support_system/domain/entities/class_schedule_model.dart';

class ModuleDetailEvent extends Equatable{
  const ModuleDetailEvent();

  @override
  List<Object?> get props => [];
}

class ModuleDetailInit extends ModuleDetailEvent{
  const ModuleDetailInit();
}

class ModuleDetailDeleteClass extends ModuleDetailEvent{
  const ModuleDetailDeleteClass({
    required this.index,
  });

  final int index;

  @override
  List<Object?> get props => [
    index,
  ];
}

class ModuleDetailEditClass extends ModuleDetailEvent{
  const ModuleDetailEditClass({
    required this.index,
    required this.classSchedule,
  });

  final int index;
  final ClassScheduleModel classSchedule;

  @override
  List<Object?> get props => [
    index,
    classSchedule,
  ];
}

class ModuleDetailAddClass extends ModuleDetailEvent{
  const ModuleDetailAddClass({
    required this.classSchedule,
  });

  final ClassScheduleModel classSchedule;

  @override
  List<Object?> get props => [
    classSchedule,
  ];
}