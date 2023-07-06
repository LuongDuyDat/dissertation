import 'package:equatable/equatable.dart';
import 'package:learning_intern_support_system/model/profile_model.dart';

enum MyProfileStatus {initial, loading, success, failure,}

class MyProfileState extends Equatable {
  const MyProfileState({
    this.myProfile,
    this.myProfileStatus = MyProfileStatus.initial,
    this.error = '',
  });

  final StudentProfileModel? myProfile;
  final MyProfileStatus myProfileStatus;
  final String error;

  MyProfileState copyWith({
    StudentProfileModel Function()? myProfile,
    MyProfileStatus Function()? myProfileStatus,
    String Function()? error,
  }) {
    return MyProfileState(
      myProfile: myProfile != null ? myProfile() : this.myProfile,
      myProfileStatus: myProfileStatus != null ? myProfileStatus() : this.myProfileStatus,
      error: error != null ? error() : this.error,
    );
  }

  @override
  List<Object?> get props => [
    myProfileStatus,
    myProfile,
    error,
  ];
}