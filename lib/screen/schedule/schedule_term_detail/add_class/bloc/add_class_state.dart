import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum AddClassStatus {initial, loading, success, failure,}

class AddClassState extends Equatable {
  const AddClassState({
    this.submitStatus = AddClassStatus.initial,
    this.category,
    this.from,
    this.to,
    this.number,
    this.unitRepeat,
    this.dayOfWeek,
    this.lecturer = '',
    this.location  = '',
  });

  final AddClassStatus submitStatus;
  final String? category;
  final TimeOfDay? from;
  final TimeOfDay? to;
  final int? number;
  final String? unitRepeat;
  final int? dayOfWeek;
  final String lecturer;
  final String location;

  AddClassState copyWith({
    AddClassStatus Function()? submitStatus,
    String Function()? category,
    TimeOfDay Function()? from,
    TimeOfDay Function()? to,
    int Function()? number,
    String Function()? unitRepeat,
    int Function()? dayOfWeek,
    String Function()? lecturer,
    String Function()? location,
  }) {
    return AddClassState(
      submitStatus: submitStatus != null ? submitStatus() : this.submitStatus,
      category: category != null ? category() : this.category,
      from: from != null ? from() : this.from,
      to: to != null ? to() : this.to,
      number: number != null ? number() : this.number,
      unitRepeat: unitRepeat != null ? unitRepeat() : this.unitRepeat,
      dayOfWeek: dayOfWeek != null ? dayOfWeek() : this.dayOfWeek,
      lecturer: lecturer != null ? lecturer() : this.lecturer,
      location: location != null ? location() : this.location,
    );
  }

  @override
  List<Object?> get props => [
    submitStatus,
    category,
    from,
    to,
    number,
    unitRepeat,
    dayOfWeek,
    lecturer,
    location,
  ];
}