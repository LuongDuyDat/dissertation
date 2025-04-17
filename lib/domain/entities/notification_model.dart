import 'package:equatable/equatable.dart';

class NotificationModel extends Equatable {
  const NotificationModel({
    required this.type,
    required this.isRead,
    required this.title,
    required this.dateTime,
    this.company,
  });

  final int type;
  final bool isRead;
  final String title;
  final DateTime dateTime;
  final String? company;

  NotificationModel copyWith({
    bool Function()? isRead
  }) {
    return NotificationModel(
      type: type,
      isRead: isRead != null ? isRead() : this.isRead,
      title: title,
      dateTime: dateTime,
      company: company,
    );
  }

  @override
  List<Object?> get props => [
    type,
    isRead,
    title,
    dateTime,
    company,
  ];
}

List<NotificationModel> newNotificationList = [
  NotificationModel(
    type: 1,
    isRead: false,
    title: 'đã chấp nhận yêu cầu thực tập của bạn',
    dateTime: DateTime.now(),
    company: 'Viettel',
  ),
  NotificationModel(
    type: 2,
    isRead: true,
    title: 'Công nghệ phầm mềm - 102 G3',
    dateTime: DateTime.now(),
  ),
  NotificationModel(
    type: 3,
    isRead: false,
    title: 'Công nghệ phầm mềm - 102 G3',
    dateTime: DateTime.now(),
  ),
];

List<NotificationModel> oldNotificationList = [
  NotificationModel(
    type: 1,
    isRead: true,
    title: 'đã chấp nhận yêu cầu thực tập của bạn',
    dateTime: DateTime.now(),
    company: 'Viettel',
  ),
  NotificationModel(
    type: 2,
    isRead: false,
    title: 'Công nghệ phầm mềm - 102 G3',
    dateTime: DateTime.now(),
  ),
  NotificationModel(
    type: 3,
    isRead: false,
    title: 'Công nghệ phầm mềm - 102 G3',
    dateTime: DateTime.now(),
  ),
  NotificationModel(
    type: 1,
    isRead: true,
    title: 'đã chấp nhận yêu cầu thực tập của bạn',
    dateTime: DateTime.now(),
    company: 'Viettel',
  ),
  NotificationModel(
    type: 2,
    isRead: false,
    title: 'Công nghệ phầm mềm - 102 G3',
    dateTime: DateTime.now(),
  ),
  NotificationModel(
    type: 3,
    isRead: false,
    title: 'Công nghệ phầm mềm - 102 G3',
    dateTime: DateTime.now(),
  ),
];