// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceSession _$AttendanceSessionFromJson(Map<String, dynamic> json) {
  return _AttendanceSession.fromJson(json);
}

/// @nodoc
mixin _$AttendanceSession {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_class_id')
  String get courseClassId => throw _privateConstructorUsedError;
  @JsonKey(name: 'check_in_time')
  DateTime get checkInTime => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_reminder_sent')
  bool get isReminderSent => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_class')
  CourseData get courseClass => throw _privateConstructorUsedError;
  @JsonKey(name: 'student_stats')
  StudenStats get studentStats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceSessionCopyWith<AttendanceSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceSessionCopyWith<$Res> {
  factory $AttendanceSessionCopyWith(
          AttendanceSession value, $Res Function(AttendanceSession) then) =
      _$AttendanceSessionCopyWithImpl<$Res, AttendanceSession>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'course_class_id') String courseClassId,
      @JsonKey(name: 'check_in_time') DateTime checkInTime,
      DateTime date,
      @JsonKey(name: 'is_reminder_sent') bool isReminderSent,
      @JsonKey(name: 'course_class') CourseData courseClass,
      @JsonKey(name: 'student_stats') StudenStats studentStats});

  $CourseDataCopyWith<$Res> get courseClass;
  $StudenStatsCopyWith<$Res> get studentStats;
}

