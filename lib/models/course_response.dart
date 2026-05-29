import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';

import 'semester.dart';

part 'course_response.freezed.dart';
part 'course_response.g.dart';

@freezed
class CourseResponse with _$CourseResponse {
  const factory CourseResponse({
    required bool success,
    required String message,
    required List<CourseData> data,
  }) = _CourseResponse;

  factory CourseResponse.fromJson(Map<String, dynamic> json) =>
      _$CourseResponseFromJson(json);
}

@freezed
class CourseData with _$CourseData {
  const CourseData._();
  const factory CourseData({
    required String id,
    @JsonKey(name: 'subject_id') required String subjectId,
    @JsonKey(name: 'lecturer_id') required String lecturerId,
    @JsonKey(name: 'semester_id') required String semesterId,
    @JsonKey(name: 'academic_year') String? academicYear,
    required String room,
    double? latitude,
    double? longitude,
    @JsonKey(name: 'allowed_radius') double? allowedRadius,
    @JsonKey(name: 'max_students') required int maxStudents,
    @JsonKey(name: 'current_students') required int currentStudents,
    @JsonKey(name: 'day_of_week') required int dayOfWeek,
    @JsonKey(name: 'lesson_slot') required String lessonSlot,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime endDate,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required Subject subject,
    required Lecturer lecturer,
    Semester? semester,
    @JsonKey(name: 'student_stats') StudenStats? studentStats,
  }) = _CourseData;

  factory CourseData.fromJson(Map<String, dynamic> json) =>
      _$CourseDataFromJson(json);

  String get startTime => lessonSlot.splitSlot['start']!;
  String get endTime => lessonSlot.splitSlot['end']!;

  String get dayOfWeekText {
    switch (dayOfWeek) {
      case 2:
        return "Thứ 2";
      case 3:
        return "Thứ 3";
      case 4:
        return "Thứ 4";
      case 5:
        return "Thứ 5";
      case 6:
        return "Thứ 6";
      case 7:
        return "Thứ 7";
      default:
        return "Chủ Nhật";
    }
  }
}

@freezed
class StudenStats with _$StudenStats {
  const factory StudenStats({
    @JsonKey(name: 'total') required double total,
    @JsonKey(name: 'present') required double present,
    @JsonKey(name: 'late') required double late,
    @JsonKey(name: 'absent') required double absent,
    @JsonKey(name: 'excused') required double excused,
    @JsonKey(name: 'attendance_rate') required double attendanceRate,
  }) = _StudenStats;

  factory StudenStats.fromJson(Map<String, dynamic> json) =>
      _$StudenStatsFromJson(json);
}

@freezed
class Subject with _$Subject {
  const factory Subject({
    @JsonKey(name: 'subject_code') required String subjectCode,
    @JsonKey(name: 'subject_name') required String subjectName,
    int? credits,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

@freezed
class Lecturer with _$Lecturer {
  const factory Lecturer({
    @JsonKey(name: 'full_name') required String fullName,
    String? email,
  }) = _Lecturer;

  factory Lecturer.fromJson(Map<String, dynamic> json) =>
      _$LecturerFromJson(json);
}
