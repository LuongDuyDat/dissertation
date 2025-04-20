import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:learning_intern_support_system/screen/profile/change_password/bloc/change_password_event.dart';
import 'package:learning_intern_support_system/screen/profile/change_password/bloc/change_password_state.dart';

import '../../../../data/model/change_passaword_params.dart';
import '../../../../domain/usercase/change_pass.dart';
import '../../../../service_locator.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() :
        super(const ChangePasswordState()) {
    on<ChangePasswordInit>(_onInit);
    on<ChangePasswordSubmit>(_onSubmit);
    on<ChangePasswordError>(_onError);
    on<ChangePasswordShowPassChange>(_onShowPassChange);
  }

  void _onInit(
      ChangePasswordInit event,
      Emitter<ChangePasswordState> emit,
      ) async{
    emit(state.copyWith(
      changePasswordStatus: () => ChangePasswordStatus.initial,
      error: () => '',
    ));
  }

  void _onSubmit(
      ChangePasswordSubmit event,
      Emitter<ChangePasswordState> emit,
      ) async{
    emit(state.copyWith(
      changePasswordStatus: () => ChangePasswordStatus.loading,
    ));
    Either result = await sl<ChangePassUseCase>().call(param: ChangePassReqParams(oldPassword: event.oldPassword, newPassword: event.newPassword));
    result.fold(
          (failure) async{
        // Handle error — you can show a message or log it
            emit(state.copyWith(
              changePasswordStatus: () => ChangePasswordStatus.failure,
              error: () => failure,
            ));
            await Future.delayed(const Duration(seconds: 3));
            emit(state.copyWith(
              error: () => '',
              changePasswordStatus: () => ChangePasswordStatus.initial,
            ));
      },
          (success) {
        // Success case
            emit(state.copyWith(
              changePasswordStatus: () => ChangePasswordStatus.success,
            ));
      },
    );
  }

  void _onError(
      ChangePasswordError event,
      Emitter<ChangePasswordState> emit,
      ) async{
    emit(state.copyWith(
      changePasswordStatus: () => ChangePasswordStatus.failure,
      error: () => event.error,
    ));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(
      error: () => '',
      changePasswordStatus: () => ChangePasswordStatus.initial,
    ));
  }

  void _onShowPassChange(
      ChangePasswordShowPassChange event,
      Emitter<ChangePasswordState> emit
      ) {
    emit(state.copyWith(
      showPass: () => !state.showPass,
    ));
  }
}