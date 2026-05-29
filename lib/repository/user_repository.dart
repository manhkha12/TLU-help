// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:tlu_students/app_config.dart';
// import 'package:tlu_students/data/local/app_provider.dart';
// import 'package:tlu_students/shared/enum/socket_event.dart';
// import 'package:socket_io_client/socket_io_client.dart';

// class UserRepository {
//   final AppProvider appProvider;
//   final AppConfig appConfig;

//   Socket? socket;
//   String? token;
//   bool initialized = false;

//   UserRepository({
//     required this.appProvider,
//     required this.appConfig,
//   });

//   Future<void> initSocket() async {
//     if (initialized) return;
//     token ??= appProvider.accessToken;
//     if (token == null) return;
//     socket = io(
//       appConfig.baseSocketUrl,
//       OptionBuilder()
//           .setTransports(['websocket', 'polling'])
//           .setAuth({'token': 'Bearer $token'})
//           .disableAutoConnect()
//           .enableForceNew()
//           .enableReconnection()
//           .build(),
//     );
//     connectSocket();
//     initialized = true;
//   }

//   void updateNode(
//     String moduleId, {
//     required int gpioKey,
//     required int state,
//     ValueChanged<dynamic>? onSuccess,
//   }) {
//     socket?.emitWithAck(
//       SocketEvent.UPDATE_NODE.value,
//       {
//         'module_id': moduleId,
//         'gpio_key': gpioKey,
//         'state': state,
//       },
//       ack: onSuccess ?? (_) {},
//     );
//   }

//   void sendCommand(
//     String moduleId, {
//     required ControlCommand command,
//     Map<String, dynamic>? data,
//     ValueChanged<dynamic>? onSuccess,
//   }) {
//     socket?.emitWithAck(
//       SocketEvent.MODULE_CONTROL.value,
//       {
//         'module_id': moduleId,
//         'command': command.index,
//         'data': data,
//       },
//       ack: onSuccess ?? (_) {},
//     );
//   }

//   void closeSocket() {
//     socket?.dispose();
//     socket = null;
//     token = null;
//     initialized = false;
//   }

//   void connectSocket() {
//     if (!(socket?.connected ?? false)) {
//       socket?.connect();
//     }
//   }

//   void disconnectSocket() {
//     socket?.disconnect();
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tlu_students/app_config.dart';  // Giả sử import từ app_config.dart
import 'package:tlu_students/data/local/app_provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'dart:async';
import 'dart:developer' as dev;


class UserRepository {
  final AppProvider appProvider;
  final AppConfig appConfig;

  Socket? socket;
  String? token;
  bool initialized = false;

  UserRepository({
    required this.appProvider,
    required this.appConfig,
  });

  final _messageController = StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get messageStream => _messageController.stream;

  final _typingController = StreamController<Map<String, dynamic>>.broadcast();
  Stream<Map<String, dynamic>> get typingStream => _typingController.stream;


  Future<void> initSocket() async {
    if (initialized) return;
    token ??= appProvider.accessToken;
    if (token == null) return;

    // Kết nối vào namespace /messaging giống Dashboard
    final socketUrl = '${appConfig.baseSocketUrl}/messaging';

    socket = io(
      socketUrl,
      OptionBuilder()
          .setTransports(['websocket', 'polling'])
          .setAuth({'token': token}) // Dashboard dùng format { token: token }
          .disableAutoConnect()
          .enableForceNew()
          .enableReconnection()
          .build(),
    );
    // Thêm listeners cho events điểm danh
    _setupAttendanceListeners();
    _setupMessagingListeners();
    connectSocket();
    initialized = true;
  }


  // Thêm listeners cho attendance events
  void _setupAttendanceListeners() {
    socket?.on('attendanceUpdated', (data) {
      dev.log('Attendance updated: $data', name: 'Socket');
    });
    socket?.on('attendanceBulkUpdated', (data) {
      dev.log('Bulk attendance updated: $data', name: 'Socket');
    });
    socket?.on('joinedSession', (data) {
      dev.log('Joined session: $data', name: 'Socket');
    });
    socket?.on('leftSession', (data) {
      dev.log('Left session: $data', name: 'Socket');
    });
  }

  void _setupMessagingListeners() {
    socket?.onConnect((_) {
      dev.log('🚀 [Socket] Connected to /messaging', name: 'Socket');
      // Server NestJS yêu cầu xác thực thủ công sau khi kết nối
      if (token != null) {
        socket?.emit('authenticate', {'token': 'Bearer $token'});
        dev.log('🔐 [Socket] Sent authenticate event', name: 'Socket');
      }
    });

    socket?.on('authenticated', (data) {
      dev.log('✅ [Socket] Authenticated successfully: $data', name: 'Socket');
    });

    socket?.on('authError', (data) {
      dev.log('❌ [Socket] Authentication Error: $data', name: 'Socket');
    });

    socket?.onDisconnect((data) {
      dev.log('🔻 [Socket] Disconnected: $data', name: 'Socket');
    });

    socket?.onConnectError((data) {
      dev.log('❌ [Socket] Connection Error: $data', name: 'Socket');
    });

    socket?.onError((data) {
      dev.log('⚠️ [Socket] Error: $data', name: 'Socket');
    });

    socket?.on('newMessage', (data) {
      dev.log('📩 [Socket] New Message: $data', name: 'Socket');
      _messageController.add(Map<String, dynamic>.from(data));
    });

    socket?.on('userTyping', (data) {
      _typingController.add(Map<String, dynamic>.from(data));
    });
  }

  void sendMessage(Map<String, dynamic> data) {
    // Đảm bảo conversationId luôn là String để khớp với Backend/Web
    final Map<String, dynamic> sendData = Map<String, dynamic>.from(data);
    if (sendData['conversationId'] != null) {
      sendData['conversationId'] = sendData['conversationId'].toString();
    }

    dev.log('📤 [Socket] Sending: $sendData', name: 'Socket');
    socket?.emit('sendMessage', sendData);
  }

  void joinConversation(String conversationId) {
    dev.log('🚪 [Socket] Joining conversation: $conversationId', name: 'Socket');
    socket?.emit('joinConversation', {'conversationId': conversationId.toString()});
  }

  void leaveConversation(String conversationId) {
    dev.log('🚪 [Socket] Leaving conversation: $conversationId', name: 'Socket');
    socket?.emit('leaveConversation', {'conversationId': conversationId.toString()});
  }

  void emitTyping(String conversationId) {
    socket?.emit('typing', {'conversationId': conversationId.toString()});
  }


  // Method để join session (emit 'joinSession')
  void joinAttendanceSession(String sessionId) {
    socket?.emit('joinSession', {'sessionId': sessionId});
  }

  // Method để leave session (emit 'leaveSession')
  void leaveAttendanceSession(String sessionId) {
    socket?.emit('leaveSession', {'sessionId': sessionId});
  }

  // Giữ nguyên các methods khác (updateNode, sendCommand) nếu cần cho smart home,
  // hoặc xóa nếu chỉ dùng cho attendance.

  void closeSocket() {
    socket?.dispose();
    socket = null;
    token = null;
    initialized = false;
  }

  void connectSocket() {
    if (!(socket?.connected ?? false)) {
      socket?.connect();
    }
  }

  void disconnectSocket() {
    socket?.disconnect();
  }
}