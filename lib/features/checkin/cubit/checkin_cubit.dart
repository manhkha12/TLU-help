import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/features/checkin/cubit/checkin_state.dart';
import 'package:tlu_students/models/attendance_record.dart';
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
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}