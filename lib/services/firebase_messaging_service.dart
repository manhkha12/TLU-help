import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import 'package:tlu_students/features/notification/cubit/notification_cubit.dart';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:tlu_students/repository/module_repository.dart';
import 'package:tlu_students/data/local/app_provider.dart';

// Biến global để truy cập navigator (nếu cần thiết, tuỳ setup)
// Nếu có navigatorKey global, ta có thể dùng nó để lấy context.
// Ở đây ta nhận navigatorKey từ hàm init.
class FirebaseMessagingService {
  static final FirebaseMessagingService _instance =
      FirebaseMessagingService._internal();

  factory FirebaseMessagingService() {
    return _instance;
  }

  FirebaseMessagingService._internal();

  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  GlobalKey<NavigatorState>? _navigatorKey;

  Future<void> init(GlobalKey<NavigatorState> navigatorKey) async {
    _navigatorKey = navigatorKey;

    // 1. Xin quyền nhận thông báo (đặc biệt cần thiết trên iOS)
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');

    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      // 2. Lấy FCM Token
      String? token = await _fcm.getToken();
      print("FCM Device Token: $token");
      if (token != null) {
        _sendTokenToBackend(token);
      }

      // Lắng nghe khi token thay đổi
      _fcm.onTokenRefresh.listen(_sendTokenToBackend);

      // Cấu hình hiển thị thông báo foreground cho iOS (Android sẽ cần cấu hình channel nếu muốn hiện ở system tray)
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      // 3. Lắng nghe sự kiện Foreground
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

      // 4. Lắng nghe sự kiện mở app từ thông báo Background/Terminated
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

      // Kiểm tra xem app có được mở từ Terminated state do nhấn vào thông báo không
      RemoteMessage? initialMessage =
          await FirebaseMessaging.instance.getInitialMessage();
      if (initialMessage != null) {
        _handleMessageOpenedApp(initialMessage);
      }
    }
  }

  /// Công khai hàm gửi token để có thể gọi từ bên ngoài (VD: sau khi đăng nhập thành công)
  Future<void> updateToken() async {
    String? token = await _fcm.getToken();
    if (token != null) {
      await _sendTokenToBackend(token);
    }
  }

  Future<void> _sendTokenToBackend(String token) async {
    try {
      final deviceInfo = DeviceInfoPlugin();
      String deviceName = 'Unknown Device';
      String platform = Platform.operatingSystem;

      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceName = '${androidInfo.brand} ${androidInfo.model}';
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceName = iosInfo.name;
      }

      print(
          "Sending FCM Token to backend: $token (Device: $deviceName, Platform: $platform)");

      final appProvider = GetIt.I<AppProvider>();
      if (!appProvider.hasAccessToken) {
        print("⚠️ [FCM] User not logged in, skipping FCM registration.");
        return;
      }

      final moduleRepository = GetIt.I<ModuleRespository>();
      await moduleRepository.registerFcmToken(token, deviceName, platform);
    } catch (e) {
      print("Error sending FCM Token to backend: $e");
    }
  }

  void _handleForegroundMessage(RemoteMessage message) {
    print("Received foreground message: ${message.messageId}");
    final context = _navigatorKey?.currentContext;
    if (context != null) {
      // Tăng số lượng unread count trong Cubit
      context.read<NotificationCubit>().incrementUnreadCount();

      // Hiển thị in-app banner/snackbar
      if (message.notification != null) {
        toastification.show(
          context: context,
          type: ToastificationType.info,
          style: ToastificationStyle.flatColored,
          title: Text(message.notification!.title ?? 'Thông báo mới'),
          description: Text(message.notification!.body ?? ''),
          alignment: Alignment.topCenter,
          autoCloseDuration: const Duration(seconds: 4),
          icon: const Icon(Icons.notifications_active, color: Colors.blue),
          showProgressBar: false,
          callbacks: ToastificationCallbacks(
            onTap: (toastItem) {
              // Handle tap on toast
              toastification.dismiss(toastItem);
              _handleMessageOpenedApp(message);
            },
          ),
        );
      }
    }
  }

  void _handleMessageOpenedApp(RemoteMessage message) {
    print("App opened from notification: ${message.messageId}");
    // TODO: Điều hướng đến màn hình NotificationDetail
    final context = _navigatorKey?.currentContext;
    if (context != null) {
      // Mở màn hình Notification Screen hoặc Detail Screen tuỳ thuộc vào payload
      // Navigator.pushNamed(context, '/notifications');
    }
  }
}

// Hàm lắng nghe Background message phải là top-level function
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Cần init Firebase trong này nếu chưa có
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
}
