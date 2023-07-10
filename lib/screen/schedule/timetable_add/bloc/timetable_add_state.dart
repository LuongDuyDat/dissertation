import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum TimetableAddStatus {initial, loading, success, failure}

class TimetableAddState extends Equatable {
  const TimetableAddState({
    this.submitStatus = TimetableAddStatus.initial,
    this.type = '',
    this.title = '',
    this.from,
    this.to,
    this.lecturer = '',
    this.location = ''
  });

  final TimetableAddStatus submitStatus;
  final String type;
  final String title;
  final TimeOfDay? from;
  final TimeOfDay? to;
  final String lecturer;
  final String location;

  TimetableAddState copyWith({
    TimetableAddStatus Function()? submitStatus,
    String Function()? type,
    String Function()? title,
    TimeOfDay Function()? from,
    TimeOfDay Function()? to,
    String Function()? lecturer,
    String Function()? location
  }) {
    return TimetableAddState(
      submitStatus: submitStatus != null ? submitStatus() : this.submitStatus,
      type: type != null ? type() : this.type,
      title: title != null ? title() : this.title,
      from: from != null ? from() : this.from,
      to: to != null ? to() : this.to,
      lecturer: lecturer != null ? lecturer() : this.lecturer,
      location: location != null ? location() : this.location,
    );
  }

  @override
  List<Object?> get props => [
    submitStatus,
    type,
    title,
    from,
    to,
    lecturer,
    location,
  ];
}