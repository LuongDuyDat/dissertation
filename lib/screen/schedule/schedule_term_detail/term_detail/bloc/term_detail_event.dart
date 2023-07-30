import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';

class TermDetailEvent extends Equatable {
  const TermDetailEvent();

  @override
  List<Object?> get props => [];
}

class TermDetailLoadModuleList extends TermDetailEvent{
  const TermDetailLoadModuleList();
}

class TermDetailChangeEditModuleStatus extends TermDetailEvent{
  const TermDetailChangeEditModuleStatus();
}

class TermDetailOnClickEditModule extends TermDetailEvent{
  const TermDetailOnClickEditModule({required this.index,});

  final int index;

  @override
  List<Object?> get props => [];
}

class TermDetailDeleteTerm extends TermDetailEvent {
  const TermDetailDeleteTerm();
}

class TermDetailDeleteModule extends TermDetailEvent {
  const TermDetailDeleteModule({required this.index});

  final int index;

  @override
  List<Object?> get props => [];
}

class TermDetailEditModule extends TermDetailEvent {
  const TermDetailEditModule({required this.moduleName, required this.color, required this.index,});

  final String moduleName;
  final Color color;
  final int index;

  @override
  List<Object?> get props => [moduleName, color, index];
}

class TermDetailAddModule extends TermDetailEvent {
  const TermDetailAddModule({required this.moduleName, required this.color,});

  final String moduleName;
  final Color color;

  @override
  List<Object?> get props => [moduleName, color,];
}