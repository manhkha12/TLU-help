import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/repository/module_repository.dart';
import 'package:tlu_students/models/app_error.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final ModuleRespository moduleRespository;

  NotificationCubit({required this.moduleRespository})
      : super(NotificationState());

  Future<void> getNotifications({bool isLoadMore = false, bool? isRead}) async {
    if (isLoadMore && state.hasReachedMax) return;

    if (isLoadMore) {
      emit(state.copyWith(isLoadingMore: true, error: null));
    } else {
      emit(state.copyWith(isLoading: true, error: null, hasReachedMax: false));
    }

    try {
      final skip = isLoadMore ? state.notifications.length : 0;
      final response = await moduleRespository.getNotification(skip: skip, take: 20, isRead: isRead);
      
      final newNotifications = isLoadMore 
          ? [...state.notifications, ...response.data] 
          : response.data;

      emit(state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        isSuccess: true,
        notifications: newNotifications,
        total: response.total,
        unreadCount: response.unreadCount,
        hasReachedMax: response.data.length < 20,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        isSuccess: false,
        error: AppError.data(e.toString()),
      ));
    }
  }

  Future<void> markAsRead(String id) async {
    final notification = state.notifications.firstWhere((n) => n.id == id);
    if (notification.isRead) return;

    // 1. Cập nhật giao diện (UI) ngay lập tức
    final updated = state.notifications.map((n) {
      if (n.id == id) {
        return n.copyWith(isRead: true);
      }
      return n;
    }).toList();
    
    emit(state.copyWith(
      notifications: updated,
      unreadCount: state.unreadCount > 0 ? state.unreadCount - 1 : 0,
    ));

    // 2. Gọi API để lưu trạng thái đã đọc xuống backend
    try {
      await moduleRespository.markAsRead(id);
    } catch (e) {
      print("Lỗi markAsRead API: $e");
    }
  }

  Future<void> markAllAsRead() async {
    final updated = state.notifications.map((n) => n.copyWith(isRead: true)).toList();
    
    emit(state.copyWith(
      notifications: updated,
      unreadCount: 0,
    ));

    try {
      await moduleRespository.markAllAsRead();
    } catch (e) {
      print("Lỗi markAllAsRead API: $e");
    }
  }

  Future<void> deleteNotification(String id) async {
    final notification = state.notifications.firstWhere((n) => n.id == id);
    final bool wasUnread = !notification.isRead;

    final updated = state.notifications.where((n) => n.id != id).toList();
    
    emit(state.copyWith(
      notifications: updated,
      total: state.total > 0 ? state.total - 1 : 0,
      unreadCount: wasUnread && state.unreadCount > 0 ? state.unreadCount - 1 : state.unreadCount,
    ));

    try {
      await moduleRespository.deleteNotification(id);
    } catch (e) {
      print("Lỗi deleteNotification API: $e");
    }
  }

  Future<void> getDetailNotification(String id) async {
    try {
      final detail = await moduleRespository.getDetailNotification(id);
      final updated = state.notifications.map((n) {
        if (n.id == id) {
          return detail;
        }
        return n;
      }).toList();
      emit(state.copyWith(notifications: updated));
    } catch (e) {
      print("Lỗi getDetailNotification: $e");
    }
  }

  void incrementUnreadCount() {
    emit(state.copyWith(
      unreadCount: state.unreadCount + 1,
      total: state.total + 1,
    ));
    // Tùy chọn: Gọi lại getNotifications() để lấy dữ liệu mới nhất nếu cần thiết.
    // getNotifications();
  }
}
