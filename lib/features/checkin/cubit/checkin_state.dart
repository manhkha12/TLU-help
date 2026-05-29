import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/models/attendance_record.dart';
import 'package:tlu_students/models/attendance_session.dart';

part 'checkin_state.freezed.dart';

@freezed
class CheckInState with _$CheckInState {
  factory CheckInState({
    @Default(false) bool isLoading,
    @Default(false) bool isRefreshing,
    @Default([]) List<AttendanceRecord> records,  // Danh sách records điểm danh
    String? currentSessionId,  // Session hiện tại
    AttendanceSession? activeSession, // Thông tin session đang diễn ra
    String? checkinStatus,
    bool? checkinSuccess,
    String? checkinMessage,
    String? filePath,
    double? latitude,
    double? longitude,
  }) = _CheckInState;

  CheckInState._();

  Map<String, dynamic> toCheckinParams() {
    return {
      'filePath': filePath,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}