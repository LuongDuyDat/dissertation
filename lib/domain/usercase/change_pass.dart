import 'package:dartz/dartz.dart';
import 'package:learning_intern_support_system/data/model/change_passaword_params.dart';
import 'package:learning_intern_support_system/domain/repository/profile.dart';

import '../../service_locator.dart';
import '../../usecase.dart';

class ChangePassUseCase implements UseCase<Either, ChangePassReqParams> {

  @override
  Future<Either> call({ChangePassReqParams ? param}) async {
    return sl<ProfileRepository>().changePass(param!);
  }
}