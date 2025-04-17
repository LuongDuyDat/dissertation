import 'package:dartz/dartz.dart';

import '../../service_locator.dart';
import '../../usecase.dart';
import '../repository/auth.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {

  @override
  Future<Either> call({dynamic param}) async {
    return sl<AuthRepository>().getUser();
  }

}