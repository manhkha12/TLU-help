import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  factory NewsModel({
    required String id,
    required String title,
    required String content,
    @JsonKey(name: 'recipient_type') required String recipientType,
    required String status,
    @JsonKey(name: 'course_class_id') String? courseClassId,
    @JsonKey(name: 'course_class') NewsCourseClass? courseClass,
    required List<NewsMedia> media,
    @JsonKey(name: 'published_at') required DateTime publishedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required NewsAuthor? author,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
}

@freezed
class NewsAuthor with _$NewsAuthor {
  factory NewsAuthor({
    required String id,
    required String username,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
  }) = _NewsAuthor;

  factory NewsAuthor.fromJson(Map<String, dynamic> json) => _$NewsAuthorFromJson(json);
}

@freezed
class NewsMedia with _$NewsMedia {
  factory NewsMedia({
    required String id,
    @JsonKey(name: 'file_url') required String fileUrl,
    @JsonKey(name: 'file_type') required String fileType,
  }) = _NewsMedia;

  factory NewsMedia.fromJson(Map<String, dynamic> json) => _$NewsMediaFromJson(json);
}

@freezed
class NewsCourseClass with _$NewsCourseClass {
  factory NewsCourseClass({
    required String id,
    @JsonKey(name: 'subject_name') String? subjectName,
  }) = _NewsCourseClass;

  factory NewsCourseClass.fromJson(Map<String, dynamic> json) => _$NewsCourseClassFromJson(json);
}
