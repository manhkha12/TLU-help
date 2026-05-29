// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return _NewsModel.fromJson(json);
}

/// @nodoc
mixin _$NewsModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'recipient_type')
  String get recipientType => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_class_id')
  String? get courseClassId => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_class')
  NewsCourseClass? get courseClass => throw _privateConstructorUsedError;
  List<NewsMedia> get media => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_at')
  DateTime get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  NewsAuthor? get author => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsModelCopyWith<NewsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsModelCopyWith<$Res> {
  factory $NewsModelCopyWith(NewsModel value, $Res Function(NewsModel) then) =
      _$NewsModelCopyWithImpl<$Res, NewsModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      @JsonKey(name: 'recipient_type') String recipientType,
      String status,
      @JsonKey(name: 'course_class_id') String? courseClassId,
      @JsonKey(name: 'course_class') NewsCourseClass? courseClass,
      List<NewsMedia> media,
      @JsonKey(name: 'published_at') DateTime publishedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      NewsAuthor? author});

  $NewsCourseClassCopyWith<$Res>? get courseClass;
  $NewsAuthorCopyWith<$Res>? get author;
}

/// @nodoc
class _$NewsModelCopyWithImpl<$Res, $Val extends NewsModel>
    implements $NewsModelCopyWith<$Res> {
  _$NewsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? recipientType = null,
    Object? status = null,
    Object? courseClassId = freezed,
    Object? courseClass = freezed,
    Object? media = null,
    Object? publishedAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? author = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      recipientType: null == recipientType
          ? _value.recipientType
          : recipientType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      courseClassId: freezed == courseClassId
          ? _value.courseClassId
          : courseClassId // ignore: cast_nullable_to_non_nullable
              as String?,
      courseClass: freezed == courseClass
          ? _value.courseClass
          : courseClass // ignore: cast_nullable_to_non_nullable
              as NewsCourseClass?,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as List<NewsMedia>,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as NewsAuthor?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NewsCourseClassCopyWith<$Res>? get courseClass {
    if (_value.courseClass == null) {
      return null;
    }

    return $NewsCourseClassCopyWith<$Res>(_value.courseClass!, (value) {
      return _then(_value.copyWith(courseClass: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NewsAuthorCopyWith<$Res>? get author {
    if (_value.author == null) {
      return null;
    }

    return $NewsAuthorCopyWith<$Res>(_value.author!, (value) {
      return _then(_value.copyWith(author: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NewsModelImplCopyWith<$Res>
    implements $NewsModelCopyWith<$Res> {
  factory _$$NewsModelImplCopyWith(
          _$NewsModelImpl value, $Res Function(_$NewsModelImpl) then) =
      __$$NewsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String content,
      @JsonKey(name: 'recipient_type') String recipientType,
      String status,
      @JsonKey(name: 'course_class_id') String? courseClassId,
      @JsonKey(name: 'course_class') NewsCourseClass? courseClass,
      List<NewsMedia> media,
      @JsonKey(name: 'published_at') DateTime publishedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      NewsAuthor? author});

  @override
  $NewsCourseClassCopyWith<$Res>? get courseClass;
  @override
  $NewsAuthorCopyWith<$Res>? get author;
}

/// @nodoc
class __$$NewsModelImplCopyWithImpl<$Res>
    extends _$NewsModelCopyWithImpl<$Res, _$NewsModelImpl>
    implements _$$NewsModelImplCopyWith<$Res> {
  __$$NewsModelImplCopyWithImpl(
      _$NewsModelImpl _value, $Res Function(_$NewsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? recipientType = null,
    Object? status = null,
    Object? courseClassId = freezed,
    Object? courseClass = freezed,
    Object? media = null,
    Object? publishedAt = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? author = freezed,
  }) {
    return _then(_$NewsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      recipientType: null == recipientType
          ? _value.recipientType
          : recipientType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      courseClassId: freezed == courseClassId
          ? _value.courseClassId
          : courseClassId // ignore: cast_nullable_to_non_nullable
              as String?,
      courseClass: freezed == courseClass
          ? _value.courseClass
          : courseClass // ignore: cast_nullable_to_non_nullable
              as NewsCourseClass?,
      media: null == media
          ? _value._media
          : media // ignore: cast_nullable_to_non_nullable
              as List<NewsMedia>,
      publishedAt: null == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as NewsAuthor?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsModelImpl implements _NewsModel {
  _$NewsModelImpl(
      {required this.id,
      required this.title,
      required this.content,
      @JsonKey(name: 'recipient_type') required this.recipientType,
      required this.status,
      @JsonKey(name: 'course_class_id') this.courseClassId,
      @JsonKey(name: 'course_class') this.courseClass,
      required final List<NewsMedia> media,
      @JsonKey(name: 'published_at') required this.publishedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.author})
      : _media = media;

  factory _$NewsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsModelImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String content;
  @override
  @JsonKey(name: 'recipient_type')
  final String recipientType;
  @override
  final String status;
  @override
  @JsonKey(name: 'course_class_id')
  final String? courseClassId;
  @override
  @JsonKey(name: 'course_class')
  final NewsCourseClass? courseClass;
  final List<NewsMedia> _media;
  @override
  List<NewsMedia> get media {
    if (_media is EqualUnmodifiableListView) return _media;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_media);
  }

  @override
  @JsonKey(name: 'published_at')
  final DateTime publishedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final NewsAuthor? author;

  @override
  String toString() {
    return 'NewsModel(id: $id, title: $title, content: $content, recipientType: $recipientType, status: $status, courseClassId: $courseClassId, courseClass: $courseClass, media: $media, publishedAt: $publishedAt, createdAt: $createdAt, updatedAt: $updatedAt, author: $author)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.recipientType, recipientType) ||
                other.recipientType == recipientType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.courseClassId, courseClassId) ||
                other.courseClassId == courseClassId) &&
            (identical(other.courseClass, courseClass) ||
                other.courseClass == courseClass) &&
            const DeepCollectionEquality().equals(other._media, _media) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      recipientType,
      status,
      courseClassId,
      courseClass,
      const DeepCollectionEquality().hash(_media),
      publishedAt,
      createdAt,
      updatedAt,
      author);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsModelImplCopyWith<_$NewsModelImpl> get copyWith =>
      __$$NewsModelImplCopyWithImpl<_$NewsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsModelImplToJson(
      this,
    );
  }
}

abstract class _NewsModel implements NewsModel {
  factory _NewsModel(
      {required final String id,
      required final String title,
      required final String content,
      @JsonKey(name: 'recipient_type') required final String recipientType,
      required final String status,
      @JsonKey(name: 'course_class_id') final String? courseClassId,
      @JsonKey(name: 'course_class') final NewsCourseClass? courseClass,
      required final List<NewsMedia> media,
      @JsonKey(name: 'published_at') required final DateTime publishedAt,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      required final NewsAuthor? author}) = _$NewsModelImpl;

  factory _NewsModel.fromJson(Map<String, dynamic> json) =
      _$NewsModelImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(name: 'recipient_type')
  String get recipientType;
  @override
  String get status;
  @override
  @JsonKey(name: 'course_class_id')
  String? get courseClassId;
  @override
  @JsonKey(name: 'course_class')
  NewsCourseClass? get courseClass;
  @override
  List<NewsMedia> get media;
  @override
  @JsonKey(name: 'published_at')
  DateTime get publishedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  NewsAuthor? get author;
  @override
  @JsonKey(ignore: true)
  _$$NewsModelImplCopyWith<_$NewsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewsAuthor _$NewsAuthorFromJson(Map<String, dynamic> json) {
  return _NewsAuthor.fromJson(json);
}

/// @nodoc
mixin _$NewsAuthor {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsAuthorCopyWith<NewsAuthor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsAuthorCopyWith<$Res> {
  factory $NewsAuthorCopyWith(
          NewsAuthor value, $Res Function(NewsAuthor) then) =
      _$NewsAuthorCopyWithImpl<$Res, NewsAuthor>;
  @useResult
  $Res call(
      {String id,
      String username,
      @JsonKey(name: 'avatar_url') String? avatarUrl});
}

/// @nodoc
class _$NewsAuthorCopyWithImpl<$Res, $Val extends NewsAuthor>
    implements $NewsAuthorCopyWith<$Res> {
  _$NewsAuthorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsAuthorImplCopyWith<$Res>
    implements $NewsAuthorCopyWith<$Res> {
  factory _$$NewsAuthorImplCopyWith(
          _$NewsAuthorImpl value, $Res Function(_$NewsAuthorImpl) then) =
      __$$NewsAuthorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      @JsonKey(name: 'avatar_url') String? avatarUrl});
}

/// @nodoc
class __$$NewsAuthorImplCopyWithImpl<$Res>
    extends _$NewsAuthorCopyWithImpl<$Res, _$NewsAuthorImpl>
    implements _$$NewsAuthorImplCopyWith<$Res> {
  __$$NewsAuthorImplCopyWithImpl(
      _$NewsAuthorImpl _value, $Res Function(_$NewsAuthorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? avatarUrl = freezed,
  }) {
    return _then(_$NewsAuthorImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsAuthorImpl implements _NewsAuthor {
  _$NewsAuthorImpl(
      {required this.id,
      required this.username,
      @JsonKey(name: 'avatar_url') this.avatarUrl});

  factory _$NewsAuthorImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsAuthorImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;

  @override
  String toString() {
    return 'NewsAuthor(id: $id, username: $username, avatarUrl: $avatarUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsAuthorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, avatarUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsAuthorImplCopyWith<_$NewsAuthorImpl> get copyWith =>
      __$$NewsAuthorImplCopyWithImpl<_$NewsAuthorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsAuthorImplToJson(
      this,
    );
  }
}

abstract class _NewsAuthor implements NewsAuthor {
  factory _NewsAuthor(
      {required final String id,
      required final String username,
      @JsonKey(name: 'avatar_url') final String? avatarUrl}) = _$NewsAuthorImpl;

  factory _NewsAuthor.fromJson(Map<String, dynamic> json) =
      _$NewsAuthorImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  @JsonKey(name: 'avatar_url')
  String? get avatarUrl;
  @override
  @JsonKey(ignore: true)
  _$$NewsAuthorImplCopyWith<_$NewsAuthorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewsMedia _$NewsMediaFromJson(Map<String, dynamic> json) {
  return _NewsMedia.fromJson(json);
}

/// @nodoc
mixin _$NewsMedia {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_url')
  String get fileUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'file_type')
  String get fileType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsMediaCopyWith<NewsMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsMediaCopyWith<$Res> {
  factory $NewsMediaCopyWith(NewsMedia value, $Res Function(NewsMedia) then) =
      _$NewsMediaCopyWithImpl<$Res, NewsMedia>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'file_url') String fileUrl,
      @JsonKey(name: 'file_type') String fileType});
}

/// @nodoc
class _$NewsMediaCopyWithImpl<$Res, $Val extends NewsMedia>
    implements $NewsMediaCopyWith<$Res> {
  _$NewsMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileUrl = null,
    Object? fileType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsMediaImplCopyWith<$Res>
    implements $NewsMediaCopyWith<$Res> {
  factory _$$NewsMediaImplCopyWith(
          _$NewsMediaImpl value, $Res Function(_$NewsMediaImpl) then) =
      __$$NewsMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'file_url') String fileUrl,
      @JsonKey(name: 'file_type') String fileType});
}

/// @nodoc
class __$$NewsMediaImplCopyWithImpl<$Res>
    extends _$NewsMediaCopyWithImpl<$Res, _$NewsMediaImpl>
    implements _$$NewsMediaImplCopyWith<$Res> {
  __$$NewsMediaImplCopyWithImpl(
      _$NewsMediaImpl _value, $Res Function(_$NewsMediaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fileUrl = null,
    Object? fileType = null,
  }) {
    return _then(_$NewsMediaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      fileType: null == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsMediaImpl implements _NewsMedia {
  _$NewsMediaImpl(
      {required this.id,
      @JsonKey(name: 'file_url') required this.fileUrl,
      @JsonKey(name: 'file_type') required this.fileType});

  factory _$NewsMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsMediaImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'file_url')
  final String fileUrl;
  @override
  @JsonKey(name: 'file_type')
  final String fileType;

  @override
  String toString() {
    return 'NewsMedia(id: $id, fileUrl: $fileUrl, fileType: $fileType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsMediaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fileUrl, fileType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsMediaImplCopyWith<_$NewsMediaImpl> get copyWith =>
      __$$NewsMediaImplCopyWithImpl<_$NewsMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsMediaImplToJson(
      this,
    );
  }
}

abstract class _NewsMedia implements NewsMedia {
  factory _NewsMedia(
          {required final String id,
          @JsonKey(name: 'file_url') required final String fileUrl,
          @JsonKey(name: 'file_type') required final String fileType}) =
      _$NewsMediaImpl;

  factory _NewsMedia.fromJson(Map<String, dynamic> json) =
      _$NewsMediaImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'file_url')
  String get fileUrl;
  @override
  @JsonKey(name: 'file_type')
  String get fileType;
  @override
  @JsonKey(ignore: true)
  _$$NewsMediaImplCopyWith<_$NewsMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NewsCourseClass _$NewsCourseClassFromJson(Map<String, dynamic> json) {
  return _NewsCourseClass.fromJson(json);
}

/// @nodoc
mixin _$NewsCourseClass {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'subject_name')
  String? get subjectName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsCourseClassCopyWith<NewsCourseClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCourseClassCopyWith<$Res> {
  factory $NewsCourseClassCopyWith(
          NewsCourseClass value, $Res Function(NewsCourseClass) then) =
      _$NewsCourseClassCopyWithImpl<$Res, NewsCourseClass>;
  @useResult
  $Res call({String id, @JsonKey(name: 'subject_name') String? subjectName});
}

/// @nodoc
class _$NewsCourseClassCopyWithImpl<$Res, $Val extends NewsCourseClass>
    implements $NewsCourseClassCopyWith<$Res> {
  _$NewsCourseClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectName = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: freezed == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsCourseClassImplCopyWith<$Res>
    implements $NewsCourseClassCopyWith<$Res> {
  factory _$$NewsCourseClassImplCopyWith(_$NewsCourseClassImpl value,
          $Res Function(_$NewsCourseClassImpl) then) =
      __$$NewsCourseClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, @JsonKey(name: 'subject_name') String? subjectName});
}

/// @nodoc
class __$$NewsCourseClassImplCopyWithImpl<$Res>
    extends _$NewsCourseClassCopyWithImpl<$Res, _$NewsCourseClassImpl>
    implements _$$NewsCourseClassImplCopyWith<$Res> {
  __$$NewsCourseClassImplCopyWithImpl(
      _$NewsCourseClassImpl _value, $Res Function(_$NewsCourseClassImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectName = freezed,
  }) {
    return _then(_$NewsCourseClassImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: freezed == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsCourseClassImpl implements _NewsCourseClass {
  _$NewsCourseClassImpl(
      {required this.id, @JsonKey(name: 'subject_name') this.subjectName});

  factory _$NewsCourseClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsCourseClassImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'subject_name')
  final String? subjectName;

  @override
  String toString() {
    return 'NewsCourseClass(id: $id, subjectName: $subjectName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsCourseClassImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, subjectName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsCourseClassImplCopyWith<_$NewsCourseClassImpl> get copyWith =>
      __$$NewsCourseClassImplCopyWithImpl<_$NewsCourseClassImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsCourseClassImplToJson(
      this,
    );
  }
}

abstract class _NewsCourseClass implements NewsCourseClass {
  factory _NewsCourseClass(
          {required final String id,
          @JsonKey(name: 'subject_name') final String? subjectName}) =
      _$NewsCourseClassImpl;

  factory _NewsCourseClass.fromJson(Map<String, dynamic> json) =
      _$NewsCourseClassImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'subject_name')
  String? get subjectName;
  @override
  @JsonKey(ignore: true)
  _$$NewsCourseClassImplCopyWith<_$NewsCourseClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
