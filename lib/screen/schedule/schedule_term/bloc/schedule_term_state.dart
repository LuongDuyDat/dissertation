import 'package:equatable/equatable.dart';

enum ScheduleTermStatus {initial, loading, success, failure}

class ScheduleTermState extends Equatable {
  const ScheduleTermState({
    this.termStatus = ScheduleTermStatus.initial,
    this.termList = const [],
  });

  final ScheduleTermStatus termStatus;
  final List<String> termList;

  ScheduleTermState copyWith({
    ScheduleTermStatus Function()? termStatus,
    List<String> Function()? termList
  }) {
    return ScheduleTermState(
      termStatus: termStatus != null ? termStatus() : this.termStatus,
      termList: termList != null ? termList() : this.termList,
    );
  }

  @override
  List<Object?> get props => [
    termStatus,
    termList,
  ];

}