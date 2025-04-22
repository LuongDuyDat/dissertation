import 'package:dartz/dartz.dart';
import 'package:learning_intern_support_system/data/model/change_passaword_params.dart';
import 'package:learning_intern_support_system/data/model/update_profile_params.dart';

abstract class ProfileRepository {
  Future<Either> changePass(ChangePassReqParams changePassReq);
  Future<Either> updateProfile(UpdateProfileReqParams updateProfileReqParams);
}