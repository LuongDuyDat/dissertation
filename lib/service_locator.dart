import 'package:get_it/get_it.dart';

import 'data/repository/auth.dart';
import 'data/source/auth_api_service.dart';
import 'data/source/auth_local_service.dart';
import 'dio_client.dart';
import 'domain/repository/auth.dart';
import 'domain/usercase/get_user.dart';
import 'domain/usercase/is_logged_in.dart';
import 'domain/usercase/logout.dart';
import 'domain/usercase/signin.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(
      AuthApiServiceImpl()
  );

  sl.registerSingleton<AuthLocalService>(
      AuthLocalServiceImpl()
  );

  // Repositories
  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );

  // Usecases
  sl.registerSingleton<SignInUseCase>(
      SignInUseCase()
  );

  sl.registerSingleton<IsLoggedInUseCase>(
      IsLoggedInUseCase()
  );

  sl.registerSingleton<GetUserUseCase>(
      GetUserUseCase()
  );

  sl.registerSingleton<LogoutUseCase>(
      LogoutUseCase()
  );

}