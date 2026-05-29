// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseResponseImpl _$$CourseResponseImplFromJson(Map<String, dynamic> json) =>
    _$CourseResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => CourseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CourseResponseImplToJson(
        _$CourseResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$CourseDataImpl _$$CourseDataImplFromJson(Map<String, dynamic> json) =>
    _$CourseDataImpl(
      id: json['id'] as String,
      subjectId: json['subject_id'] as String,
      lecturerId: json['lecturer_id'] as String,
      semesterId: json['semester_id'] as String,
      academicYear: json['academic_year'] as String?,
      room: json['room'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      allowedRadius: (json['allowed_radius'] as num?)?.toDouble(),
      maxStudents: (json['max_students'] as num).toInt(),
      currentStudents: (json['current_students'] as num).toInt(),
      dayOfWeek: (json['day_of_week'] as num).toInt(),
      lessonSlot: json['lesson_slot'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
      lecturer: Lecturer.fromJson(json['lecturer'] as Map<String, dynamic>),
      semester: json['semester'] == null
          ? null
          : Semester.fromJson(json['semester'] as Map<String, dynamic>),
      studentStats: json['student_stats'] == null
          ? null
          : StudenStats.fromJson(json['student_stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CourseDataImplToJson(_$CourseDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject_id': instance.subjectId,
      'lecturer_id': instance.lecturerId,
      'semester_id': instance.semesterId,
      'academic_year': instance.academicYear,
      'room': instance.room,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'allowed_radius': instance.allowedRadius,
      'max_students': instance.maxStudents,
      'current_students': instance.currentStudents,
      'day_of_week': instance.dayOfWeek,
      'lesson_slot': instance.lessonSlot,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'subject': instance.subject,
      'lecturer': instance.lecturer,
      'semester': instance.semester,
      'student_stats': instance.studentStats,
    };

_$StudenStatsImpl _$$StudenStatsImplFromJson(Map<String, dynamic> json) =>
    _$StudenStatsImpl(
      total: (json['total'] as num).toDouble(),
      present: (json['present'] as num).toDouble(),
      late: (json['late'] as num).toDouble(),
      absent: (json['absent'] as num).toDouble(),
      excused: (json['excused'] as num).toDouble(),
      attendanceRate: (json['attendance_rate'] as num).toDouble(),
    );

Map<String, dynamic> _$$StudenStatsImplToJson(_$StudenStatsImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'present': instance.present,
      'late': instance.late,
      'absent': instance.absent,
      'excused': instance.excused,
      'attendance_rate': instance.attendanceRate,
    };

_$SubjectImpl _$$SubjectImplFromJson(Map<String, dynamic> json) =>
    _$SubjectImpl(
      subjectCode: json['subject_code'] as String,
      subjectName: json['subject_name'] as String,
      credits: (json['credits'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SubjectImplToJson(_$SubjectImpl instance) =>
    <String, dynamic>{
      'subject_code': instance.subjectCode,
      'subject_name': instance.subjectName,
      'credits': instance.credits,
    };

_$LecturerImpl _$$LecturerImplFromJson(Map<String, dynamic> json) =>
    _$LecturerImpl(
      fullName: json['full_name'] as String,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$LecturerImplToJson(_$LecturerImpl instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'email': instance.email,
    };
