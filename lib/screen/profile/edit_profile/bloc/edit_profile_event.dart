import 'dart:io';

import 'package:equatable/equatable.dart';

class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object?> get props => [];
}


class EditProfileSubmit extends EditProfileEvent {
  const EditProfileSubmit({
    required this.fullName,
    required this.classId,
  });

  final String fullName;
  final String classId;

  @override
  List<Object?> get props => [fullName, classId];
}

class EditProfilePickImage extends EditProfileEvent {
  const EditProfilePickImage({required this.avatar,});

  final File avatar;

  @override
  List<Object?> get props => [avatar];
}

class EditProfilePickBirthDay extends EditProfileEvent {
  const EditProfilePickBirthDay({required this.birthDay,});

  final DateTime birthDay;

  @override
  List<Object?> get props => [birthDay];
}

class EditProfileError extends EditProfileEvent {
  const EditProfileError({required this.error,});

  final String error;

  @override
  List<Object?> get props => [error];
}