// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GradeItemImpl _$$GradeItemImplFromJson(Map<String, dynamic> json) =>
    _$GradeItemImpl(
      id: json['id'] as String,
      scoreAttendance: (json['score_attendance'] as num?)?.toDouble(),
      scoreProcess: (json['score_process'] as num?)?.toDouble(),
      scoreFinal: (json['score_final'] as num?)?.toDouble(),
      scoreTotal10: (json['score_total_10'] as num?)?.toDouble(),
      enrollment:
          Enrollment.fromJson(json['enrollment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GradeItemImplToJson(_$GradeItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'score_attendance': instance.scoreAttendance,
      'score_process': instance.scoreProcess,
      'score_final': instance.scoreFinal,
      'score_total_10': instance.scoreTotal10,
      'enrollment': instance.enrollment,
    };

_$CourseClassImpl _$$CourseClassImplFromJson(Map<String, dynamic> json) =>
    _$CourseClassImpl(
      id: json['id'] as String,
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
      semester: Semester.fromJson(json['semester'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CourseClassImplToJson(_$CourseClassImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'semester': instance.semester,
    };

_$SubjectImpl _$$SubjectImplFromJson(Map<String, dynamic> json) =>
    _$SubjectImpl(
      subjectCode: json['subject_code'] as String,
      subjectName: json['subject_name'] as String,
      credits: (json['credits'] as num).toInt(),
    );

Map<String, dynamic> _$$SubjectImplToJson(_$SubjectImpl instance) =>
    <String, dynamic>{
      'subject_code': instance.subjectCode,
      'subject_name': instance.subjectName,
      'credits': instance.credits,
    };

_$EnrollmentImpl _$$EnrollmentImplFromJson(Map<String, dynamic> json) =>
    _$EnrollmentImpl(
      id: json['id'] as String,
      courseClass:
          CourseClass.fromJson(json['course_class'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EnrollmentImplToJson(_$EnrollmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_class': instance.courseClass,
    };
