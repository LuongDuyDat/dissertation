import 'package:equatable/equatable.dart';

class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class AppAuthenticating extends AppEvent {
  const AppAuthenticating();

  @override
  List<Object?> get props => [];
}

class AppAuthenticateError extends AppEvent {
  const AppAuthenticateError({required this.error,});

  final String error;

  @override
  List<Object?> get props => [error];
}