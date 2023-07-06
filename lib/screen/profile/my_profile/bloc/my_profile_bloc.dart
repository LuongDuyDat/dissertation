import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/model/profile_model.dart';
import 'package:learning_intern_support_system/screen/profile/my_profile/bloc/my_profile_event.dart';
import 'package:learning_intern_support_system/screen/profile/my_profile/bloc/my_profile_state.dart';

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
    await Future.delayed(const Duration(seconds: 1));
    emit(state.copyWith(
      myProfileStatus: () => MyProfileStatus.success,
      myProfile: () => myProfile1,
    ));
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