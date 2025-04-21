import 'package:bloc/bloc.dart';
import 'package:learning_intern_support_system/domain/entities/notification.dart';
import 'package:learning_intern_support_system/domain/usercase/get_all_notification.dart';
import 'package:learning_intern_support_system/screen/notification/bloc/notification_event.dart';
import 'package:learning_intern_support_system/screen/notification/bloc/notification_state.dart';
import 'package:learning_intern_support_system/util/strings.dart';

import '../../../service_locator.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() :
      super(const NotificationState()) {
    on<NotificationInit>(_onInit);
    on<NotificationMarkAll>(_onMarkAll);
    on<NotificationError>(_onError);
  }

  void _onInit(
      NotificationInit event,
      Emitter<NotificationState> emit,
      ) async{
    emit(state.copyWith(
      notificationStatus: () => NotificationStatus.loading,
    ));
    var listNotificationEntity = await sl<NotificationGetAllUseCase>().call();

    await listNotificationEntity.fold(
            (error) async{
          emit(state.copyWith(
            notificationStatus: () => NotificationStatus.failure,
            error: () => getNotificationFailString,
          ));
          await Future.delayed(const Duration(seconds: 3));
          emit(state.copyWith(
            error: () => '',
            notificationStatus: () => NotificationStatus.initial,
          ));
        },
            (data) {
          final notifications = data as List<NotificationEntity>;
          final oldNotifications = notifications.where((n) => n.isRead).toList();
          final newNotifications = notifications.where((n) => !n.isRead).toList();
          emit(state.copyWith(
            notificationStatus: () => NotificationStatus.success,
            newNotifications: () => newNotifications,
            oldNotifications: () => oldNotifications,
          ));

        }
    );

  }

  void _onMarkAll(
      NotificationMarkAll event,
      Emitter<NotificationState> emit,
      ) {
    // List<NotificationModel> tempNewNotifications = [];
    // for (NotificationModel element in state.newNotifications) {
    //   if (!element.isRead) {
    //     tempNewNotifications.add(element.copyWith(isRead: () => true,));
    //   } else {
    //     tempNewNotifications.add(element);
    //   }
    // }
    // List<NotificationModel> tempOldNotifications = [];
    // for (NotificationModel element in state.oldNotifications) {
    //   if (!element.isRead) {
    //     tempOldNotifications.add(element.copyWith(isRead: () => true,));
    //   } else {
    //     tempOldNotifications.add(element);
    //   }
    // }
    //
    // emit(state.copyWith(
    //   newNotifications: () => tempNewNotifications,
    //   oldNotifications: () => tempOldNotifications
    // ));
  }

  void _onError(
      NotificationError event,
      Emitter<NotificationState> emit,
      ) {
    emit(state.copyWith(
      notificationStatus: () => NotificationStatus.failure,
      error: () => event.error,
    ));
  }
}