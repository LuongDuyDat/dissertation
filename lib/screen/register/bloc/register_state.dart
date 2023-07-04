import 'package:equatable/equatable.dart';

enum RegisterStatus {initial, loading, success, failure}

class RegisterState extends Equatable {
  const RegisterState({
    this.email = '',
    this.password = '',
    this.rePassword = '',
    this.error = '',
    this.registerStatus = RegisterStatus.initial,
    this.showPass = false,
    this.showRepass = false,
    this.fullName = '',
    this.studentId = '',
    this.classID = '',
    this.faculty = '',
    this.pageNumber = 0,
  });

  final String email;
  final String password;
  final String rePassword;
  final String error;
  final String fullName;
  final String studentId;
  final String classID;
  final String faculty;
  final RegisterStatus registerStatus;
  final bool showPass;
  final bool showRepass;
  final int pageNumber;

  RegisterState copyWith({
    String Function()? email,
    String Function()? password,
    String Function()? rePassword,
    String Function()? error,
    String Function()? fullName,
    String Function()? studentId,
    String Function()? classID,
    String Function()? faculty,
    RegisterStatus Function()? registerStatus,
    bool Function()? showPass,
    bool Function()? showRepass,
    int Function()? pageNumber,
  }) {
    return RegisterState(
      email: email != null ? email() : this.email,
      password: password != null ? password() : this.password,
      rePassword: rePassword != null ? rePassword() : this.rePassword,
      error: error != null ? error() : this.error,
      fullName: fullName != null ? fullName() : this.fullName,
      studentId: studentId != null ? studentId() : this.studentId,
      classID: classID != null ? classID() : this.classID,
      faculty: faculty != null ? faculty() : this.faculty,
      registerStatus: registerStatus != null ? registerStatus() : this.registerStatus,
      showPass: showPass != null ? showPass() : this.showPass,
      showRepass: showRepass != null ? showRepass() : this.showRepass,
      pageNumber: pageNumber != null ? pageNumber() : this.pageNumber,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    rePassword,
    error,
    fullName,
    studentId,
    classID,
    faculty,
    registerStatus,
    showPass,
    showRepass,
    pageNumber,
  ];
}