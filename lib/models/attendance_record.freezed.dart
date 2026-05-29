// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceRecord _$AttendanceRecordFromJson(Map<String, dynamic> json) {
  return _AttendanceRecord.fromJson(json);
}

/// @nodoc
mixin _$AttendanceRecord {
  String get id => throw _privateConstructorUsedError;
  String get studentId => throw _privateConstructorUsedError;
  String? get studentName => throw _privateConstructorUsedError;
  String? get studentCode => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // Ví dụ: 'present', 'absent'
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get sessionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceRecordCopyWith<AttendanceRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceRecordCopyWith<$Res> {
  factory $AttendanceRecordCopyWith(
          AttendanceRecord value, $Res Function(AttendanceRecord) then) =
      _$AttendanceRecordCopyWithImpl<$Res, AttendanceRecord>;
  @useResult
  $Res call(
      {String id,
      String studentId,
      String? studentName,
      String? studentCode,
      String status,
      DateTime timestamp,
      String? sessionId});
}

/// @nodoc
class _$AttendanceRecordCopyWithImpl<$Res, $Val extends AttendanceRecord>
    implements $AttendanceRecordCopyWith<$Res> {
  _$AttendanceRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? studentId = null,
    Object? studentName = freezed,
    Object? studentCode = freezed,
    Object? status = null,
    Object? timestamp = null,
    Object? sessionId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentCode: freezed == studentCode
          ? _value.studentCode
          : studentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceRecordImplCopyWith<$Res>
    implements $AttendanceRecordCopyWith<$Res> {
  factory _$$AttendanceRecordImplCopyWith(_$AttendanceRecordImpl value,
          $Res Function(_$AttendanceRecordImpl) then) =
      __$$AttendanceRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String studentId,
      String? studentName,
      String? studentCode,
      String status,
      DateTime timestamp,
      String? sessionId});
}

/// @nodoc
class __$$AttendanceRecordImplCopyWithImpl<$Res>
    extends _$AttendanceRecordCopyWithImpl<$Res, _$AttendanceRecordImpl>
    implements _$$AttendanceRecordImplCopyWith<$Res> {
  __$$AttendanceRecordImplCopyWithImpl(_$AttendanceRecordImpl _value,
      $Res Function(_$AttendanceRecordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? studentId = null,
    Object? studentName = freezed,
    Object? studentCode = freezed,
    Object? status = null,
    Object? timestamp = null,
    Object? sessionId = freezed,
  }) {
    return _then(_$AttendanceRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      studentId: null == studentId
          ? _value.studentId
          : studentId // ignore: cast_nullable_to_non_nullable
              as String,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      studentCode: freezed == studentCode
          ? _value.studentCode
          : studentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sessionId: freezed == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceRecordImpl implements _AttendanceRecord {
  _$AttendanceRecordImpl(
      {required this.id,
      required this.studentId,
      this.studentName,
      this.studentCode,
      required this.status,
      required this.timestamp,
      this.sessionId});

  factory _$AttendanceRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceRecordImplFromJson(json);

  @override
  final String id;
  @override
  final String studentId;
  @override
  final String? studentName;
  @override
  final String? studentCode;
  @override
  final String status;
// Ví dụ: 'present', 'absent'
  @override
  final DateTime timestamp;
  @override
  final String? sessionId;

  @override
  String toString() {
    return 'AttendanceRecord(id: $id, studentId: $studentId, studentName: $studentName, studentCode: $studentCode, status: $status, timestamp: $timestamp, sessionId: $sessionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.studentId, studentId) ||
                other.studentId == studentId) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.studentCode, studentCode) ||
                other.studentCode == studentCode) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, studentId, studentName,
      studentCode, status, timestamp, sessionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceRecordImplCopyWith<_$AttendanceRecordImpl> get copyWith =>
      __$$AttendanceRecordImplCopyWithImpl<_$AttendanceRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceRecordImplToJson(
      this,
    );
  }
}

abstract class _AttendanceRecord implements AttendanceRecord {
  factory _AttendanceRecord(
      {required final String id,
      required final String studentId,
      final String? studentName,
      final String? studentCode,
      required final String status,
      required final DateTime timestamp,
      final String? sessionId}) = _$AttendanceRecordImpl;

  factory _AttendanceRecord.fromJson(Map<String, dynamic> json) =
      _$AttendanceRecordImpl.fromJson;

  @override
  String get id;
  @override
  String get studentId;
  @override
  String? get studentName;
  @override
  String? get studentCode;
  @override
  String get status;
  @override // Ví dụ: 'present', 'absent'
  DateTime get timestamp;
  @override
  String? get sessionId;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceRecordImplCopyWith<_$AttendanceRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
