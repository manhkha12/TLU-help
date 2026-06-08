import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_record.freezed.dart';
part 'attendance_record.g.dart';

@freezed
class AttendanceRecord with _$AttendanceRecord {
  factory AttendanceRecord({
    required String id,
    required String studentId,
    String? studentName,
    String? studentCode,
    required String status,  // Ví dụ: 'present', 'absent'
    required DateTime timestamp,
    String? sessionId,
  }) = _AttendanceRecord;

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) => _$AttendanceRecordFromJson(json);
}