import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/screen/register/bloc/register_event.dart';
import 'package:learning_intern_support_system/screen/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() :
      super(const RegisterState()) {
    on<RegisterEmailChange>(_onEmailChange);
    on<RegisterPasswordChange>(_onPasswordChange);
    on<RegisterRePasswordChange>(_onRePasswordChange);
    on<RegisterFullNameChange>(_onFullNameChange);
    on<RegisterStudentIdChange>(_onStudentIdChange);
    on<RegisterClassChange>(_onClassChange);
    on<RegisterFacultyChange>(_onFacultyChange);
    on<RegisterShowPassChange>(_onShowPassChange);
    on<RegisterShowRePassChange>(_onShowRePassChange);
    on<RegisterOnPrevClick>(_onPrevClick);
    on<RegisterOnNextClick>(_onNextClick);
    on<RegisterOnSubmit>(_onSubmit);
  }

  void _onEmailChange(
      RegisterEmailChange event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(
      email: () => event.email,
    ));
  }

  void _onPasswordChange(
      RegisterPasswordChange event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(
      password: () => event.password,
    ));
  }

  void _onRePasswordChange(
      RegisterRePasswordChange event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(
      rePassword: () => event.rePassword,
    ));
  }

  void _onFullNameChange(
      RegisterFullNameChange event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(
      fullName: () => event.fullName,
    ));
  }

  void _onStudentIdChange(
      RegisterStudentIdChange event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(
      studentId: () => event.studentId,
    ));
  }

  void _onClassChange(
      RegisterClassChange event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(
      classID: () => event.classID,
    ));
  }

  void _onFacultyChange(
      RegisterFacultyChange event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(
      faculty: () => event.faculty,
    ));
  }

  void _onShowPassChange(
      RegisterShowPassChange event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(
      showPass: () => !state.showPass,
    ));
  }

  void _onShowRePassChange(
      RegisterShowRePassChange event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(
      showRepass: () => !state.showRepass,
    ));
  }

  void _onPrevClick(
      RegisterOnPrevClick event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(
      pageNumber: () => 0,
    ));
  }

  void _onNextClick(
      RegisterOnNextClick event,
      Emitter<RegisterState> emit,
      ) {
    emit(state.copyWith(
      pageNumber: () => 1,
    ));
  }

  void _onSubmit(
      RegisterOnSubmit event,
      Emitter<RegisterState> emit,
      ) async{
    emit(state.copyWith(
      registerStatus: () => RegisterStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
      registerStatus: () => RegisterStatus.success,
    ));
  }
}