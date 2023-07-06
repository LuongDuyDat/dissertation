import 'package:equatable/equatable.dart';

class MyProfileEvent extends Equatable {
  const MyProfileEvent();

  @override
  List<Object?> get props => [];
}

class MyProfileInit extends MyProfileEvent {
  const MyProfileInit();
}

class MyProfileError extends MyProfileEvent {
  const MyProfileError({required this.error,});

  final String error;

  @override
  List<Object?> get props => [error];
}