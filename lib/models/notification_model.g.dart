// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      message: json['message'] as String,
      notificationType: json['notification_type'] as String,
      isRead: json['is_read'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      sourceId: json['source_id'] as String?,
      status: $enumDecodeNullable(_$NotificationStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'message': instance.message,
      'notification_type': instance.notificationType,
      'is_read': instance.isRead,
      'created_at': instance.createdAt.toIso8601String(),
      'source_id': instance.sourceId,
      'status': _$NotificationStatusEnumMap[instance.status],
    };

const _$NotificationStatusEnumMap = {
  NotificationStatus.published: 'PUBLISHED',
  NotificationStatus.draft: 'DRAFT',
  NotificationStatus.archived: 'ARCHIVED',
  NotificationStatus.unknown: 'UNKNOWN',
};
