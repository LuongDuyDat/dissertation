import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/screen/forget_password/bloc/forgot_pass_event.dart';
import 'package:learning_intern_support_system/screen/forget_password/bloc/forgot_pass_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() :
      super(const ForgotPasswordState()) {
    on<ForgotPasswordEmailChange>(_onEmailChange);
    on<ForgotPasswordError>(_onError);
    on<ForgotPasswordSubmit>(_onSubmit);
  }

  void _onEmailChange(
      ForgotPasswordEmailChange event,
      Emitter<ForgotPasswordState> emit,
      ) {
    emit(state.copyWith(
      email: () => event.email,
    ));
  }

  void _onError(
      ForgotPasswordError event,
      Emitter<ForgotPasswordState> emit,
      ) async{
    emit(state.copyWith(
      forgotPasswordStatus: () => ForgotPasswordStatus.failure,
      error: () => event.error,
    ));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
      forgotPasswordStatus: () => ForgotPasswordStatus.initial,
      error: () => '',
    ));
  }

  void _onSubmit(
      ForgotPasswordSubmit event,
      Emitter<ForgotPasswordState> emit,
      ) async{
    emit(state.copyWith(
      forgotPasswordStatus: () => ForgotPasswordStatus.loading,
    ));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
      forgotPasswordStatus: () => ForgotPasswordStatus.success,
    ));
  }
}