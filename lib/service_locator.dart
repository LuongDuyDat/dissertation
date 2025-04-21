import 'package:get_it/get_it.dart';
import 'package:learning_intern_support_system/data/repository/notification.dart';
import 'package:learning_intern_support_system/data/repository/profile.dart';
import 'package:learning_intern_support_system/data/source/notification_api_service.dart';
import 'package:learning_intern_support_system/data/source/profile_api_service.dart';
import 'package:learning_intern_support_system/domain/repository/notification.dart';
import 'package:learning_intern_support_system/domain/repository/profile.dart';
import 'package:learning_intern_support_system/domain/usercase/change_pass.dart';
import 'package:learning_intern_support_system/domain/usercase/get_all_notification.dart';
import 'package:learning_intern_support_system/domain/usercase/mark_all_notifications.dart';
import 'package:learning_intern_support_system/domain/usercase/mark_notification_by_id.dart';

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
  sl.registerSingleton<ProfileApiService>(
    ProfileApiServiceImpl()
  );

  sl.registerSingleton<NotificationApiService>(
    NotificationServiceImpl()
  );

  // Repositories
  sl.registerSingleton<AuthRepository>(
      AuthRepositoryImpl()
  );
  sl.registerSingleton<ProfileRepository>(
    ProfileRepositoryImpl()
  );

  sl.registerSingleton<NotificationRepository>(
    NotificationRepositoryImpl()
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

  sl.registerSingleton<ChangePassUseCase>(
    ChangePassUseCase()
  );

  sl.registerSingleton<NotificationGetAllUseCase>(
      NotificationGetAllUseCase()
  );

  sl.registerSingleton<NotificationMarkAllUseCase>(
      NotificationMarkAllUseCase()
  );

  sl.registerSingleton<NotificationMarkByIdUseCase>(
      NotificationMarkByIdUseCase()
  );

}