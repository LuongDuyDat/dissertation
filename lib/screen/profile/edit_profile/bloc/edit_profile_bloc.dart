import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/data/model/update_profile_params.dart';
import 'package:learning_intern_support_system/domain/usercase/update_profile.dart';

import '../../../../service_locator.dart';
import 'edit_profile_event.dart';
import 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc() :
        super(const EditProfileState()) {
    on<EditProfilePickImage>(_onPickImage);
    on<EditProfileSubmit>(_onSubmit);
    on<EditProfileError>(_onError);
    on<EditProfilePickBirthDay>(_onPickBirthday);
  }

  void _onPickImage(EditProfilePickImage event,
      Emitter<EditProfileState> emit,) {
    emit(state.copyWith(
      avatar: () => event.avatar,
    ));
  }

  void _onPickBirthday(EditProfilePickBirthDay event,
      Emitter<EditProfileState> emit,) {
    emit(state.copyWith(
      birthDay: () => event.birthDay,
    ));
  }

  void _onError(EditProfileError event,
      Emitter<EditProfileState> emit,) async {
    emit(state.copyWith(
      error: () => event.error,
      editProfileStatus: () => EditProfileStatus.failure,
    ));
    await Future.delayed(const Duration(seconds: 3));
    emit(state.copyWith(
      editProfileStatus: () => EditProfileStatus.initial,
    ));
  }

  void _onSubmit(EditProfileSubmit event,
      Emitter<EditProfileState> emit,) async {
    emit(state.copyWith(
      editProfileStatus: () => EditProfileStatus.loading,
    ));
    var result = await sl<UpdateProfileUseCase>().call(
      param: UpdateProfileReqParams(
        fullName: event.fullName,
        className: event.classId,
        birthday: state.birthDay,
        imagePath: state.avatar != null ? state.avatar!.path : null,
      ),
    );

    await result.fold(
          (failure) async{
        // Handle error — you can show a message or log it
        emit(state.copyWith(
          editProfileStatus: () => EditProfileStatus.failure,
          error: () => failure,
        ));
        await Future.delayed(const Duration(seconds: 3));
        emit(state.copyWith(
          error: () => '',
          editProfileStatus: () => EditProfileStatus.initial,
        ));
      },
          (success) {
        // Success case
        emit(state.copyWith(
          editProfileStatus: () => EditProfileStatus.success,
        ));
      },
    );
  }
}