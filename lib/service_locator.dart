import 'package:get_it/get_it.dart';

import 'dio_client.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());
}