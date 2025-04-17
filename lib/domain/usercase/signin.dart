import 'package:dartz/dartz.dart';

import '../../data/model/signin_req_params.dart';
import '../../service_locator.dart';
import '../../usecase.dart';
import '../repository/auth.dart';

class SignInUseCase implements UseCase<Either, SignInReqParams> {

  @override
  Future<Either> call({SignInReqParams ? param}) async {
    return sl<AuthRepository>().signIn(param!);
  }

}