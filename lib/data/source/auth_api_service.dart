import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../dio_client.dart';
import '../../service_locator.dart';
import '../../util/api_urls.dart';
import '../model/signin_req_params.dart';

abstract class AuthApiService {

  Future<Either> getUser();
  Future<Either> signIn(SignInReqParams signInReq);
}

class AuthApiServiceImpl extends AuthApiService {


  @override
  Future<Either> getUser() async {

    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      var response = await sl<DioClient>().get(
          ApiUrls.userProfile,
          options: Options(
              headers: {
                'Authorization' : 'Bearer $token '
              }
          )
      );

      return Right(response);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signIn(SignInReqParams signInReq) async {
    try {

      var response = await sl<DioClient>().post(
          ApiUrls.login,
          data: signInReq.toMap()
      );

      return Right(response);

    } on DioException catch(e) {
      return Left(e.response!.data['message']);
    }
  }

}