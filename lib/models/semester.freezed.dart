// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'semester.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Semester _$SemesterFromJson(Map<String, dynamic> json) {
  return _Semester.fromJson(json);
}

/// @nodoc
mixin _$Semester {
  String? get id =>
      throw _privateConstructorUsedError; // Thêm id từ JSON mới của bạn
  @JsonKey(name: 'semester_name')
  String get semesterName => throw _privateConstructorUsedError;
  @JsonKey(name: 'academic_year')
  String get academicYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'tuition_per_credit')
  double? get tuitionPerCredit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SemesterCopyWith<Semester> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SemesterCopyWith<$Res> {
  factory $SemesterCopyWith(Semester value, $Res Function(Semester) then) =
      _$SemesterCopyWithImpl<$Res, Semester>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'semester_name') String semesterName,
      @JsonKey(name: 'academic_year') String academicYear,
      @JsonKey(name: 'tuition_per_credit') double? tuitionPerCredit});
}

/// @nodoc
class _$SemesterCopyWithImpl<$Res, $Val extends Semester>
    implements $SemesterCopyWith<$Res> {
  _$SemesterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? semesterName = null,
    Object? academicYear = null,
    Object? tuitionPerCredit = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      semesterName: null == semesterName
          ? _value.semesterName
          : semesterName // ignore: cast_nullable_to_non_nullable
              as String,
      academicYear: null == academicYear
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
              as String,
      tuitionPerCredit: freezed == tuitionPerCredit
          ? _value.tuitionPerCredit
          : tuitionPerCredit // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SemesterImplCopyWith<$Res>
    implements $SemesterCopyWith<$Res> {
  factory _$$SemesterImplCopyWith(
          _$SemesterImpl value, $Res Function(_$SemesterImpl) then) =
      __$$SemesterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'semester_name') String semesterName,
      @JsonKey(name: 'academic_year') String academicYear,
      @JsonKey(name: 'tuition_per_credit') double? tuitionPerCredit});
}

/// @nodoc
class __$$SemesterImplCopyWithImpl<$Res>
    extends _$SemesterCopyWithImpl<$Res, _$SemesterImpl>
    implements _$$SemesterImplCopyWith<$Res> {
  __$$SemesterImplCopyWithImpl(
      _$SemesterImpl _value, $Res Function(_$SemesterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? semesterName = null,
    Object? academicYear = null,
    Object? tuitionPerCredit = freezed,
  }) {
    return _then(_$SemesterImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      semesterName: null == semesterName
          ? _value.semesterName
          : semesterName // ignore: cast_nullable_to_non_nullable
              as String,
      academicYear: null == academicYear
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
              as String,
      tuitionPerCredit: freezed == tuitionPerCredit
          ? _value.tuitionPerCredit
          : tuitionPerCredit // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SemesterImpl extends _Semester {
  const _$SemesterImpl(
      {this.id,
      @JsonKey(name: 'semester_name') required this.semesterName,
      @JsonKey(name: 'academic_year') required this.academicYear,
      @JsonKey(name: 'tuition_per_credit') this.tuitionPerCredit})
      : super._();

  factory _$SemesterImpl.fromJson(Map<String, dynamic> json) =>
      _$$SemesterImplFromJson(json);

  @override
  final String? id;
// Thêm id từ JSON mới của bạn
  @override
  @JsonKey(name: 'semester_name')
  final String semesterName;
  @override
  @JsonKey(name: 'academic_year')
  final String academicYear;
  @override
  @JsonKey(name: 'tuition_per_credit')
  final double? tuitionPerCredit;

  @override
  String toString() {
    return 'Semester(id: $id, semesterName: $semesterName, academicYear: $academicYear, tuitionPerCredit: $tuitionPerCredit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SemesterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.semesterName, semesterName) ||
                other.semesterName == semesterName) &&
            (identical(other.academicYear, academicYear) ||
                other.academicYear == academicYear) &&
            (identical(other.tuitionPerCredit, tuitionPerCredit) ||
                other.tuitionPerCredit == tuitionPerCredit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, semesterName, academicYear, tuitionPerCredit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SemesterImplCopyWith<_$SemesterImpl> get copyWith =>
      __$$SemesterImplCopyWithImpl<_$SemesterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SemesterImplToJson(
      this,
    );
  }
}

abstract class _Semester extends Semester {
  const factory _Semester(
      {final String? id,
      @JsonKey(name: 'semester_name') required final String semesterName,
      @JsonKey(name: 'academic_year') required final String academicYear,
      @JsonKey(name: 'tuition_per_credit')
      final double? tuitionPerCredit}) = _$SemesterImpl;
  const _Semester._() : super._();

  factory _Semester.fromJson(Map<String, dynamic> json) =
      _$SemesterImpl.fromJson;

  @override
  String? get id;
  @override // Thêm id từ JSON mới của bạn
  @JsonKey(name: 'semester_name')
  String get semesterName;
  @override
  @JsonKey(name: 'academic_year')
  String get academicYear;
  @override
  @JsonKey(name: 'tuition_per_credit')
  double? get tuitionPerCredit;
  @override
  @JsonKey(ignore: true)
  _$$SemesterImplCopyWith<_$SemesterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
