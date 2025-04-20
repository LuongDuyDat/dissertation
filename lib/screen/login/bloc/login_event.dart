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
class LoginSubmit extends LoginEvent {
  final String email;
  final String password;
  const LoginSubmit({required this.email, required this.password});

  @override
  List<Object?> get props => [
    email,
    password,
  ];
}
class LoginShowPassChange extends LoginEvent {
  const LoginShowPassChange();
}