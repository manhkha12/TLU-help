import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/models/course_response.dart';

part 'attendance_session.freezed.dart';
part 'attendance_session.g.dart';

@freezed
class AttendanceSession with _$AttendanceSession {
  const factory AttendanceSession({
    required String id,
    @JsonKey(name: 'course_class_id') required String courseClassId,
    @JsonKey(name: 'check_in_time') required DateTime checkInTime,
    required DateTime date,
    @JsonKey(name: 'is_reminder_sent') required bool isReminderSent,
    @JsonKey(name: 'course_class') required CourseData courseClass,
    @JsonKey(name: 'student_stats') required StudenStats studentStats,
  }) = _AttendanceSession;

  factory AttendanceSession.fromJson(Map<String, dynamic> json) =>
      _$AttendanceSessionFromJson(json);
}
