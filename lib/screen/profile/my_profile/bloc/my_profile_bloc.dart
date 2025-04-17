import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/domain/usercase/get_user.dart';
import 'package:learning_intern_support_system/screen/profile/my_profile/bloc/my_profile_event.dart';
import 'package:learning_intern_support_system/screen/profile/my_profile/bloc/my_profile_state.dart';

import '../../../../service_locator.dart';

class MyProfileBloc extends Bloc<MyProfileEvent, MyProfileState> {
  MyProfileBloc() :
      super(const MyProfileState()) {
    on<MyProfileInit>(_onInit);
    on<MyProfileError>(_onError);
  }

  void _onInit(
      MyProfileInit event,
      Emitter<MyProfileState> emit,
      ) async{
    emit(state.copyWith(
      myProfileStatus: () => MyProfileStatus.loading,
    ));
    var studentEntity = await sl<GetUserUseCase>().call();
    await Future.delayed(const Duration(seconds: 1));
    studentEntity.fold(
          (error) {
            emit(state.copyWith(
              myProfileStatus: () => MyProfileStatus.failure,
              error: () => error,
            ));
          },
          (data) {
            emit(state.copyWith(
              myProfileStatus: () => MyProfileStatus.success,
              myProfile: () => data,
            ));
          },
    );
  }

  void _onError(
      MyProfileError event,
      Emitter<MyProfileState> emit,
      ) {
    emit(state.copyWith(
      myProfileStatus: () => MyProfileStatus.failure,
      error: () => event.error,
    ));
  }
}