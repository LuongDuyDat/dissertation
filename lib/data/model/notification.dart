import 'package:learning_intern_support_system/domain/entities/notification.dart';

class NotificationModel {
  final int id;
  final String title;
  final String content;
  final bool isRead;
  final String metaData;

  NotificationModel({
    required this.id,
    required this.title,
    required this.content,
    required this.isRead,
    required this.metaData,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id']  ?? '' ,
      title: map['title']  ?? '' ,
      content: map['content']  ?? '' ,
      isRead: map['isRead'] ?? '',
      metaData: map['metadata'] ?? '',
    );
  }

}

extension NotificationXModel on NotificationModel {
  NotificationEntity toNotificationEntity() {
    return NotificationEntity(
      id: id,
      title: title,
      content: content,
      isRead: isRead,
      metaData: metaData,
    );
  }
}