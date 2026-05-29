// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CourseResponse _$CourseResponseFromJson(Map<String, dynamic> json) {
  return _CourseResponse.fromJson(json);
}

/// @nodoc
mixin _$CourseResponse {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<CourseData> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseResponseCopyWith<CourseResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseResponseCopyWith<$Res> {
  factory $CourseResponseCopyWith(
          CourseResponse value, $Res Function(CourseResponse) then) =
      _$CourseResponseCopyWithImpl<$Res, CourseResponse>;
  @useResult
  $Res call({bool success, String message, List<CourseData> data});
}

/// @nodoc
class _$CourseResponseCopyWithImpl<$Res, $Val extends CourseResponse>
    implements $CourseResponseCopyWith<$Res> {
  _$CourseResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CourseData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CourseResponseImplCopyWith<$Res>
    implements $CourseResponseCopyWith<$Res> {
  factory _$$CourseResponseImplCopyWith(_$CourseResponseImpl value,
          $Res Function(_$CourseResponseImpl) then) =
      __$$CourseResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, List<CourseData> data});
}

/// @nodoc
class __$$CourseResponseImplCopyWithImpl<$Res>
    extends _$CourseResponseCopyWithImpl<$Res, _$CourseResponseImpl>
    implements _$$CourseResponseImplCopyWith<$Res> {
  __$$CourseResponseImplCopyWithImpl(
      _$CourseResponseImpl _value, $Res Function(_$CourseResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$CourseResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<CourseData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseResponseImpl implements _CourseResponse {
  const _$CourseResponseImpl(
      {required this.success,
      required this.message,
      required final List<CourseData> data})
      : _data = data;

  factory _$CourseResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseResponseImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<CourseData> _data;
  @override
  List<CourseData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'CourseResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, success, message,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseResponseImplCopyWith<_$CourseResponseImpl> get copyWith =>
      __$$CourseResponseImplCopyWithImpl<_$CourseResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseResponseImplToJson(
      this,
    );
  }
}

abstract class _CourseResponse implements CourseResponse {
  const factory _CourseResponse(
      {required final bool success,
      required final String message,
      required final List<CourseData> data}) = _$CourseResponseImpl;

  factory _CourseResponse.fromJson(Map<String, dynamic> json) =
      _$CourseResponseImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<CourseData> get data;
  @override
  @JsonKey(ignore: true)
  _$$CourseResponseImplCopyWith<_$CourseResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CourseData _$CourseDataFromJson(Map<String, dynamic> json) {
  return _CourseData.fromJson(json);
}

/// @nodoc
mixin _$CourseData {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'subject_id')
  String get subjectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'lecturer_id')
  String get lecturerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'semester_id')
  String get semesterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'academic_year')
  String? get academicYear => throw _privateConstructorUsedError;
  String get room => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'allowed_radius')
  double? get allowedRadius => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_students')
  int get maxStudents => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_students')
  int get currentStudents => throw _privateConstructorUsedError;
  @JsonKey(name: 'day_of_week')
  int get dayOfWeek => throw _privateConstructorUsedError;
  @JsonKey(name: 'lesson_slot')
  String get lessonSlot => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  Subject get subject => throw _privateConstructorUsedError;
  Lecturer get lecturer => throw _privateConstructorUsedError;
  Semester? get semester => throw _privateConstructorUsedError;
  @JsonKey(name: 'student_stats')
  StudenStats? get studentStats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CourseDataCopyWith<CourseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseDataCopyWith<$Res> {
  factory $CourseDataCopyWith(
          CourseData value, $Res Function(CourseData) then) =
      _$CourseDataCopyWithImpl<$Res, CourseData>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'subject_id') String subjectId,
      @JsonKey(name: 'lecturer_id') String lecturerId,
      @JsonKey(name: 'semester_id') String semesterId,
      @JsonKey(name: 'academic_year') String? academicYear,
      String room,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'allowed_radius') double? allowedRadius,
      @JsonKey(name: 'max_students') int maxStudents,
      @JsonKey(name: 'current_students') int currentStudents,
      @JsonKey(name: 'day_of_week') int dayOfWeek,
      @JsonKey(name: 'lesson_slot') String lessonSlot,
      @JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'end_date') DateTime endDate,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      Subject subject,
      Lecturer lecturer,
      Semester? semester,
      @JsonKey(name: 'student_stats') StudenStats? studentStats});

  $SubjectCopyWith<$Res> get subject;
  $LecturerCopyWith<$Res> get lecturer;
  $SemesterCopyWith<$Res>? get semester;
  $StudenStatsCopyWith<$Res>? get studentStats;
}

