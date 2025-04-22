import 'dart:io';

import 'package:equatable/equatable.dart';

enum EditProfileStatus {initial, loading, success, failure}

class EditProfileState extends Equatable {
  const EditProfileState({
    this.editProfileStatus = EditProfileStatus.initial,
    this.avatar,
    this.birthDay,
    this.error = '',
  });

  final EditProfileStatus editProfileStatus;
  final File? avatar;
  final String error;
  final DateTime? birthDay;

  EditProfileState copyWith({
    EditProfileStatus Function()? editProfileStatus,
    File Function()? avatar,
    String Function()? error,
    DateTime Function()? birthDay,
  }) {
    return EditProfileState(
      editProfileStatus: editProfileStatus != null ? editProfileStatus() : this.editProfileStatus,
      avatar: avatar != null ? avatar() : this.avatar,
      error: error != null ? error() : this.error,
      birthDay: birthDay != null ? birthDay() : this.birthDay,
    );
  }

  @override
  List<Object?> get props => [
    editProfileStatus,
    avatar,
    error,
    birthDay,
  ];
}