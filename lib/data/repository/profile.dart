import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learning_intern_support_system/data/model/change_passaword_params.dart';
import 'package:learning_intern_support_system/domain/repository/profile.dart';

import '../../service_locator.dart';
import '../source/profile_api_service.dart';

class ProfileRepositoryImpl extends ProfileRepository {

  @override
  Future<Either> changePass(ChangePassReqParams changePassReqParams) async {
    Either result = await sl<ProfileApiService>().changePass(changePassReqParams);
    return result.fold(
            (error){
          return Left(error);
        },
            (data) {
          return Right(data);
        }
    );
  }

}