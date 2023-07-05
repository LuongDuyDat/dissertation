import 'package:equatable/equatable.dart';

enum ForgotPasswordStatus {initial, loading, success, failure}

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    this.email = '',
    this.error = '',
    this.forgotPasswordStatus = ForgotPasswordStatus.initial,
  });


  final String email;
  final String error;
  final ForgotPasswordStatus forgotPasswordStatus;

  ForgotPasswordState copyWith({
    String Function()? email,
    String Function()? password,
    String Function()? error,
    ForgotPasswordStatus Function()? forgotPasswordStatus,
    bool Function()? showPass,
  }) {
    return ForgotPasswordState(
      email: email != null ? email() : this.email,
      error: error != null ? error() : this.error,
      forgotPasswordStatus: forgotPasswordStatus != null ? forgotPasswordStatus() : this.forgotPasswordStatus,
    );
  }

  @override
  List<Object?> get props => [
    email,
    error,
    forgotPasswordStatus,
  ];

}
