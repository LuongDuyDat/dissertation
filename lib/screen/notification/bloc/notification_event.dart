import 'package:equatable/equatable.dart';

class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

class NotificationInit extends NotificationEvent {
  const NotificationInit();
}

class NotificationMarkAll extends NotificationEvent {
  const NotificationMarkAll();
}

class NotificationError extends NotificationEvent {
  const NotificationError({required this.error,});

  final String error;

  @override
  List<Object?> get props => [error];
}