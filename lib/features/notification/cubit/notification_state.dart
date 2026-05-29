import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/models/notification_model.dart';
import 'package:tlu_students/models/app_error.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  factory NotificationState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isSuccess,
    @Default([]) List<NotificationModel> notifications,
    @Default(0) int total,
    @Default(0) int unreadCount,
    @Default(false) bool hasReachedMax,
    AppError? error,
  }) = _NotificationState;

  NotificationState._();

  bool get hasUnread => notifications.any((n) => !n.isRead);
}
