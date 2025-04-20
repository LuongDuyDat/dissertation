import 'package:equatable/equatable.dart';

class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object?> get props => [];
}

class ChangePasswordInit extends ChangePasswordEvent {
  const ChangePasswordInit();
}
class ChangePasswordSubmit extends ChangePasswordEvent {
  const ChangePasswordSubmit({required this.oldPassword, required this.newPassword,});

  final String oldPassword;
  final String newPassword;

  @override
  List<Object?> get props => [oldPassword, newPassword];
}


class ChangePasswordError extends ChangePasswordEvent {
  const ChangePasswordError({required this.error,});

  final String error;

  @override
  List<Object?> get props => [error];
}

class ChangePasswordShowPassChange extends ChangePasswordEvent {
  const ChangePasswordShowPassChange();
}