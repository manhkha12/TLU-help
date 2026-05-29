// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grade_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GradeItem _$GradeItemFromJson(Map<String, dynamic> json) {
  return _GradeItem.fromJson(json);
}

/// @nodoc
mixin _$GradeItem {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'score_attendance')
  double? get scoreAttendance => throw _privateConstructorUsedError;
  @JsonKey(name: 'score_process')
  double? get scoreProcess => throw _privateConstructorUsedError;
  @JsonKey(name: 'score_final')
  double? get scoreFinal => throw _privateConstructorUsedError;
  @JsonKey(name: 'score_total_10')
  double? get scoreTotal10 => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollment')
  Enrollment get enrollment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GradeItemCopyWith<GradeItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GradeItemCopyWith<$Res> {
  factory $GradeItemCopyWith(GradeItem value, $Res Function(GradeItem) then) =
      _$GradeItemCopyWithImpl<$Res, GradeItem>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'score_attendance') double? scoreAttendance,
      @JsonKey(name: 'score_process') double? scoreProcess,
      @JsonKey(name: 'score_final') double? scoreFinal,
      @JsonKey(name: 'score_total_10') double? scoreTotal10,
      @JsonKey(name: 'enrollment') Enrollment enrollment});

  $EnrollmentCopyWith<$Res> get enrollment;
}

