import 'package:dartz/dartz.dart';

abstract class NotificationRepository {
  Future<Either> getAllNotification();
  Future<Either> markAllNotifications();
  Future<Either> markNotificationById(int id);
}