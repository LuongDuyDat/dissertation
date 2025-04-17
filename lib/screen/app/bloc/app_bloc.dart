import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/domain/usercase/logout.dart';
import 'package:learning_intern_support_system/screen/app/bloc/app_event.dart';
import 'package:learning_intern_support_system/screen/app/bloc/app_state.dart';

import '../../../domain/usercase/is_logged_in.dart';
import '../../../service_locator.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppStarting>(_onStarting);
    on<AppAuthenticating>(_onAuthenticating);
    on<AppUnAuthenticating>(_onUnAuthenticating);
    on<AppAuthenticateError>(_onAuthenticateError);
  }

  void _onStarting (
      AppStarting event,
      Emitter<AppState> emit
      ) async{
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(state.copyWith(
        appStatus: () => AppStatus.authenticated,
      ));
    } else {
      emit(state.copyWith(
        appStatus: () => AppStatus.unauthenticated,
      ));
    }

  }

  void _onAuthenticating(
      AppAuthenticating event,
      Emitter<AppState> emit
      ) {
    emit(state.copyWith(
      appStatus: () => AppStatus.authenticated,
    ));
  }

  void _onUnAuthenticating(
      AppUnAuthenticating event,
      Emitter<AppState> emit
      ) async{
    await sl<LogoutUseCase>().call();
    emit(state.copyWith(
      appStatus: () => AppStatus.unauthenticated,
    ));
  }

  Future<void> _onAuthenticateError (
      AppAuthenticateError error,
      Emitter<AppState> emit
      ) async{
    emit(state.copyWith(
      appStatus: () => AppStatus.error
    ));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(
        appStatus: () => AppStatus.unauthenticated,
    ));
  }
}