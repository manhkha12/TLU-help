import 'package:freezed_annotation/freezed_annotation.dart';
import 'notification_model.dart';

part 'notification_response.freezed.dart';
part 'notification_response.g.dart';

@freezed
class NotificationResponse with _$NotificationResponse {
  const factory NotificationResponse({
    @Default([]) List<NotificationModel> data,
    @Default(0) int total,
    @Default(0) int unreadCount,
  }) = _NotificationResponse;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
}
