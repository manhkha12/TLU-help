import 'package:freezed_annotation/freezed_annotation.dart';
import 'notification_status.dart';
export 'notification_status.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    required String title,
    required String message,
    
    @JsonKey(name: 'notification_type') 
    required String notificationType,
    
    @JsonKey(name: 'is_read') 
    @Default(false) bool isRead,
    
    @JsonKey(name: 'created_at') 
    required DateTime createdAt,
    
    @JsonKey(name: 'source_id') 
    String? sourceId,
    
    NotificationStatus? status,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}