// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_send_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatSendResponseImpl _$$ChatSendResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatSendResponseImpl(
      sessionId: json['sessionId'] as String,
      message: ChatMessage.fromJson(json['message'] as Map<String, dynamic>),
      sources: (json['sources'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ChatSendResponseImplToJson(
        _$ChatSendResponseImpl instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'message': instance.message,
      'sources': instance.sources,
    };
