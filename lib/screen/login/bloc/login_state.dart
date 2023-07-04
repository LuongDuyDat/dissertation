import 'package:equatable/equatable.dart';

enum LoginStatus {initial, loading, success, failure}

class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.error = '',
    this.loginStatus = LoginStatus.initial,
    this.showPass = false,
  });

  final String email;
  final String password;
  final String error;
  final LoginStatus loginStatus;
  final bool showPass;

  LoginState copyWith({
    String Function()? email,
    String Function()? password,
    String Function()? error,
    LoginStatus Function()? loginStatus,
    bool Function()? showPass,
  }) {
    return LoginState(
      email: email != null ? email() : this.email,
      password: password != null ? password() : this.password,
      error: error != null ? error() : this.error,
      loginStatus: loginStatus != null ? loginStatus() : this.loginStatus,
      showPass: showPass != null ? showPass() : this.showPass,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    error,
    loginStatus,
    showPass,
  ];
}