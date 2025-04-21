class NotificationEntity {
  final int id;
  final String title;
  final String content;
  final bool isRead;
  final String metaData;

  NotificationEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.isRead,
    required this.metaData,
  });

}