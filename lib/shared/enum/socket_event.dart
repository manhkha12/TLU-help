// ignore_for_file: constant_identifier_names

enum SocketEvent {
  JOIN_SESSION('joinSession'),
  LEAVE_SESSION('leaveSession'),
  ATTENDANCE_UPDATED('attendanceUpdated'),
  ATTENDANCE_BULK_UPDATED('attendanceBulkUpdated');

  final String value;
  const SocketEvent(this.value);
}

enum ControlCommand {
  restart,
  reset,
  updateWiFi,
}
