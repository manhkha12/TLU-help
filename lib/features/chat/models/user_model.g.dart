// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userId: readUserId(json, 'userId') as String,
      fullName: json['fullName'] as String,
      code: json['code'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      subtitle: json['subtitle'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'fullName': instance.fullName,
      'code': instance.code,
      'avatarUrl': instance.avatarUrl,
      'subtitle': instance.subtitle,
      'role': instance.role,
    };