/// @nodoc
class _$AttendanceSessionCopyWithImpl<$Res, $Val extends AttendanceSession>
    implements $AttendanceSessionCopyWith<$Res> {
  _$AttendanceSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseClassId = null,
    Object? checkInTime = null,
    Object? date = null,
    Object? isReminderSent = null,
    Object? courseClass = null,
    Object? studentStats = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courseClassId: null == courseClassId
          ? _value.courseClassId
          : courseClassId // ignore: cast_nullable_to_non_nullable
              as String,
      checkInTime: null == checkInTime
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isReminderSent: null == isReminderSent
          ? _value.isReminderSent
          : isReminderSent // ignore: cast_nullable_to_non_nullable
              as bool,
      courseClass: null == courseClass
          ? _value.courseClass
          : courseClass // ignore: cast_nullable_to_non_nullable
              as CourseData,
      studentStats: null == studentStats
          ? _value.studentStats
          : studentStats // ignore: cast_nullable_to_non_nullable
              as StudenStats,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CourseDataCopyWith<$Res> get courseClass {
    return $CourseDataCopyWith<$Res>(_value.courseClass, (value) {
      return _then(_value.copyWith(courseClass: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StudenStatsCopyWith<$Res> get studentStats {
    return $StudenStatsCopyWith<$Res>(_value.studentStats, (value) {
      return _then(_value.copyWith(studentStats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AttendanceSessionImplCopyWith<$Res>
    implements $AttendanceSessionCopyWith<$Res> {
  factory _$$AttendanceSessionImplCopyWith(_$AttendanceSessionImpl value,
          $Res Function(_$AttendanceSessionImpl) then) =
      __$$AttendanceSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'course_class_id') String courseClassId,
      @JsonKey(name: 'check_in_time') DateTime checkInTime,
      DateTime date,
      @JsonKey(name: 'is_reminder_sent') bool isReminderSent,
      @JsonKey(name: 'course_class') CourseData courseClass,
      @JsonKey(name: 'student_stats') StudenStats studentStats});

  @override
  $CourseDataCopyWith<$Res> get courseClass;
  @override
  $StudenStatsCopyWith<$Res> get studentStats;
}

/// @nodoc
class __$$AttendanceSessionImplCopyWithImpl<$Res>
    extends _$AttendanceSessionCopyWithImpl<$Res, _$AttendanceSessionImpl>
    implements _$$AttendanceSessionImplCopyWith<$Res> {
  __$$AttendanceSessionImplCopyWithImpl(_$AttendanceSessionImpl _value,
      $Res Function(_$AttendanceSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? courseClassId = null,
    Object? checkInTime = null,
    Object? date = null,
    Object? isReminderSent = null,
    Object? courseClass = null,
    Object? studentStats = null,
  }) {
    return _then(_$AttendanceSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      courseClassId: null == courseClassId
          ? _value.courseClassId
          : courseClassId // ignore: cast_nullable_to_non_nullable
              as String,
      checkInTime: null == checkInTime
          ? _value.checkInTime
          : checkInTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isReminderSent: null == isReminderSent
          ? _value.isReminderSent
          : isReminderSent // ignore: cast_nullable_to_non_nullable
              as bool,
      courseClass: null == courseClass
          ? _value.courseClass
          : courseClass // ignore: cast_nullable_to_non_nullable
              as CourseData,
      studentStats: null == studentStats
          ? _value.studentStats
          : studentStats // ignore: cast_nullable_to_non_nullable
              as StudenStats,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AttendanceSessionImpl implements _AttendanceSession {
  const _$AttendanceSessionImpl(
      {required this.id,
      @JsonKey(name: 'course_class_id') required this.courseClassId,
      @JsonKey(name: 'check_in_time') required this.checkInTime,
      required this.date,
      @JsonKey(name: 'is_reminder_sent') required this.isReminderSent,
      @JsonKey(name: 'course_class') required this.courseClass,
      @JsonKey(name: 'student_stats') required this.studentStats});

  factory _$AttendanceSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceSessionImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'course_class_id')
  final String courseClassId;
  @override
  @JsonKey(name: 'check_in_time')
  final DateTime checkInTime;
  @override
  final DateTime date;
  @override
  @JsonKey(name: 'is_reminder_sent')
  final bool isReminderSent;
  @override
  @JsonKey(name: 'course_class')
  final CourseData courseClass;
  @override
  @JsonKey(name: 'student_stats')
  final StudenStats studentStats;

  @override
  String toString() {
    return 'AttendanceSession(id: $id, courseClassId: $courseClassId, checkInTime: $checkInTime, date: $date, isReminderSent: $isReminderSent, courseClass: $courseClass, studentStats: $studentStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.courseClassId, courseClassId) ||
                other.courseClassId == courseClassId) &&
            (identical(other.checkInTime, checkInTime) ||
                other.checkInTime == checkInTime) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isReminderSent, isReminderSent) ||
                other.isReminderSent == isReminderSent) &&
            (identical(other.courseClass, courseClass) ||
                other.courseClass == courseClass) &&
            (identical(other.studentStats, studentStats) ||
                other.studentStats == studentStats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, courseClassId, checkInTime,
      date, isReminderSent, courseClass, studentStats);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceSessionImplCopyWith<_$AttendanceSessionImpl> get copyWith =>
      __$$AttendanceSessionImplCopyWithImpl<_$AttendanceSessionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceSessionImplToJson(
      this,
    );
  }
}

abstract class _AttendanceSession implements AttendanceSession {
  const factory _AttendanceSession(
      {required final String id,
      @JsonKey(name: 'course_class_id') required final String courseClassId,
      @JsonKey(name: 'check_in_time') required final DateTime checkInTime,
      required final DateTime date,
      @JsonKey(name: 'is_reminder_sent') required final bool isReminderSent,
      @JsonKey(name: 'course_class') required final CourseData courseClass,
      @JsonKey(name: 'student_stats')
      required final StudenStats studentStats}) = _$AttendanceSessionImpl;

  factory _AttendanceSession.fromJson(Map<String, dynamic> json) =
      _$AttendanceSessionImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'course_class_id')
  String get courseClassId;
  @override
  @JsonKey(name: 'check_in_time')
  DateTime get checkInTime;
  @override
  DateTime get date;
  @override
  @JsonKey(name: 'is_reminder_sent')
  bool get isReminderSent;
  @override
  @JsonKey(name: 'course_class')
  CourseData get courseClass;
  @override
  @JsonKey(name: 'student_stats')
  StudenStats get studentStats;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceSessionImplCopyWith<_$AttendanceSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
