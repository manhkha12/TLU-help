// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsModelImpl _$$NewsModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      recipientType: json['recipient_type'] as String,
      status: json['status'] as String,
      courseClassId: json['course_class_id'] as String?,
      courseClass: json['course_class'] == null
          ? null
          : NewsCourseClass.fromJson(
              json['course_class'] as Map<String, dynamic>),
      media: (json['media'] as List<dynamic>)
          .map((e) => NewsMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      publishedAt: DateTime.parse(json['published_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      author: json['author'] == null
          ? null
          : NewsAuthor.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NewsModelImplToJson(_$NewsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'recipient_type': instance.recipientType,
      'status': instance.status,
      'course_class_id': instance.courseClassId,
      'course_class': instance.courseClass,
      'media': instance.media,
      'published_at': instance.publishedAt.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'author': instance.author,
    };

_$NewsAuthorImpl _$$NewsAuthorImplFromJson(Map<String, dynamic> json) =>
    _$NewsAuthorImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$$NewsAuthorImplToJson(_$NewsAuthorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'avatar_url': instance.avatarUrl,
    };

_$NewsMediaImpl _$$NewsMediaImplFromJson(Map<String, dynamic> json) =>
    _$NewsMediaImpl(
      id: json['id'] as String,
      fileUrl: json['file_url'] as String,
      fileType: json['file_type'] as String,
    );

Map<String, dynamic> _$$NewsMediaImplToJson(_$NewsMediaImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file_url': instance.fileUrl,
      'file_type': instance.fileType,
    };

_$NewsCourseClassImpl _$$NewsCourseClassImplFromJson(
        Map<String, dynamic> json) =>
    _$NewsCourseClassImpl(
      id: json['id'] as String,
      subjectName: json['subject_name'] as String?,
    );

Map<String, dynamic> _$$NewsCourseClassImplToJson(
        _$NewsCourseClassImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject_name': instance.subjectName,
    };
