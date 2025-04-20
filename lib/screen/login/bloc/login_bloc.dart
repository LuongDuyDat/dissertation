import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:learning_intern_support_system/data/model/signin_req_params.dart';
import 'package:learning_intern_support_system/domain/usercase/signin.dart';
import 'package:learning_intern_support_system/screen/login/bloc/login_event.dart';
import 'package:learning_intern_support_system/screen/login/bloc/login_state.dart';

import '../../../service_locator.dart';
import '../../../util/strings.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() :
        super(const LoginState()) {
    on<LoginError>(_onError);
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


  void _onSubmit(
      LoginSubmit event,
      Emitter<LoginState> emit,
      ) async{
    emit(state.copyWith(
        loginStatus: () => LoginStatus.loading
    ));
    SignInReqParams signInReqParams = SignInReqParams(email: event.email, password: event.password);
    try {
      Either result = await sl<SignInUseCase>().call(param: signInReqParams);
      await result.fold(
              (error) async{
                emit(state.copyWith(
                  loginStatus: () => LoginStatus.failure,
                  error: () => loginFailedString,
                ));
                await Future.delayed(const Duration(seconds: 3));
                emit(state.copyWith(
                  error: () => '',
                  loginStatus: () => LoginStatus.initial,
                ));
          },
              (data) {
                emit(state.copyWith(
                  loginStatus: () => LoginStatus.success,
                ));
          }
      );
    } catch(e){
      emit(state.copyWith(
          loginStatus: () => LoginStatus.failure,
          error: () => e.toString(),
      ));
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(
        error: () => '',
        loginStatus: () => LoginStatus.initial,
      ));
    }

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