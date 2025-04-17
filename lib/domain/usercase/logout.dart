import 'package:dartz/dartz.dart';

import '../../service_locator.dart';
import '../../usecase.dart';
import '../repository/auth.dart';

class LogoutUseCase implements UseCase<Either, dynamic> {

  @override
  Future<Either> call({param}) async {
    return await sl<AuthRepository>().logout();
  }

}