/// @nodoc
class _$GradeItemCopyWithImpl<$Res, $Val extends GradeItem>
    implements $GradeItemCopyWith<$Res> {
  _$GradeItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? scoreAttendance = freezed,
    Object? scoreProcess = freezed,
    Object? scoreFinal = freezed,
    Object? scoreTotal10 = freezed,
    Object? enrollment = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      scoreAttendance: freezed == scoreAttendance
          ? _value.scoreAttendance
          : scoreAttendance // ignore: cast_nullable_to_non_nullable
              as double?,
      scoreProcess: freezed == scoreProcess
          ? _value.scoreProcess
          : scoreProcess // ignore: cast_nullable_to_non_nullable
              as double?,
      scoreFinal: freezed == scoreFinal
          ? _value.scoreFinal
          : scoreFinal // ignore: cast_nullable_to_non_nullable
              as double?,
      scoreTotal10: freezed == scoreTotal10
          ? _value.scoreTotal10
          : scoreTotal10 // ignore: cast_nullable_to_non_nullable
              as double?,
      enrollment: null == enrollment
          ? _value.enrollment
          : enrollment // ignore: cast_nullable_to_non_nullable
              as Enrollment,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EnrollmentCopyWith<$Res> get enrollment {
    return $EnrollmentCopyWith<$Res>(_value.enrollment, (value) {
      return _then(_value.copyWith(enrollment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GradeItemImplCopyWith<$Res>
    implements $GradeItemCopyWith<$Res> {
  factory _$$GradeItemImplCopyWith(
          _$GradeItemImpl value, $Res Function(_$GradeItemImpl) then) =
      __$$GradeItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'score_attendance') double? scoreAttendance,
      @JsonKey(name: 'score_process') double? scoreProcess,
      @JsonKey(name: 'score_final') double? scoreFinal,
      @JsonKey(name: 'score_total_10') double? scoreTotal10,
      @JsonKey(name: 'enrollment') Enrollment enrollment});

  @override
  $EnrollmentCopyWith<$Res> get enrollment;
}

/// @nodoc
class __$$GradeItemImplCopyWithImpl<$Res>
    extends _$GradeItemCopyWithImpl<$Res, _$GradeItemImpl>
    implements _$$GradeItemImplCopyWith<$Res> {
  __$$GradeItemImplCopyWithImpl(
      _$GradeItemImpl _value, $Res Function(_$GradeItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? scoreAttendance = freezed,
    Object? scoreProcess = freezed,
    Object? scoreFinal = freezed,
    Object? scoreTotal10 = freezed,
    Object? enrollment = null,
  }) {
    return _then(_$GradeItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      scoreAttendance: freezed == scoreAttendance
          ? _value.scoreAttendance
          : scoreAttendance // ignore: cast_nullable_to_non_nullable
              as double?,
      scoreProcess: freezed == scoreProcess
          ? _value.scoreProcess
          : scoreProcess // ignore: cast_nullable_to_non_nullable
              as double?,
      scoreFinal: freezed == scoreFinal
          ? _value.scoreFinal
          : scoreFinal // ignore: cast_nullable_to_non_nullable
              as double?,
      scoreTotal10: freezed == scoreTotal10
          ? _value.scoreTotal10
          : scoreTotal10 // ignore: cast_nullable_to_non_nullable
              as double?,
      enrollment: null == enrollment
          ? _value.enrollment
          : enrollment // ignore: cast_nullable_to_non_nullable
              as Enrollment,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GradeItemImpl implements _GradeItem {
  const _$GradeItemImpl(
      {required this.id,
      @JsonKey(name: 'score_attendance') this.scoreAttendance,
      @JsonKey(name: 'score_process') this.scoreProcess,
      @JsonKey(name: 'score_final') this.scoreFinal,
      @JsonKey(name: 'score_total_10') this.scoreTotal10,
      @JsonKey(name: 'enrollment') required this.enrollment});

  factory _$GradeItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$GradeItemImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'score_attendance')
  final double? scoreAttendance;
  @override
  @JsonKey(name: 'score_process')
  final double? scoreProcess;
  @override
  @JsonKey(name: 'score_final')
  final double? scoreFinal;
  @override
  @JsonKey(name: 'score_total_10')
  final double? scoreTotal10;
  @override
  @JsonKey(name: 'enrollment')
  final Enrollment enrollment;

  @override
  String toString() {
    return 'GradeItem(id: $id, scoreAttendance: $scoreAttendance, scoreProcess: $scoreProcess, scoreFinal: $scoreFinal, scoreTotal10: $scoreTotal10, enrollment: $enrollment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GradeItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.scoreAttendance, scoreAttendance) ||
                other.scoreAttendance == scoreAttendance) &&
            (identical(other.scoreProcess, scoreProcess) ||
                other.scoreProcess == scoreProcess) &&
            (identical(other.scoreFinal, scoreFinal) ||
                other.scoreFinal == scoreFinal) &&
            (identical(other.scoreTotal10, scoreTotal10) ||
                other.scoreTotal10 == scoreTotal10) &&
            (identical(other.enrollment, enrollment) ||
                other.enrollment == enrollment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, scoreAttendance,
      scoreProcess, scoreFinal, scoreTotal10, enrollment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GradeItemImplCopyWith<_$GradeItemImpl> get copyWith =>
      __$$GradeItemImplCopyWithImpl<_$GradeItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GradeItemImplToJson(
      this,
    );
  }
}

abstract class _GradeItem implements GradeItem {
  const factory _GradeItem(
          {required final String id,
          @JsonKey(name: 'score_attendance') final double? scoreAttendance,
          @JsonKey(name: 'score_process') final double? scoreProcess,
          @JsonKey(name: 'score_final') final double? scoreFinal,
          @JsonKey(name: 'score_total_10') final double? scoreTotal10,
          @JsonKey(name: 'enrollment') required final Enrollment enrollment}) =
      _$GradeItemImpl;

  factory _GradeItem.fromJson(Map<String, dynamic> json) =
      _$GradeItemImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'score_attendance')
  double? get scoreAttendance;
  @override
  @JsonKey(name: 'score_process')
  double? get scoreProcess;
  @override
  @JsonKey(name: 'score_final')
  double? get scoreFinal;
  @override
  @JsonKey(name: 'score_total_10')
  double? get scoreTotal10;
  @override
  @JsonKey(name: 'enrollment')
  Enrollment get enrollment;
  @override
  @JsonKey(ignore: true)
  _$$GradeItemImplCopyWith<_$GradeItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CourseClass _$CourseClassFromJson(Map<String, dynamic> json) {
  return _CourseClass.fromJson(json);
}

/// @nodoc
mixin _$CourseClass {
  String get id => throw _privateConstructorUsedError;
  Subject get subject => throw _privateConstructorUsedError;
  Semester get semester => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseClassCopyWith<CourseClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseClassCopyWith<$Res> {
  factory $CourseClassCopyWith(
          CourseClass value, $Res Function(CourseClass) then) =
      _$CourseClassCopyWithImpl<$Res, CourseClass>;
  @useResult
  $Res call({String id, Subject subject, Semester semester});

  $SubjectCopyWith<$Res> get subject;
  $SemesterCopyWith<$Res> get semester;
}

/// @nodoc
class _$CourseClassCopyWithImpl<$Res, $Val extends CourseClass>
    implements $CourseClassCopyWith<$Res> {
  _$CourseClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subject = null,
    Object? semester = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as Semester,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubjectCopyWith<$Res> get subject {
    return $SubjectCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
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
abstract class _$$CourseClassImplCopyWith<$Res>
    implements $CourseClassCopyWith<$Res> {
  factory _$$CourseClassImplCopyWith(
          _$CourseClassImpl value, $Res Function(_$CourseClassImpl) then) =
      __$$CourseClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Subject subject, Semester semester});

  @override
  $SubjectCopyWith<$Res> get subject;
  @override
  $SemesterCopyWith<$Res> get semester;
}

/// @nodoc
class __$$CourseClassImplCopyWithImpl<$Res>
    extends _$CourseClassCopyWithImpl<$Res, _$CourseClassImpl>
    implements _$$CourseClassImplCopyWith<$Res> {
  __$$CourseClassImplCopyWithImpl(
      _$CourseClassImpl _value, $Res Function(_$CourseClassImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subject = null,
    Object? semester = null,
  }) {
    return _then(_$CourseClassImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as Semester,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseClassImpl implements _CourseClass {
  const _$CourseClassImpl(
      {required this.id, required this.subject, required this.semester});

  factory _$CourseClassImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseClassImplFromJson(json);

  @override
  final String id;
  @override
  final Subject subject;
  @override
  final Semester semester;

  @override
  String toString() {
    return 'CourseClass(id: $id, subject: $subject, semester: $semester)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseClassImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.semester, semester) ||
                other.semester == semester));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, subject, semester);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseClassImplCopyWith<_$CourseClassImpl> get copyWith =>
      __$$CourseClassImplCopyWithImpl<_$CourseClassImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseClassImplToJson(
      this,
    );
  }
}

abstract class _CourseClass implements CourseClass {
  const factory _CourseClass(
      {required final String id,
      required final Subject subject,
      required final Semester semester}) = _$CourseClassImpl;

  factory _CourseClass.fromJson(Map<String, dynamic> json) =
      _$CourseClassImpl.fromJson;

  @override
  String get id;
  @override
  Subject get subject;
  @override
  Semester get semester;
  @override
  @JsonKey(ignore: true)
  _$$CourseClassImplCopyWith<_$CourseClassImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Subject _$SubjectFromJson(Map<String, dynamic> json) {
  return _Subject.fromJson(json);
}

/// @nodoc
mixin _$Subject {
  @JsonKey(name: 'subject_code')
  String get subjectCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'subject_name')
  String get subjectName => throw _privateConstructorUsedError;
  int get credits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubjectCopyWith<Subject> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectCopyWith<$Res> {
  factory $SubjectCopyWith(Subject value, $Res Function(Subject) then) =
      _$SubjectCopyWithImpl<$Res, Subject>;
  @useResult
  $Res call(
      {@JsonKey(name: 'subject_code') String subjectCode,
      @JsonKey(name: 'subject_name') String subjectName,
      int credits});
}

/// @nodoc
class _$SubjectCopyWithImpl<$Res, $Val extends Subject>
    implements $SubjectCopyWith<$Res> {
  _$SubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectCode = null,
    Object? subjectName = null,
    Object? credits = null,
  }) {
    return _then(_value.copyWith(
      subjectCode: null == subjectCode
          ? _value.subjectCode
          : subjectCode // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubjectImplCopyWith<$Res> implements $SubjectCopyWith<$Res> {
  factory _$$SubjectImplCopyWith(
          _$SubjectImpl value, $Res Function(_$SubjectImpl) then) =
      __$$SubjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'subject_code') String subjectCode,
      @JsonKey(name: 'subject_name') String subjectName,
      int credits});
}

/// @nodoc
class __$$SubjectImplCopyWithImpl<$Res>
    extends _$SubjectCopyWithImpl<$Res, _$SubjectImpl>
    implements _$$SubjectImplCopyWith<$Res> {
  __$$SubjectImplCopyWithImpl(
      _$SubjectImpl _value, $Res Function(_$SubjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectCode = null,
    Object? subjectName = null,
    Object? credits = null,
  }) {
    return _then(_$SubjectImpl(
      subjectCode: null == subjectCode
          ? _value.subjectCode
          : subjectCode // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectImpl implements _Subject {
  const _$SubjectImpl(
      {@JsonKey(name: 'subject_code') required this.subjectCode,
      @JsonKey(name: 'subject_name') required this.subjectName,
      required this.credits});

  factory _$SubjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectImplFromJson(json);

  @override
  @JsonKey(name: 'subject_code')
  final String subjectCode;
  @override
  @JsonKey(name: 'subject_name')
  final String subjectName;
  @override
  final int credits;

  @override
  String toString() {
    return 'Subject(subjectCode: $subjectCode, subjectName: $subjectName, credits: $credits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubjectImpl &&
            (identical(other.subjectCode, subjectCode) ||
                other.subjectCode == subjectCode) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.credits, credits) || other.credits == credits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, subjectCode, subjectName, credits);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      __$$SubjectImplCopyWithImpl<_$SubjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubjectImplToJson(
      this,
    );
  }
}

abstract class _Subject implements Subject {
  const factory _Subject(
      {@JsonKey(name: 'subject_code') required final String subjectCode,
      @JsonKey(name: 'subject_name') required final String subjectName,
      required final int credits}) = _$SubjectImpl;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$SubjectImpl.fromJson;

  @override
  @JsonKey(name: 'subject_code')
  String get subjectCode;
  @override
  @JsonKey(name: 'subject_name')
  String get subjectName;
  @override
  int get credits;
  @override
  @JsonKey(ignore: true)
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Enrollment _$EnrollmentFromJson(Map<String, dynamic> json) {
  return _Enrollment.fromJson(json);
}

/// @nodoc
mixin _$Enrollment {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_class')
  CourseClass get courseClass => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnrollmentCopyWith<Enrollment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnrollmentCopyWith<$Res> {
  factory $EnrollmentCopyWith(
          Enrollment value, $Res Function(Enrollment) then) =
      _$EnrollmentCopyWithImpl<$Res, Enrollment>;
  @useResult
  $Res call(
      {String id, @JsonKey(name: 'course_class') CourseClass courseClass});

  $CourseClassCopyWith<$Res> get courseClass;
}

/// @nodoc
class _$EnrollmentCopyWithImpl<$Res, $Val extends Enrollment>
    implements $EnrollmentCopyWith<$Res> {
  _$EnrollmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseClass = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courseClass: null == courseClass
          ? _value.courseClass
          : courseClass // ignore: cast_nullable_to_non_nullable
              as CourseClass,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseClassCopyWith<$Res> get courseClass {
    return $CourseClassCopyWith<$Res>(_value.courseClass, (value) {
      return _then(_value.copyWith(courseClass: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EnrollmentImplCopyWith<$Res>
    implements $EnrollmentCopyWith<$Res> {
  factory _$$EnrollmentImplCopyWith(
          _$EnrollmentImpl value, $Res Function(_$EnrollmentImpl) then) =
      __$$EnrollmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, @JsonKey(name: 'course_class') CourseClass courseClass});

  @override
  $CourseClassCopyWith<$Res> get courseClass;
}

/// @nodoc
class __$$EnrollmentImplCopyWithImpl<$Res>
    extends _$EnrollmentCopyWithImpl<$Res, _$EnrollmentImpl>
    implements _$$EnrollmentImplCopyWith<$Res> {
  __$$EnrollmentImplCopyWithImpl(
      _$EnrollmentImpl _value, $Res Function(_$EnrollmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseClass = null,
  }) {
    return _then(_$EnrollmentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courseClass: null == courseClass
          ? _value.courseClass
          : courseClass // ignore: cast_nullable_to_non_nullable
              as CourseClass,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnrollmentImpl implements _Enrollment {
  const _$EnrollmentImpl(
      {required this.id,
      @JsonKey(name: 'course_class') required this.courseClass});

  factory _$EnrollmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnrollmentImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'course_class')
  final CourseClass courseClass;

  @override
  String toString() {
    return 'Enrollment(id: $id, courseClass: $courseClass)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnrollmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseClass, courseClass) ||
                other.courseClass == courseClass));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, courseClass);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnrollmentImplCopyWith<_$EnrollmentImpl> get copyWith =>
      __$$EnrollmentImplCopyWithImpl<_$EnrollmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnrollmentImplToJson(
      this,
    );
  }
}

abstract class _Enrollment implements Enrollment {
  const factory _Enrollment(
      {required final String id,
      @JsonKey(name: 'course_class')
      required final CourseClass courseClass}) = _$EnrollmentImpl;

  factory _Enrollment.fromJson(Map<String, dynamic> json) =
      _$EnrollmentImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'course_class')
  CourseClass get courseClass;
  @override
  @JsonKey(ignore: true)
  _$$EnrollmentImplCopyWith<_$EnrollmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
