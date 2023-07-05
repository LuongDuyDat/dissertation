import 'package:equatable/equatable.dart';

class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object?> get props => [];
}

class ForgotPasswordError extends ForgotPasswordEvent {
  const ForgotPasswordError({
    required this.error,
  });

  final String error;

  @override
  List<Object?> get props => [
    error,
  ];
}

class ForgotPasswordEmailChange extends ForgotPasswordEvent {
  const ForgotPasswordEmailChange({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [email];
}

class ForgotPasswordSubmit extends ForgotPasswordEvent {
  const ForgotPasswordSubmit();
}