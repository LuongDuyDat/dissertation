
import 'package:equatable/equatable.dart';

enum AppStatus {initial, unauthenticated, authenticating, authenticated, error}

class AppState extends Equatable {
  const AppState({
    this.appStatus = AppStatus.initial,
    this.error = '',
  });

  final AppStatus appStatus;
  final String error;

  AppState copyWith({
    AppStatus Function()? appStatus
  }) {
    return AppState(
      appStatus: appStatus != null ? appStatus() : this.appStatus,
    );
  }

  @override
  List<Object?> get props => [
    appStatus,
  ];
}