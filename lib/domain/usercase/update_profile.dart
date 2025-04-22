import 'package:dartz/dartz.dart';
import 'package:learning_intern_support_system/data/model/update_profile_params.dart';

import '../../service_locator.dart';
import '../../usecase.dart';
import '../repository/profile.dart';

class UpdateProfileUseCase implements UseCase<Either, UpdateProfileReqParams> {

  @override
  Future<Either> call({UpdateProfileReqParams ? param}) async {
    return sl<ProfileRepository>().updateProfile(param!);
  }

}