// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceRequest _$ServiceRequestFromJson(Map<String, dynamic> json) {
  return _ServiceRequest.fromJson(json);
}

/// @nodoc
mixin _$ServiceRequest {
  dynamic get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'document_type_id')
  dynamic get documentTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  dynamic? get userId => throw _privateConstructorUsedError;
  DocumentType? get documentType => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'attachment_url')
  String? get attachmentUrl => throw _privateConstructorUsedError;
  ServiceRequestStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestCopyWith<ServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestCopyWith<$Res> {
  factory $ServiceRequestCopyWith(
          ServiceRequest value, $Res Function(ServiceRequest) then) =
      _$ServiceRequestCopyWithImpl<$Res, ServiceRequest>;
  @useResult
  $Res call(
      {dynamic id,
      @JsonKey(name: 'document_type_id') dynamic documentTypeId,
      @JsonKey(name: 'user_id') dynamic? userId,
      DocumentType? documentType,
      String? reason,
      @JsonKey(name: 'attachment_url') String? attachmentUrl,
      ServiceRequestStatus status,
      @JsonKey(name: 'rejection_reason') String? rejectionReason,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  $DocumentTypeCopyWith<$Res>? get documentType;
}

/// @nodoc
class _$ServiceRequestCopyWithImpl<$Res, $Val extends ServiceRequest>
    implements $ServiceRequestCopyWith<$Res> {
  _$ServiceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? documentTypeId = freezed,
    Object? userId = freezed,
    Object? documentType = freezed,
    Object? reason = freezed,
    Object? attachmentUrl = freezed,
    Object? status = null,
    Object? rejectionReason = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      documentTypeId: freezed == documentTypeId
          ? _value.documentTypeId
          : documentTypeId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      documentType: freezed == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as DocumentType?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentUrl: freezed == attachmentUrl
          ? _value.attachmentUrl
          : attachmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ServiceRequestStatus,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DocumentTypeCopyWith<$Res>? get documentType {
    if (_value.documentType == null) {
      return null;
    }

    return $DocumentTypeCopyWith<$Res>(_value.documentType!, (value) {
      return _then(_value.copyWith(documentType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ServiceRequestImplCopyWith<$Res>
    implements $ServiceRequestCopyWith<$Res> {
  factory _$$ServiceRequestImplCopyWith(_$ServiceRequestImpl value,
          $Res Function(_$ServiceRequestImpl) then) =
      __$$ServiceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic id,
      @JsonKey(name: 'document_type_id') dynamic documentTypeId,
      @JsonKey(name: 'user_id') dynamic? userId,
      DocumentType? documentType,
      String? reason,
      @JsonKey(name: 'attachment_url') String? attachmentUrl,
      ServiceRequestStatus status,
      @JsonKey(name: 'rejection_reason') String? rejectionReason,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});

  @override
  $DocumentTypeCopyWith<$Res>? get documentType;
}

/// @nodoc
class __$$ServiceRequestImplCopyWithImpl<$Res>
    extends _$ServiceRequestCopyWithImpl<$Res, _$ServiceRequestImpl>
    implements _$$ServiceRequestImplCopyWith<$Res> {
  __$$ServiceRequestImplCopyWithImpl(
      _$ServiceRequestImpl _value, $Res Function(_$ServiceRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? documentTypeId = freezed,
    Object? userId = freezed,
    Object? documentType = freezed,
    Object? reason = freezed,
    Object? attachmentUrl = freezed,
    Object? status = null,
    Object? rejectionReason = freezed,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ServiceRequestImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      documentTypeId: freezed == documentTypeId
          ? _value.documentTypeId
          : documentTypeId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      documentType: freezed == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as DocumentType?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      attachmentUrl: freezed == attachmentUrl
          ? _value.attachmentUrl
          : attachmentUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ServiceRequestStatus,
      rejectionReason: freezed == rejectionReason
          ? _value.rejectionReason
          : rejectionReason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceRequestImpl implements _ServiceRequest {
  const _$ServiceRequestImpl(
      {required this.id,
      @JsonKey(name: 'document_type_id') required this.documentTypeId,
      @JsonKey(name: 'user_id') this.userId,
      this.documentType,
      this.reason,
      @JsonKey(name: 'attachment_url') this.attachmentUrl,
      required this.status,
      @JsonKey(name: 'rejection_reason') this.rejectionReason,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$ServiceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceRequestImplFromJson(json);

  @override
  final dynamic id;
  @override
  @JsonKey(name: 'document_type_id')
  final dynamic documentTypeId;
  @override
  @JsonKey(name: 'user_id')
  final dynamic? userId;
  @override
  final DocumentType? documentType;
  @override
  final String? reason;
  @override
  @JsonKey(name: 'attachment_url')
  final String? attachmentUrl;
  @override
  final ServiceRequestStatus status;
  @override
  @JsonKey(name: 'rejection_reason')
  final String? rejectionReason;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ServiceRequest(id: $id, documentTypeId: $documentTypeId, userId: $userId, documentType: $documentType, reason: $reason, attachmentUrl: $attachmentUrl, status: $status, rejectionReason: $rejectionReason, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceRequestImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.documentTypeId, documentTypeId) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.attachmentUrl, attachmentUrl) ||
                other.attachmentUrl == attachmentUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.rejectionReason, rejectionReason) ||
                other.rejectionReason == rejectionReason) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(documentTypeId),
      const DeepCollectionEquality().hash(userId),
      documentType,
      reason,
      attachmentUrl,
      status,
      rejectionReason,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceRequestImplCopyWith<_$ServiceRequestImpl> get copyWith =>
      __$$ServiceRequestImplCopyWithImpl<_$ServiceRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceRequestImplToJson(
      this,
    );
  }
}

abstract class _ServiceRequest implements ServiceRequest {
  const factory _ServiceRequest(
      {required final dynamic id,
      @JsonKey(name: 'document_type_id') required final dynamic documentTypeId,
      @JsonKey(name: 'user_id') final dynamic? userId,
      final DocumentType? documentType,
      final String? reason,
      @JsonKey(name: 'attachment_url') final String? attachmentUrl,
      required final ServiceRequestStatus status,
      @JsonKey(name: 'rejection_reason') final String? rejectionReason,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at')
      final DateTime? updatedAt}) = _$ServiceRequestImpl;

  factory _ServiceRequest.fromJson(Map<String, dynamic> json) =
      _$ServiceRequestImpl.fromJson;

  @override
  dynamic get id;
  @override
  @JsonKey(name: 'document_type_id')
  dynamic get documentTypeId;
  @override
  @JsonKey(name: 'user_id')
  dynamic? get userId;
  @override
  DocumentType? get documentType;
  @override
  String? get reason;
  @override
  @JsonKey(name: 'attachment_url')
  String? get attachmentUrl;
  @override
  ServiceRequestStatus get status;
  @override
  @JsonKey(name: 'rejection_reason')
  String? get rejectionReason;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ServiceRequestImplCopyWith<_$ServiceRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
