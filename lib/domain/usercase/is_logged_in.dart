import '../../service_locator.dart';
import '../../usecase.dart';
import '../repository/auth.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {

  @override
  Future<bool> call({dynamic param}) async {
    return sl<AuthRepository>().isLoggedIn();
  }

}