import 'package:dartz/dartz.dart';
import 'package:learning_intern_support_system/domain/repository/notification.dart';

import '../../service_locator.dart';
import '../../usecase.dart';

class NotificationGetAllUseCase implements UseCase<Either, dynamic> {

  @override
  Future<Either> call({dynamic param}) async {
    return sl<NotificationRepository>().getAllNotification();
  }

}