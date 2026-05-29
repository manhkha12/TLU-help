// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DocumentType _$DocumentTypeFromJson(Map<String, dynamic> json) {
  return _DocumentType.fromJson(json);
}

/// @nodoc
mixin _$DocumentType {
  dynamic get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'document_name')
  String get documentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'processing_days')
  int get processingDays => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentTypeCopyWith<DocumentType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentTypeCopyWith<$Res> {
  factory $DocumentTypeCopyWith(
          DocumentType value, $Res Function(DocumentType) then) =
      _$DocumentTypeCopyWithImpl<$Res, DocumentType>;
  @useResult
  $Res call(
      {dynamic id,
      @JsonKey(name: 'document_name') String documentName,
      @JsonKey(name: 'processing_days') int processingDays,
      String? description});
}

/// @nodoc
class _$DocumentTypeCopyWithImpl<$Res, $Val extends DocumentType>
    implements $DocumentTypeCopyWith<$Res> {
  _$DocumentTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? documentName = null,
    Object? processingDays = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      documentName: null == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      processingDays: null == processingDays
          ? _value.processingDays
          : processingDays // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DocumentTypeImplCopyWith<$Res>
    implements $DocumentTypeCopyWith<$Res> {
  factory _$$DocumentTypeImplCopyWith(
          _$DocumentTypeImpl value, $Res Function(_$DocumentTypeImpl) then) =
      __$$DocumentTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic id,
      @JsonKey(name: 'document_name') String documentName,
      @JsonKey(name: 'processing_days') int processingDays,
      String? description});
}

/// @nodoc
class __$$DocumentTypeImplCopyWithImpl<$Res>
    extends _$DocumentTypeCopyWithImpl<$Res, _$DocumentTypeImpl>
    implements _$$DocumentTypeImplCopyWith<$Res> {
  __$$DocumentTypeImplCopyWithImpl(
      _$DocumentTypeImpl _value, $Res Function(_$DocumentTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? documentName = null,
    Object? processingDays = null,
    Object? description = freezed,
  }) {
    return _then(_$DocumentTypeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      documentName: null == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      processingDays: null == processingDays
          ? _value.processingDays
          : processingDays // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DocumentTypeImpl implements _DocumentType {
  const _$DocumentTypeImpl(
      {required this.id,
      @JsonKey(name: 'document_name') required this.documentName,
      @JsonKey(name: 'processing_days') required this.processingDays,
      this.description});

  factory _$DocumentTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$DocumentTypeImplFromJson(json);

  @override
  final dynamic id;
  @override
  @JsonKey(name: 'document_name')
  final String documentName;
  @override
  @JsonKey(name: 'processing_days')
  final int processingDays;
  @override
  final String? description;

  @override
  String toString() {
    return 'DocumentType(id: $id, documentName: $documentName, processingDays: $processingDays, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentTypeImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            (identical(other.documentName, documentName) ||
                other.documentName == documentName) &&
            (identical(other.processingDays, processingDays) ||
                other.processingDays == processingDays) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      documentName,
      processingDays,
      description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentTypeImplCopyWith<_$DocumentTypeImpl> get copyWith =>
      __$$DocumentTypeImplCopyWithImpl<_$DocumentTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DocumentTypeImplToJson(
      this,
    );
  }
}

abstract class _DocumentType implements DocumentType {
  const factory _DocumentType(
      {required final dynamic id,
      @JsonKey(name: 'document_name') required final String documentName,
      @JsonKey(name: 'processing_days') required final int processingDays,
      final String? description}) = _$DocumentTypeImpl;

  factory _DocumentType.fromJson(Map<String, dynamic> json) =
      _$DocumentTypeImpl.fromJson;

  @override
  dynamic get id;
  @override
  @JsonKey(name: 'document_name')
  String get documentName;
  @override
  @JsonKey(name: 'processing_days')
  int get processingDays;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$DocumentTypeImplCopyWith<_$DocumentTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
