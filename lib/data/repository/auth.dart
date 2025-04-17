import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/repository/auth.dart';
import '../../service_locator.dart';
import '../model/signin_req_params.dart';
import '../model/user.dart';
import '../source/auth_api_service.dart';
import '../source/auth_local_service.dart';


class AuthRepositoryImpl extends AuthRepository {


  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either> getUser() async {
    Either result = await sl<AuthApiService>().getUser();
    return result.fold(
            (error){
          return Left(error);
        },
            (data) {
          Response response = data;
          var userModel = UserModel.fromMap(response.data);
          var userEntity = userModel.toStudentEntity();
          return Right(userEntity);
        }
    );
  }

  @override
  Future<Either> logout() async {
    return await sl<AuthLocalService>().logout();
  }

  @override
  Future < Either > signIn(SignInReqParams signinReq) async {
    Either result = await sl < AuthApiService > ().signIn(signinReq);
    return result.fold(
            (error) {
          return Left(error);
        },
            (data) async {
          Response response = data;
          SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
          sharedPreferences.setString('token', response.data['accessToken']);
          return Right(response);
        }
    );
  }

}