import 'package:dartz/dartz.dart';

import '../../data/model/signin_req_params.dart';

abstract class AuthRepository {
  Future<Either> signIn(SignInReqParams signInReq);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
  Future<Either> logout();
}