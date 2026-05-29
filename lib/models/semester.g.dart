// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SemesterImpl _$$SemesterImplFromJson(Map<String, dynamic> json) =>
    _$SemesterImpl(
      id: json['id'] as String?,
      semesterName: json['semester_name'] as String,
      academicYear: json['academic_year'] as String,
      tuitionPerCredit: (json['tuition_per_credit'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$SemesterImplToJson(_$SemesterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'semester_name': instance.semesterName,
      'academic_year': instance.academicYear,
      'tuition_per_credit': instance.tuitionPerCredit,
    };
