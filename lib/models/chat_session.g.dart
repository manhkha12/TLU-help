// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatSessionImpl _$$ChatSessionImplFromJson(Map<String, dynamic> json) =>
    _$ChatSessionImpl(
      id: json['id'] as String,
      status: (json['status'] as num?)?.toInt(),
      startTime: json['start_time'] as String?,
      firstMessage: json['first_message'] as String?,
      lastMessage: json['last_message'] as String?,
      lastMessageAt: json['last_message_at'] as String?,
    );

Map<String, dynamic> _$$ChatSessionImplToJson(_$ChatSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'start_time': instance.startTime,
      'first_message': instance.firstMessage,
      'last_message': instance.lastMessage,
      'last_message_at': instance.lastMessageAt,
    };
