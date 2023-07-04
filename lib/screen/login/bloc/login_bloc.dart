import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/screen/login/bloc/login_event.dart';
import 'package:learning_intern_support_system/screen/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() :
        super(const LoginState()) {
    on<LoginError>(_onError);
    on<LoginEmailChange>(_onEmailChange);
    on<LoginPasswordChange>(_onPasswordChange);
    on<LoginSubmit>(_onSubmit);
    on<LoginShowPassChange>(_onShowPassChange);
  }

  void _onError(
      LoginError event,
      Emitter<LoginState> emit
      ) async{
    emit(state.copyWith(
      error: () => event.error,
      loginStatus: () => LoginStatus.failure,
    ));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(
      error: () => '',
      loginStatus: () => LoginStatus.initial,
    ));
  }

  void _onEmailChange(
      LoginEmailChange event,
      Emitter<LoginState> emit,
      ) {
    emit(state.copyWith(
      email: () => event.email,
    ));
  }

  void _onPasswordChange(
      LoginPasswordChange event,
      Emitter<LoginState> emit,
      ) {
    emit(state.copyWith(
      password: () => event.password,
    ));
  }

  void _onSubmit(
      LoginSubmit event,
      Emitter<LoginState> emit,
      ) async{
    emit(state.copyWith(
        loginStatus: () => LoginStatus.loading
    ));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
        loginStatus: () => LoginStatus.success
    ));
  }

  void _onShowPassChange(
      LoginShowPassChange event,
      Emitter<LoginState> emit
      ) {
    emit(state.copyWith(
      showPass: () => !state.showPass,
    ));
  }
}