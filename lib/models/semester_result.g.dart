// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SemesterResultImpl _$$SemesterResultImplFromJson(Map<String, dynamic> json) =>
    _$SemesterResultImpl(
      id: json['id'] as String,
      gpaSemester: (json['gpa_semester'] as num).toDouble(),
      gpaCumulative: (json['gpa_cumulative'] as num).toDouble(),
      semester: Semester.fromJson(json['semester'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SemesterResultImplToJson(
        _$SemesterResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gpa_semester': instance.gpaSemester,
      'gpa_cumulative': instance.gpaCumulative,
      'semester': instance.semester,
    };
