import 'package:dartz/dartz.dart';

import '../../service_locator.dart';
import '../../usecase.dart';
import '../repository/notification.dart';

class NotificationMarkAllUseCase implements UseCase<Either, dynamic> {

  @override
  Future<Either> call({dynamic param}) async {
    return sl<NotificationRepository>().markAllNotifications();
  }

}