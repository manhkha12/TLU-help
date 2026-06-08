// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttendanceSessionImpl _$$AttendanceSessionImplFromJson(
        Map<String, dynamic> json) =>
    _$AttendanceSessionImpl(
      id: json['id'] as String,
      courseClassId: json['course_class_id'] as String,
      checkInTime: DateTime.parse(json['check_in_time'] as String),
      date: DateTime.parse(json['date'] as String),
      isReminderSent: json['is_reminder_sent'] as bool,
      courseClass:
          CourseData.fromJson(json['course_class'] as Map<String, dynamic>),
      studentStats:
          StudenStats.fromJson(json['student_stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AttendanceSessionImplToJson(
        _$AttendanceSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_class_id': instance.courseClassId,
      'check_in_time': instance.checkInTime.toIso8601String(),
      'date': instance.date.toIso8601String(),
      'is_reminder_sent': instance.isReminderSent,
      'course_class': instance.courseClass,
      'student_stats': instance.studentStats,
    };
