import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tlu_students/app_config.dart';
import 'package:tlu_students/features/checkin/cubit/checkin_state.dart';
import 'package:tlu_students/features/localization/translate_extension.dart';
import 'package:tlu_students/repository/user_repository.dart';
import 'package:tlu_students/repository/module_repository.dart';


class CheckInCubit extends Cubit<CheckInState> {
  final UserRepository userRepository;
  final ModuleRespository moduleRespository;

  CheckInCubit({
    required this.userRepository,
    required this.moduleRespository,
  }) : super(CheckInState());

  // Method to update check-in loading step (capturing, getting gps, etc.)
  void updateCheckinStatus(String? status) {
    emit(state.copyWith(checkinStatus: status));
  }

  // Method to update check-in data in state
  void updateCheckinData({String? filePath, double? latitude, double? longitude}) {
    emit(state.copyWith(
      filePath: filePath ?? state.filePath,
      latitude: latitude ?? state.latitude,
      longitude: longitude ?? state.longitude,
    ));
  }

  // Method to clear status and results
  void clearCheckinStatus() {
    emit(state.copyWith(
      checkinStatus: null,
      checkinSuccess: null,
      checkinMessage: null,
      filePath: null,
      latitude: null,
      longitude: null,
    ));
  }

  // Method to manually emit check-in error from UI steps
  void emitCheckinError(String message) {
    emit(state.copyWith(
      isLoading: false,
      checkinStatus: null,
      checkinSuccess: false,
      checkinMessage: message,
    ));
  }

  // Method to check in using face recognition via HTTP
  Future<void> attendByFace() async {
    final sessionId = state.activeSession?.id;
    if (sessionId == null) {
      emit(state.copyWith(
        checkinSuccess: false,
        checkinMessage: 'Không tìm thấy buổi điểm danh hoạt động',
      ));
      return;
    }

    final params = state.toCheckinParams();
    if (params['filePath'] == null || params['latitude'] == null || params['longitude'] == null) {
      emit(state.copyWith(
        checkinSuccess: false,
        checkinMessage: 'Thiếu thông tin khuôn mặt hoặc vị trí điểm danh',
      ));
      return;
    }

    emit(state.copyWith(
      isLoading: true,
      checkinStatus: 'checkin.submitting',
      checkinSuccess: null,
      checkinMessage: null,
    ));

    try {
      final result = await moduleRespository.attendByFace(
        sessionId: sessionId,
        params: params,
      );

      final success = result['success'] ?? false;
      final message = result['message'] ?? 'Điểm danh thành công';

      emit(state.copyWith(
        isLoading: false,
        checkinStatus: null,
        checkinSuccess: success,
        checkinMessage: message,
      ));
    } catch (e) {
      String errorMessage = 'Lỗi điểm danh: $e';
      if (e is DioException) {
        final data = e.response?.data;
        if (data is Map && data['message'] != null) {
          errorMessage = data['message'].toString();
        }
      }
      emit(state.copyWith(
        isLoading: false,
        checkinStatus: null,
        checkinSuccess: false,
        checkinMessage: errorMessage,
      ));
    }
  }

  // Method để join session
  void joinSession(String sessionId) {
    emit(state.copyWith(currentSessionId: sessionId));
  }

  // Method để leave session
  void leaveSession() {
    if (state.currentSessionId != null) {
      emit(state.copyWith(currentSessionId: null));
    }
  }

  // Method để refresh records (nếu cần gọi API)
  Future<void> refreshRecords() async {
    try {
      emit(state.copyWith(isRefreshing: true));
      emit(state.copyWith(isRefreshing: false));  // Placeholder
    } catch (e) {
      emit(state.copyWith(isRefreshing: false));
    }
  }

