import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginError extends LoginEvent {
  const LoginError({
    required this.error,
  });

  final String error;

  @override
  List<Object?> get props => [
    error,
  ];
}

class LoginEmailChange extends LoginEvent {
  const LoginEmailChange({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [email];
}

class LoginPasswordChange extends LoginEvent {
  const LoginPasswordChange({
    required this.password,
  });

  final String password;

  @override
  List<Object?> get props => [password];
}

class LoginSubmit extends LoginEvent {
  const LoginSubmit();
}
class LoginShowPassChange extends LoginEvent {
  const LoginShowPassChange();
}