// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudentImpl _$$StudentImplFromJson(Map<String, dynamic> json) =>
    _$StudentImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      studentCode: json['student_code'] as String,
      fullName: json['full_name'] as String,
      dob: DateTime.parse(json['dob'] as String),
      gender: json['gender'] as String,
      phoneNumber: json['phone_number'] as String,
      className: json['class_name'] as String,
      address: json['address'] as String,
      gpa: _doubleFromValue(json['gpa']),
      email: json['email'] as String,
      majorName: json['major_name'] as String,
      departmentName: json['department_name'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$StudentImplToJson(_$StudentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'student_code': instance.studentCode,
      'full_name': instance.fullName,
      'dob': instance.dob.toIso8601String(),
      'gender': instance.gender,
      'phone_number': instance.phoneNumber,
      'class_name': instance.className,
      'address': instance.address,
      'gpa': instance.gpa,
      'email': instance.email,
      'major_name': instance.majorName,
      'department_name': instance.departmentName,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
