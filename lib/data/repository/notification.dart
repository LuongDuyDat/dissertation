import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learning_intern_support_system/data/source/notification_api_service.dart';

import '../../domain/entities/notification.dart';
import '../../domain/repository/notification.dart';
import '../../service_locator.dart';
import '../model/notification.dart';

class NotificationRepositoryImpl extends NotificationRepository {

  @override
  Future<Either> getAllNotification() async {
    Either result = await sl<NotificationApiService>().getAllNotifications();
    return result.fold(
            (error){
          return Left(error);
        },
            (data) {
              Response response = data;
              List<NotificationModel> notificationModelList = (response.data as List).map((json) => NotificationModel.fromMap(json as Map<String, dynamic>))
                  .toList();
              final List<NotificationEntity> entities = notificationModelList
                  .map((model) => model.toNotificationEntity())
                  .toList();
              return Right(entities);
        }
    );
  }

  @override
  Future<Either> markAllNotifications() async {
    Either result = await sl<NotificationApiService>().markAllNotifications();
    return result.fold(
            (error){
          return Left(error);
        },
            (data) {
          return Right(data);
        }
    );
  }

  @override
  Future<Either> markNotificationById(int id) async {
    Either result = await sl<NotificationApiService>().markNotificationById(id);
    return result.fold(
            (error){
          return Left(error);
        },
            (data) {
          return Right(data);
        }
    );
  }

}