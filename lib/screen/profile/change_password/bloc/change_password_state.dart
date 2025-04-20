import 'package:equatable/equatable.dart';

enum ChangePasswordStatus {initial, loading, success, failure,}

class ChangePasswordState extends Equatable {
  const ChangePasswordState({
    this.changePasswordStatus = ChangePasswordStatus.initial,
    this.error = '',
    this.showPass = false,
  });

  final ChangePasswordStatus changePasswordStatus;
  final String error;
  final bool showPass;

  ChangePasswordState copyWith({
    ChangePasswordStatus Function()? changePasswordStatus,
    String Function()? error,
    bool Function()? showPass,
  }) {
    return ChangePasswordState(
      changePasswordStatus: changePasswordStatus != null ? changePasswordStatus() : this.changePasswordStatus,
      error: error != null ? error() : this.error,
      showPass: showPass != null ? showPass() : this.showPass,
    );
  }

  @override
  List<Object?> get props => [
    changePasswordStatus,
    error,
    showPass,
  ];
}