/// @nodoc
class _$CourseDataCopyWithImpl<$Res, $Val extends CourseData>
    implements $CourseDataCopyWith<$Res> {
  _$CourseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectId = null,
    Object? lecturerId = null,
    Object? semesterId = null,
    Object? academicYear = freezed,
    Object? room = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? allowedRadius = freezed,
    Object? maxStudents = null,
    Object? currentStudents = null,
    Object? dayOfWeek = null,
    Object? lessonSlot = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? subject = null,
    Object? lecturer = null,
    Object? semester = freezed,
    Object? studentStats = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
      lecturerId: null == lecturerId
          ? _value.lecturerId
          : lecturerId // ignore: cast_nullable_to_non_nullable
              as String,
      semesterId: null == semesterId
          ? _value.semesterId
          : semesterId // ignore: cast_nullable_to_non_nullable
              as String,
      academicYear: freezed == academicYear
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
              as String?,
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      allowedRadius: freezed == allowedRadius
          ? _value.allowedRadius
          : allowedRadius // ignore: cast_nullable_to_non_nullable
              as double?,
      maxStudents: null == maxStudents
          ? _value.maxStudents
          : maxStudents // ignore: cast_nullable_to_non_nullable
              as int,
      currentStudents: null == currentStudents
          ? _value.currentStudents
          : currentStudents // ignore: cast_nullable_to_non_nullable
              as int,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      lessonSlot: null == lessonSlot
          ? _value.lessonSlot
          : lessonSlot // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      lecturer: null == lecturer
          ? _value.lecturer
          : lecturer // ignore: cast_nullable_to_non_nullable
              as Lecturer,
      semester: freezed == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as Semester?,
      studentStats: freezed == studentStats
          ? _value.studentStats
          : studentStats // ignore: cast_nullable_to_non_nullable
              as StudenStats?,
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
  $LecturerCopyWith<$Res> get lecturer {
    return $LecturerCopyWith<$Res>(_value.lecturer, (value) {
      return _then(_value.copyWith(lecturer: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SemesterCopyWith<$Res>? get semester {
    if (_value.semester == null) {
      return null;
    }

    return $SemesterCopyWith<$Res>(_value.semester!, (value) {
      return _then(_value.copyWith(semester: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StudenStatsCopyWith<$Res>? get studentStats {
    if (_value.studentStats == null) {
      return null;
    }

    return $StudenStatsCopyWith<$Res>(_value.studentStats!, (value) {
      return _then(_value.copyWith(studentStats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseDataImplCopyWith<$Res>
    implements $CourseDataCopyWith<$Res> {
  factory _$$CourseDataImplCopyWith(
          _$CourseDataImpl value, $Res Function(_$CourseDataImpl) then) =
      __$$CourseDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'subject_id') String subjectId,
      @JsonKey(name: 'lecturer_id') String lecturerId,
      @JsonKey(name: 'semester_id') String semesterId,
      @JsonKey(name: 'academic_year') String? academicYear,
      String room,
      double? latitude,
      double? longitude,
      @JsonKey(name: 'allowed_radius') double? allowedRadius,
      @JsonKey(name: 'max_students') int maxStudents,
      @JsonKey(name: 'current_students') int currentStudents,
      @JsonKey(name: 'day_of_week') int dayOfWeek,
      @JsonKey(name: 'lesson_slot') String lessonSlot,
      @JsonKey(name: 'start_date') DateTime startDate,
      @JsonKey(name: 'end_date') DateTime endDate,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      Subject subject,
      Lecturer lecturer,
      Semester? semester,
      @JsonKey(name: 'student_stats') StudenStats? studentStats});

  @override
  $SubjectCopyWith<$Res> get subject;
  @override
  $LecturerCopyWith<$Res> get lecturer;
  @override
  $SemesterCopyWith<$Res>? get semester;
  @override
  $StudenStatsCopyWith<$Res>? get studentStats;
}

/// @nodoc
class __$$CourseDataImplCopyWithImpl<$Res>
    extends _$CourseDataCopyWithImpl<$Res, _$CourseDataImpl>
    implements _$$CourseDataImplCopyWith<$Res> {
  __$$CourseDataImplCopyWithImpl(
      _$CourseDataImpl _value, $Res Function(_$CourseDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? subjectId = null,
    Object? lecturerId = null,
    Object? semesterId = null,
    Object? academicYear = freezed,
    Object? room = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? allowedRadius = freezed,
    Object? maxStudents = null,
    Object? currentStudents = null,
    Object? dayOfWeek = null,
    Object? lessonSlot = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? subject = null,
    Object? lecturer = null,
    Object? semester = freezed,
    Object? studentStats = freezed,
  }) {
    return _then(_$CourseDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as String,
      lecturerId: null == lecturerId
          ? _value.lecturerId
          : lecturerId // ignore: cast_nullable_to_non_nullable
              as String,
      semesterId: null == semesterId
          ? _value.semesterId
          : semesterId // ignore: cast_nullable_to_non_nullable
              as String,
      academicYear: freezed == academicYear
          ? _value.academicYear
          : academicYear // ignore: cast_nullable_to_non_nullable
              as String?,
      room: null == room
          ? _value.room
          : room // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      allowedRadius: freezed == allowedRadius
          ? _value.allowedRadius
          : allowedRadius // ignore: cast_nullable_to_non_nullable
              as double?,
      maxStudents: null == maxStudents
          ? _value.maxStudents
          : maxStudents // ignore: cast_nullable_to_non_nullable
              as int,
      currentStudents: null == currentStudents
          ? _value.currentStudents
          : currentStudents // ignore: cast_nullable_to_non_nullable
              as int,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      lessonSlot: null == lessonSlot
          ? _value.lessonSlot
          : lessonSlot // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      lecturer: null == lecturer
          ? _value.lecturer
          : lecturer // ignore: cast_nullable_to_non_nullable
              as Lecturer,
      semester: freezed == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as Semester?,
      studentStats: freezed == studentStats
          ? _value.studentStats
          : studentStats // ignore: cast_nullable_to_non_nullable
              as StudenStats?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseDataImpl extends _CourseData {
  const _$CourseDataImpl(
      {required this.id,
      @JsonKey(name: 'subject_id') required this.subjectId,
      @JsonKey(name: 'lecturer_id') required this.lecturerId,
      @JsonKey(name: 'semester_id') required this.semesterId,
      @JsonKey(name: 'academic_year') this.academicYear,
      required this.room,
      this.latitude,
      this.longitude,
      @JsonKey(name: 'allowed_radius') this.allowedRadius,
      @JsonKey(name: 'max_students') required this.maxStudents,
      @JsonKey(name: 'current_students') required this.currentStudents,
      @JsonKey(name: 'day_of_week') required this.dayOfWeek,
      @JsonKey(name: 'lesson_slot') required this.lessonSlot,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.subject,
      required this.lecturer,
      this.semester,
      @JsonKey(name: 'student_stats') this.studentStats})
      : super._();

  factory _$CourseDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseDataImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'subject_id')
  final String subjectId;
  @override
  @JsonKey(name: 'lecturer_id')
  final String lecturerId;
  @override
  @JsonKey(name: 'semester_id')
  final String semesterId;
  @override
  @JsonKey(name: 'academic_year')
  final String? academicYear;
  @override
  final String room;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey(name: 'allowed_radius')
  final double? allowedRadius;
  @override
  @JsonKey(name: 'max_students')
  final int maxStudents;
  @override
  @JsonKey(name: 'current_students')
  final int currentStudents;
  @override
  @JsonKey(name: 'day_of_week')
  final int dayOfWeek;
  @override
  @JsonKey(name: 'lesson_slot')
  final String lessonSlot;
  @override
  @JsonKey(name: 'start_date')
  final DateTime startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime endDate;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final Subject subject;
  @override
  final Lecturer lecturer;
  @override
  final Semester? semester;
  @override
  @JsonKey(name: 'student_stats')
  final StudenStats? studentStats;

  @override
  String toString() {
    return 'CourseData(id: $id, subjectId: $subjectId, lecturerId: $lecturerId, semesterId: $semesterId, academicYear: $academicYear, room: $room, latitude: $latitude, longitude: $longitude, allowedRadius: $allowedRadius, maxStudents: $maxStudents, currentStudents: $currentStudents, dayOfWeek: $dayOfWeek, lessonSlot: $lessonSlot, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, updatedAt: $updatedAt, subject: $subject, lecturer: $lecturer, semester: $semester, studentStats: $studentStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.lecturerId, lecturerId) ||
                other.lecturerId == lecturerId) &&
            (identical(other.semesterId, semesterId) ||
                other.semesterId == semesterId) &&
            (identical(other.academicYear, academicYear) ||
                other.academicYear == academicYear) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.allowedRadius, allowedRadius) ||
                other.allowedRadius == allowedRadius) &&
            (identical(other.maxStudents, maxStudents) ||
                other.maxStudents == maxStudents) &&
            (identical(other.currentStudents, currentStudents) ||
                other.currentStudents == currentStudents) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.lessonSlot, lessonSlot) ||
                other.lessonSlot == lessonSlot) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.lecturer, lecturer) ||
                other.lecturer == lecturer) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            (identical(other.studentStats, studentStats) ||
                other.studentStats == studentStats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        subjectId,
        lecturerId,
        semesterId,
        academicYear,
        room,
        latitude,
        longitude,
        allowedRadius,
        maxStudents,
        currentStudents,
        dayOfWeek,
        lessonSlot,
        startDate,
        endDate,
        createdAt,
        updatedAt,
        subject,
        lecturer,
        semester,
        studentStats
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseDataImplCopyWith<_$CourseDataImpl> get copyWith =>
      __$$CourseDataImplCopyWithImpl<_$CourseDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseDataImplToJson(
      this,
    );
  }
}

abstract class _CourseData extends CourseData {
  const factory _CourseData(
          {required final String id,
          @JsonKey(name: 'subject_id') required final String subjectId,
          @JsonKey(name: 'lecturer_id') required final String lecturerId,
          @JsonKey(name: 'semester_id') required final String semesterId,
          @JsonKey(name: 'academic_year') final String? academicYear,
          required final String room,
          final double? latitude,
          final double? longitude,
          @JsonKey(name: 'allowed_radius') final double? allowedRadius,
          @JsonKey(name: 'max_students') required final int maxStudents,
          @JsonKey(name: 'current_students') required final int currentStudents,
          @JsonKey(name: 'day_of_week') required final int dayOfWeek,
          @JsonKey(name: 'lesson_slot') required final String lessonSlot,
          @JsonKey(name: 'start_date') required final DateTime startDate,
          @JsonKey(name: 'end_date') required final DateTime endDate,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          required final Subject subject,
          required final Lecturer lecturer,
          final Semester? semester,
          @JsonKey(name: 'student_stats') final StudenStats? studentStats}) =
      _$CourseDataImpl;
  const _CourseData._() : super._();

  factory _CourseData.fromJson(Map<String, dynamic> json) =
      _$CourseDataImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'subject_id')
  String get subjectId;
  @override
  @JsonKey(name: 'lecturer_id')
  String get lecturerId;
  @override
  @JsonKey(name: 'semester_id')
  String get semesterId;
  @override
  @JsonKey(name: 'academic_year')
  String? get academicYear;
  @override
  String get room;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  @JsonKey(name: 'allowed_radius')
  double? get allowedRadius;
  @override
  @JsonKey(name: 'max_students')
  int get maxStudents;
  @override
  @JsonKey(name: 'current_students')
  int get currentStudents;
  @override
  @JsonKey(name: 'day_of_week')
  int get dayOfWeek;
  @override
  @JsonKey(name: 'lesson_slot')
  String get lessonSlot;
  @override
  @JsonKey(name: 'start_date')
  DateTime get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime get endDate;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  Subject get subject;
  @override
  Lecturer get lecturer;
  @override
  Semester? get semester;
  @override
  @JsonKey(name: 'student_stats')
  StudenStats? get studentStats;
  @override
  @JsonKey(ignore: true)
  _$$CourseDataImplCopyWith<_$CourseDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StudenStats _$StudenStatsFromJson(Map<String, dynamic> json) {
  return _StudenStats.fromJson(json);
}

/// @nodoc
mixin _$StudenStats {
  @JsonKey(name: 'total')
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'present')
  double get present => throw _privateConstructorUsedError;
  @JsonKey(name: 'late')
  double get late => throw _privateConstructorUsedError;
  @JsonKey(name: 'absent')
  double get absent => throw _privateConstructorUsedError;
  @JsonKey(name: 'excused')
  double get excused => throw _privateConstructorUsedError;
  @JsonKey(name: 'attendance_rate')
  double get attendanceRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudenStatsCopyWith<StudenStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudenStatsCopyWith<$Res> {
  factory $StudenStatsCopyWith(
          StudenStats value, $Res Function(StudenStats) then) =
      _$StudenStatsCopyWithImpl<$Res, StudenStats>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total') double total,
      @JsonKey(name: 'present') double present,
      @JsonKey(name: 'late') double late,
      @JsonKey(name: 'absent') double absent,
      @JsonKey(name: 'excused') double excused,
      @JsonKey(name: 'attendance_rate') double attendanceRate});
}

/// @nodoc
class _$StudenStatsCopyWithImpl<$Res, $Val extends StudenStats>
    implements $StudenStatsCopyWith<$Res> {
  _$StudenStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? present = null,
    Object? late = null,
    Object? absent = null,
    Object? excused = null,
    Object? attendanceRate = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      present: null == present
          ? _value.present
          : present // ignore: cast_nullable_to_non_nullable
              as double,
      late: null == late
          ? _value.late
          : late // ignore: cast_nullable_to_non_nullable
              as double,
      absent: null == absent
          ? _value.absent
          : absent // ignore: cast_nullable_to_non_nullable
              as double,
      excused: null == excused
          ? _value.excused
          : excused // ignore: cast_nullable_to_non_nullable
              as double,
      attendanceRate: null == attendanceRate
          ? _value.attendanceRate
          : attendanceRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudenStatsImplCopyWith<$Res>
    implements $StudenStatsCopyWith<$Res> {
  factory _$$StudenStatsImplCopyWith(
          _$StudenStatsImpl value, $Res Function(_$StudenStatsImpl) then) =
      __$$StudenStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total') double total,
      @JsonKey(name: 'present') double present,
      @JsonKey(name: 'late') double late,
      @JsonKey(name: 'absent') double absent,
      @JsonKey(name: 'excused') double excused,
      @JsonKey(name: 'attendance_rate') double attendanceRate});
}

/// @nodoc
class __$$StudenStatsImplCopyWithImpl<$Res>
    extends _$StudenStatsCopyWithImpl<$Res, _$StudenStatsImpl>
    implements _$$StudenStatsImplCopyWith<$Res> {
  __$$StudenStatsImplCopyWithImpl(
      _$StudenStatsImpl _value, $Res Function(_$StudenStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? present = null,
    Object? late = null,
    Object? absent = null,
    Object? excused = null,
    Object? attendanceRate = null,
  }) {
    return _then(_$StudenStatsImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      present: null == present
          ? _value.present
          : present // ignore: cast_nullable_to_non_nullable
              as double,
      late: null == late
          ? _value.late
          : late // ignore: cast_nullable_to_non_nullable
              as double,
      absent: null == absent
          ? _value.absent
          : absent // ignore: cast_nullable_to_non_nullable
              as double,
      excused: null == excused
          ? _value.excused
          : excused // ignore: cast_nullable_to_non_nullable
              as double,
      attendanceRate: null == attendanceRate
          ? _value.attendanceRate
          : attendanceRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StudenStatsImpl implements _StudenStats {
  const _$StudenStatsImpl(
      {@JsonKey(name: 'total') required this.total,
      @JsonKey(name: 'present') required this.present,
      @JsonKey(name: 'late') required this.late,
      @JsonKey(name: 'absent') required this.absent,
      @JsonKey(name: 'excused') required this.excused,
      @JsonKey(name: 'attendance_rate') required this.attendanceRate});

  factory _$StudenStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StudenStatsImplFromJson(json);

  @override
  @JsonKey(name: 'total')
  final double total;
  @override
  @JsonKey(name: 'present')
  final double present;
  @override
  @JsonKey(name: 'late')
  final double late;
  @override
  @JsonKey(name: 'absent')
  final double absent;
  @override
  @JsonKey(name: 'excused')
  final double excused;
  @override
  @JsonKey(name: 'attendance_rate')
  final double attendanceRate;

  @override
  String toString() {
    return 'StudenStats(total: $total, present: $present, late: $late, absent: $absent, excused: $excused, attendanceRate: $attendanceRate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudenStatsImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.present, present) || other.present == present) &&
            (identical(other.late, late) || other.late == late) &&
            (identical(other.absent, absent) || other.absent == absent) &&
            (identical(other.excused, excused) || other.excused == excused) &&
            (identical(other.attendanceRate, attendanceRate) ||
                other.attendanceRate == attendanceRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, present, late, absent, excused, attendanceRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudenStatsImplCopyWith<_$StudenStatsImpl> get copyWith =>
      __$$StudenStatsImplCopyWithImpl<_$StudenStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StudenStatsImplToJson(
      this,
    );
  }
}

abstract class _StudenStats implements StudenStats {
  const factory _StudenStats(
      {@JsonKey(name: 'total') required final double total,
      @JsonKey(name: 'present') required final double present,
      @JsonKey(name: 'late') required final double late,
      @JsonKey(name: 'absent') required final double absent,
      @JsonKey(name: 'excused') required final double excused,
      @JsonKey(name: 'attendance_rate')
      required final double attendanceRate}) = _$StudenStatsImpl;

  factory _StudenStats.fromJson(Map<String, dynamic> json) =
      _$StudenStatsImpl.fromJson;

  @override
  @JsonKey(name: 'total')
  double get total;
  @override
  @JsonKey(name: 'present')
  double get present;
  @override
  @JsonKey(name: 'late')
  double get late;
  @override
  @JsonKey(name: 'absent')
  double get absent;
  @override
  @JsonKey(name: 'excused')
  double get excused;
  @override
  @JsonKey(name: 'attendance_rate')
  double get attendanceRate;
  @override
  @JsonKey(ignore: true)
  _$$StudenStatsImplCopyWith<_$StudenStatsImpl> get copyWith =>
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
  int? get credits => throw _privateConstructorUsedError;

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
      int? credits});
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
    Object? credits = freezed,
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
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int?,
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
      int? credits});
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
    Object? credits = freezed,
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
      credits: freezed == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubjectImpl implements _Subject {
  const _$SubjectImpl(
      {@JsonKey(name: 'subject_code') required this.subjectCode,
      @JsonKey(name: 'subject_name') required this.subjectName,
      this.credits});

  factory _$SubjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubjectImplFromJson(json);

  @override
  @JsonKey(name: 'subject_code')
  final String subjectCode;
  @override
  @JsonKey(name: 'subject_name')
  final String subjectName;
  @override
  final int? credits;

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
      final int? credits}) = _$SubjectImpl;

  factory _Subject.fromJson(Map<String, dynamic> json) = _$SubjectImpl.fromJson;

  @override
  @JsonKey(name: 'subject_code')
  String get subjectCode;
  @override
  @JsonKey(name: 'subject_name')
  String get subjectName;
  @override
  int? get credits;
  @override
  @JsonKey(ignore: true)
  _$$SubjectImplCopyWith<_$SubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Lecturer _$LecturerFromJson(Map<String, dynamic> json) {
  return _Lecturer.fromJson(json);
}

/// @nodoc
mixin _$Lecturer {
  @JsonKey(name: 'full_name')
  String get fullName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LecturerCopyWith<Lecturer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LecturerCopyWith<$Res> {
  factory $LecturerCopyWith(Lecturer value, $Res Function(Lecturer) then) =
      _$LecturerCopyWithImpl<$Res, Lecturer>;
  @useResult
  $Res call({@JsonKey(name: 'full_name') String fullName, String? email});
}

/// @nodoc
class _$LecturerCopyWithImpl<$Res, $Val extends Lecturer>
    implements $LecturerCopyWith<$Res> {
  _$LecturerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LecturerImplCopyWith<$Res>
    implements $LecturerCopyWith<$Res> {
  factory _$$LecturerImplCopyWith(
          _$LecturerImpl value, $Res Function(_$LecturerImpl) then) =
      __$$LecturerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'full_name') String fullName, String? email});
}

/// @nodoc
class __$$LecturerImplCopyWithImpl<$Res>
    extends _$LecturerCopyWithImpl<$Res, _$LecturerImpl>
    implements _$$LecturerImplCopyWith<$Res> {
  __$$LecturerImplCopyWithImpl(
      _$LecturerImpl _value, $Res Function(_$LecturerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? email = freezed,
  }) {
    return _then(_$LecturerImpl(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LecturerImpl implements _Lecturer {
  const _$LecturerImpl(
      {@JsonKey(name: 'full_name') required this.fullName, this.email});

  factory _$LecturerImpl.fromJson(Map<String, dynamic> json) =>
      _$$LecturerImplFromJson(json);

  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  final String? email;

  @override
  String toString() {
    return 'Lecturer(fullName: $fullName, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LecturerImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LecturerImplCopyWith<_$LecturerImpl> get copyWith =>
      __$$LecturerImplCopyWithImpl<_$LecturerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LecturerImplToJson(
      this,
    );
  }
}

abstract class _Lecturer implements Lecturer {
  const factory _Lecturer(
      {@JsonKey(name: 'full_name') required final String fullName,
      final String? email}) = _$LecturerImpl;

  factory _Lecturer.fromJson(Map<String, dynamic> json) =
      _$LecturerImpl.fromJson;

  @override
  @JsonKey(name: 'full_name')
  String get fullName;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$LecturerImplCopyWith<_$LecturerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
