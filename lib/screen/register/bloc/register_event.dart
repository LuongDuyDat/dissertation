import 'package:equatable/equatable.dart';

class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class RegisterEmailChange extends RegisterEvent {
  const RegisterEmailChange({required this.email});
  
  final String email;

  @override
  List<Object?> get props => [email,];
}

class RegisterPasswordChange extends RegisterEvent {
  const RegisterPasswordChange({required this.password});

  final String password;

  @override
  List<Object?> get props => [password,];
}

class RegisterRePasswordChange extends RegisterEvent {
  const RegisterRePasswordChange({required this.rePassword});

  final String rePassword;

  @override
  List<Object?> get props => [rePassword,];
}

class RegisterFullNameChange extends RegisterEvent {
  const RegisterFullNameChange({required this.fullName});

  final String fullName;

  @override
  List<Object?> get props => [fullName,];
}

class RegisterStudentIdChange extends RegisterEvent {
  const RegisterStudentIdChange({required this.studentId});

  final String studentId;

  @override
  List<Object?> get props => [studentId,];
}

class RegisterClassChange extends RegisterEvent {
  const RegisterClassChange({required this.classID});

  final String classID;

  @override
  List<Object?> get props => [classID,];
}

class RegisterFacultyChange extends RegisterEvent {
  const RegisterFacultyChange({required this.faculty});

  final String faculty;

  @override
  List<Object?> get props => [faculty,];
}

class RegisterShowPassChange extends RegisterEvent {
  const RegisterShowPassChange();
}

class RegisterShowRePassChange extends RegisterEvent {
  const RegisterShowRePassChange();
}

class RegisterOnNextClick extends RegisterEvent {
  const RegisterOnNextClick();
}

class RegisterOnPrevClick extends RegisterEvent {
  const RegisterOnPrevClick();
}

class RegisterOnSubmit extends RegisterEvent {
  const RegisterOnSubmit();
}