import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learning_intern_support_system/data/model/change_passaword_params.dart';
import 'package:learning_intern_support_system/data/model/update_profile_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dio_client.dart';
import '../../service_locator.dart';
import '../../util/api_urls.dart';

abstract class ProfileApiService {

  Future<Either> changePass(ChangePassReqParams changePassReqParams);
  Future<Either> updateProfile(UpdateProfileReqParams updateProfileReqParams);
}

class ProfileApiServiceImpl extends ProfileApiService {


  @override
  Future<Either> changePass(ChangePassReqParams changePassReqParams) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      var response = await sl<DioClient>().post(
          ApiUrls.changePassword,
          options: Options(
              headers: {
                'Authorization' : 'Bearer $token '
              }
          ),
          data: changePassReqParams.toMap(),
      );

      return Right(response);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> updateProfile(UpdateProfileReqParams updateProfileReqParams) async{
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      var id = sharedPreferences.getInt('id');
      updateProfileReqParams.toMap().then((map) {
        print("Request Map: $map");
      });
      var response = await sl<DioClient>().patch(
        ApiUrls.updateProfile + id.toString(),
        options: Options(
            headers: {
              'Authorization' : 'Bearer $token '
            }
        ),
        data: await updateProfileReqParams.toMap(),
      );

      return Right(response);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

}