import 'package:equatable/equatable.dart';

enum ScheduleTermAddStatus {initial, loading, success, failure}

class ScheduleTermAddState extends Equatable {
  const ScheduleTermAddState({
    this.submitStatus = ScheduleTermAddStatus.initial,
    this.title = '',
    this.start,
    this.end,
  });

  final ScheduleTermAddStatus submitStatus;
  final String title;
  final DateTime? start;
  final DateTime? end;

  ScheduleTermAddState copyWith({
    ScheduleTermAddStatus Function()? submitStatus,
    String Function()? title,
    DateTime Function()? start,
    DateTime Function()? end,
  }) {
    return ScheduleTermAddState(
      submitStatus: submitStatus != null ? submitStatus() : this.submitStatus,
      title: title != null ? title() : this.title,
      start: start != null ? start() : this.start,
      end: end != null ? end() : this.end,
    );
  }

  @override
  List<Object?> get props => [
    submitStatus,
    title,
    start,
    end,
  ];
}