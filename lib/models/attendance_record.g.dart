// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceRecordImpl _$$AttendanceRecordImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceRecordImpl(
      id: json['id'] as String,
      studentId: json['studentId'] as String,
      studentName: json['studentName'] as String?,
      studentCode: json['studentCode'] as String?,
      status: json['status'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      sessionId: json['sessionId'] as String?,
    );

Map<String, dynamic> _$$AttendanceRecordImplToJson(
        _$AttendanceRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'studentName': instance.studentName,
      'studentCode': instance.studentCode,
      'status': instance.status,
      'timestamp': instance.timestamp.toIso8601String(),
      'sessionId': instance.sessionId,
    };