  Future<void> fetchActiveSession() async {
    try {
      emit(state.copyWith(isLoading: true));
      final session = await moduleRespository.getActiveAttendanceSession();
      emit(state.copyWith(
        activeSession: session,
        isLoading: false,
        currentSessionId: session?.id,
      ));
      if (session != null) {
        joinSession(session.id);
      }
      updateTimingStatus();
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> checkGPS() async {
    try {
      Position pos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      
      updateCheckinData(latitude: pos.latitude, longitude: pos.longitude);
      
      final activeSession = state.activeSession;
      final courseClass = activeSession?.courseClass;
      
      final targetLat = courseClass?.latitude ?? AppConfig.defaultLatitude;
      final targetLng = courseClass?.longitude ?? AppConfig.defaultLongitude;
      final targetRadius = courseClass?.allowedRadius ?? AppConfig.defaultAllowedRadius;
      
      double dist = Geolocator.distanceBetween(
          targetLat, targetLng, pos.latitude, pos.longitude);
      
      final isLocationOk = dist <= targetRadius;
      
      emit(state.copyWith(
        isLocationOk: isLocationOk,
        gpsDistance: dist,
        locationStatusText: isLocationOk
            ? 'common.at_tlu'.tr(args: [dist.toInt().toString()])
            : 'common.too_far'.tr(args: [dist.toInt().toString()]),
      ));
    } catch (e) {
      emit(state.copyWith(
        isLocationOk: false,
        locationStatusText: 'checkin.location_error'.tr(),
      ));
    }
  }

  void updateTimingStatus() {
    final course = state.activeSession?.courseClass;
    if (course == null) {
      emit(state.copyWith(
        isOccurring: false,
        isAllowed: false,
        timingStatusText: 'checkin.no_class_scheduled'.tr(),
      ));
      return;
    }

    final now = DateTime.now();
    final timeRange = course.lessonSlot.split('-');
    if (timeRange.length < 2) {
      emit(state.copyWith(
        isOccurring: false,
        isAllowed: false,
        timingStatusText: 'checkin.invalid_time_slot'.tr(),
      ));
      return;
    }

    final startStr = timeRange[0].trim();
    final endStr = timeRange[1].trim();

    final startTime = _parseTime(startStr);
    final endTime = _parseTime(endStr);

    if (startTime == null || endTime == null) {
      emit(state.copyWith(
        isOccurring: false,
        isAllowed: false,
        timingStatusText: 'checkin.invalid_time_slot'.tr(),
      ));
      return;
    }

    final classStart = DateTime(now.year, now.month, now.day, startTime['hour']!, startTime['minute']!);
    final classEnd = DateTime(now.year, now.month, now.day, endTime['hour']!, endTime['minute']!);

    final isOccurring = (now.isAfter(classStart) || now.isAtSameMomentAs(classStart)) && now.isBefore(classEnd);

    if (!isOccurring) {
      emit(state.copyWith(
        isOccurring: false,
        isAllowed: false,
        timingStatusText: 'checkin.no_class_scheduled'.tr(),
      ));
      return;
    }

    final diffMinutes = now.difference(classStart).inMinutes;

    if (diffMinutes >= 0 && diffMinutes <= 15) {
      emit(state.copyWith(
        isOccurring: true,
        isAllowed: true,
        timingStatusText: 'checkin.on_time'.tr(),
      ));
    } else if (diffMinutes > 15 && diffMinutes <= 30) {
      emit(state.copyWith(
        isOccurring: true,
        isAllowed: true,
        timingStatusText: 'checkin.late'.tr(),
      ));
    } else {
      emit(state.copyWith(
        isOccurring: true,
        isAllowed: false,
        timingStatusText: 'checkin.expired'.tr(),
      ));
    }
  }

  Map<String, int>? _parseTime(String timeStr) {
    try {
      final cleanStr = timeStr.replaceAll('h', ':').trim();
      final parts = cleanStr.split(':');
      if (parts.length < 2) return null;
      final hour = int.parse(parts[0].trim());
      final minute = int.parse(parts[1].trim());
      return {'hour': hour, 'minute': minute};
    } catch (_) {
      return null;
    }
  }
}