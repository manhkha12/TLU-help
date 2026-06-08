import 'package:tlu_students/data/remote/handler/api_handler.dart';

class MessagingApi {
  final ApiHandler apiHandler;

  MessagingApi(this.apiHandler);

  /// Lấy danh sách chat (GET /messaging/conversations)
  Future<List<dynamic>> getConversations() async {
    final resp = await apiHandler.get('/messaging/conversations');
    return resp as List<dynamic>;
  }

  /// Tạo/Mở cuộc chat (POST /messaging/conversations)
  Future<Map<String, dynamic>> createConversation(String targetUserId) async {
    final resp = await apiHandler.post('/messaging/conversations', body: {
      'targetUserId': targetUserId,
    });
    return resp as Map<String, dynamic>;
  }

  /// Tổng số tin chưa đọc (GET /messaging/unread-count)
  Future<Map<String, dynamic>> getUnreadCount() async {
    final resp = await apiHandler.get('/messaging/unread-count');
    return resp as Map<String, dynamic>;
  }

  /// Lấy tin nhắn trong phòng (GET /messaging/conversations/{id}/messages)
  Future<Map<String, dynamic>> getMessages(String conversationId, {String? cursor, int limit = 30}) async {
    final Map<String, dynamic> query = {'limit': limit};
    if (cursor != null) {
      query['cursor'] = cursor;
    }
    final resp = await apiHandler.get('/messaging/conversations/$conversationId/messages', queryParameters: query);
    return resp as Map<String, dynamic>;
  }

  /// Gửi tin nhắn (Fallback) (POST /messaging/conversations/{id}/messages)
  Future<Map<String, dynamic>> sendMessageFallback(String conversationId, Map<String, dynamic> data) async {
    final resp = await apiHandler.post('/messaging/conversations/$conversationId/messages', body: data);
    return resp as Map<String, dynamic>;
  }

  /// Đánh dấu đã đọc (PATCH /messaging/conversations/{id}/read)
  Future<void> markAsRead(String conversationId) async {
    await apiHandler.patch('/messaging/conversations/$conversationId/read');
  }

  /// Thu hồi tin nhắn (DELETE /messaging/messages/{id})
  Future<void> deleteMessage(String messageId) async {
    await apiHandler.delete('/messaging/messages/$messageId');
  }

  /// Tìm người để chat (GET /messaging/users/search)
  Future<List<dynamic>> searchUsers(String query) async {
    final resp = await apiHandler.get('/messaging/users/search', queryParameters: {'q': query});
    return resp as List<dynamic>;
  }

  /// Xóa cuộc hội thoại (DELETE /messaging/conversations/{id})
  Future<void> deleteConversation(String conversationId) async {
    await apiHandler.delete('/messaging/conversations/$conversationId');
  }

  // --- AI CHAT ENDPOINTS ---
  Future<Map<String, dynamic>> sendAiMessage(String message, {String? sessionId}) async {
    final Map<String, dynamic> body = {'message': message};
    if (sessionId != null) {
      body['sessionId'] = sessionId;
    }
    final resp = await apiHandler.post('/chat/send', body: body);
    return resp as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> createAiSession() async {
    final resp = await apiHandler.post('/chat/sessions');
    return resp as Map<String, dynamic>;
  }

  Future<List<dynamic>> getAiSessions() async {
    final resp = await apiHandler.get('/chat/sessions');
    return resp as List<dynamic>;
  }

  Future<List<dynamic>> getAiMessages(String sessionId) async {
    final resp = await apiHandler.get('/chat/sessions/$sessionId/messages');
    return resp as List<dynamic>;
  }

  Future<void> deleteAiSession(String sessionId) async {
    await apiHandler.delete('/chat/sessions/$sessionId');
  }
}

