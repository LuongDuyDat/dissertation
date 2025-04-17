import 'package:equatable/equatable.dart';
import 'package:learning_intern_support_system/domain/entities/notification_model.dart';

enum NotificationStatus {initial, loading, success, failure}

class NotificationState extends Equatable {
  const NotificationState({
    this.notificationStatus = NotificationStatus.initial,
    this.newNotifications = const [],
    this.oldNotifications = const [],
    this.error = '',
  });

  final NotificationStatus notificationStatus;
  final List<NotificationModel> newNotifications;
  final List<NotificationModel> oldNotifications;
  final String error;

  NotificationState copyWith({
    NotificationStatus Function()? notificationStatus,
    List<NotificationModel> Function()? newNotifications,
    List<NotificationModel> Function()? oldNotifications,
    String Function()? error,
  }) {
    return NotificationState(
      notificationStatus: notificationStatus != null ? notificationStatus() : this.notificationStatus,
      newNotifications: newNotifications != null ? newNotifications() : this.newNotifications,
      oldNotifications: oldNotifications != null ? oldNotifications() : this.oldNotifications,
      error: error != null ? error() : this.error,
    );
  }

  @override
  List<Object?> get props => [
    notificationStatus,
    newNotifications,
    oldNotifications,
    error,
  ];
}