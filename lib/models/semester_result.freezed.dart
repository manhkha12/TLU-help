// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'semester_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SemesterResult _$SemesterResultFromJson(Map<String, dynamic> json) {
  return _SemesterResult.fromJson(json);
}

/// @nodoc
mixin _$SemesterResult {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'gpa_semester')
  double get gpaSemester => throw _privateConstructorUsedError;
  @JsonKey(name: 'gpa_cumulative')
  double get gpaCumulative => throw _privateConstructorUsedError;
  Semester get semester => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SemesterResultCopyWith<SemesterResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SemesterResultCopyWith<$Res> {
  factory $SemesterResultCopyWith(
          SemesterResult value, $Res Function(SemesterResult) then) =
      _$SemesterResultCopyWithImpl<$Res, SemesterResult>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'gpa_semester') double gpaSemester,
      @JsonKey(name: 'gpa_cumulative') double gpaCumulative,
      Semester semester});

  $SemesterCopyWith<$Res> get semester;
}

/// @nodoc
class _$SemesterResultCopyWithImpl<$Res, $Val extends SemesterResult>
    implements $SemesterResultCopyWith<$Res> {
  _$SemesterResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gpaSemester = null,
    Object? gpaCumulative = null,
    Object? semester = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gpaSemester: null == gpaSemester
          ? _value.gpaSemester
          : gpaSemester // ignore: cast_nullable_to_non_nullable
              as double,
      gpaCumulative: null == gpaCumulative
          ? _value.gpaCumulative
          : gpaCumulative // ignore: cast_nullable_to_non_nullable
              as double,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as Semester,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SemesterCopyWith<$Res> get semester {
    return $SemesterCopyWith<$Res>(_value.semester, (value) {
      return _then(_value.copyWith(semester: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SemesterResultImplCopyWith<$Res>
    implements $SemesterResultCopyWith<$Res> {
  factory _$$SemesterResultImplCopyWith(_$SemesterResultImpl value,
          $Res Function(_$SemesterResultImpl) then) =
      __$$SemesterResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'gpa_semester') double gpaSemester,
      @JsonKey(name: 'gpa_cumulative') double gpaCumulative,
      Semester semester});

  @override
  $SemesterCopyWith<$Res> get semester;
}

/// @nodoc
class __$$SemesterResultImplCopyWithImpl<$Res>
    extends _$SemesterResultCopyWithImpl<$Res, _$SemesterResultImpl>
    implements _$$SemesterResultImplCopyWith<$Res> {
  __$$SemesterResultImplCopyWithImpl(
      _$SemesterResultImpl _value, $Res Function(_$SemesterResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? gpaSemester = null,
    Object? gpaCumulative = null,
    Object? semester = null,
  }) {
    return _then(_$SemesterResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      gpaSemester: null == gpaSemester
          ? _value.gpaSemester
          : gpaSemester // ignore: cast_nullable_to_non_nullable
              as double,
      gpaCumulative: null == gpaCumulative
          ? _value.gpaCumulative
          : gpaCumulative // ignore: cast_nullable_to_non_nullable
              as double,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as Semester,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SemesterResultImpl implements _SemesterResult {
  const _$SemesterResultImpl(
      {required this.id,
      @JsonKey(name: 'gpa_semester') required this.gpaSemester,
      @JsonKey(name: 'gpa_cumulative') required this.gpaCumulative,
      required this.semester});

  factory _$SemesterResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$SemesterResultImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'gpa_semester')
  final double gpaSemester;
  @override
  @JsonKey(name: 'gpa_cumulative')
  final double gpaCumulative;
  @override
  final Semester semester;

  @override
  String toString() {
    return 'SemesterResult(id: $id, gpaSemester: $gpaSemester, gpaCumulative: $gpaCumulative, semester: $semester)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SemesterResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.gpaSemester, gpaSemester) ||
                other.gpaSemester == gpaSemester) &&
            (identical(other.gpaCumulative, gpaCumulative) ||
                other.gpaCumulative == gpaCumulative) &&
            (identical(other.semester, semester) ||
                other.semester == semester));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, gpaSemester, gpaCumulative, semester);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SemesterResultImplCopyWith<_$SemesterResultImpl> get copyWith =>
      __$$SemesterResultImplCopyWithImpl<_$SemesterResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SemesterResultImplToJson(
      this,
    );
  }
}

abstract class _SemesterResult implements SemesterResult {
  const factory _SemesterResult(
      {required final String id,
      @JsonKey(name: 'gpa_semester') required final double gpaSemester,
      @JsonKey(name: 'gpa_cumulative') required final double gpaCumulative,
      required final Semester semester}) = _$SemesterResultImpl;

  factory _SemesterResult.fromJson(Map<String, dynamic> json) =
      _$SemesterResultImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'gpa_semester')
  double get gpaSemester;
  @override
  @JsonKey(name: 'gpa_cumulative')
  double get gpaCumulative;
  @override
  Semester get semester;
  @override
  @JsonKey(ignore: true)
  _$$SemesterResultImplCopyWith<_$SemesterResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
