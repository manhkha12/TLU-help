import 'package:tlu_students/data/remote/messaging_api.dart';
import 'package:tlu_students/repository/user_repository.dart';

import 'package:tlu_students/features/chat/models/user_model.dart';
import 'package:tlu_students/features/chat/models/conversation_model.dart';
import 'package:tlu_students/features/chat/models/message_model.dart';
import 'package:tlu_students/models/chat_session.dart';

import 'package:tlu_students/models/chat_message.dart';
import 'package:tlu_students/models/chat_send_response.dart';


class MessagingRepository {
  final MessagingApi api;
  final UserRepository userRepository;

  MessagingRepository({required this.api, required this.userRepository});


  Future<List<ConversationModel>> getConversations() async {
    final data = await api.getConversations();
    return data.map((e) => ConversationModel.fromJson(e)).toList();
  }

  Future<ConversationModel> createConversation(String targetUserId) async {
    final data = await api.createConversation(targetUserId);
    return ConversationModel.fromJson(data);
  }

  Future<int> getUnreadCount() async {
    final data = await api.getUnreadCount();
    return data['totalUnread'] ?? 0;
  }

  Future<Map<String, dynamic>> getMessages(String conversationId, {String? cursor}) async {
    final data = await api.getMessages(conversationId, cursor: cursor);
    final List<dynamic> msgList = data['messages'] ?? [];
    return {
      'messages': msgList.map((e) => MessageModel.fromJson(e)).toList(),
      'hasMore': data['hasMore'] ?? false,
      'nextCursor': data['nextCursor'],
    };
  }

  Future<void> markAsRead(String conversationId) async {
    await api.markAsRead(conversationId);
  }

  Future<void> deleteMessage(String messageId) async {
    await api.deleteMessage(messageId);
  }

  Future<List<UserModel>> searchUsers(String query) async {
    final data = await api.searchUsers(query);
    return data.map((e) => UserModel.fromJson(e)).toList();
  }

  // Socket methods
  void connectSocket() => userRepository.initSocket();
  void disconnectSocket() => userRepository.disconnectSocket();

  Future<void> deleteAiSession(String sessionId) async {
    await api.deleteAiSession(sessionId);
  }

  Future<void> deleteConversation(String conversationId) async {
    await api.deleteConversation(conversationId);
  }
  void sendSocketMessage(Map<String, dynamic> data) => userRepository.sendMessage(data);
  void emitTyping(String conversationId) => userRepository.emitTyping(conversationId);
  void joinConversation(String conversationId) => userRepository.joinConversation(conversationId);
  void leaveConversation(String conversationId) => userRepository.leaveConversation(conversationId);
  Stream<Map<String, dynamic>> get messageStream => userRepository.messageStream;
  Stream<Map<String, dynamic>> get typingStream => userRepository.typingStream;

  // AI Chat methods
  Future<List<ChatSession>> getAiSessions() async {
    final data = await api.getAiSessions();
    return data.map((e) => ChatSession.fromJson(e)).toList();
  }

  Future<ChatSession> createAiSession() async {
    final data = await api.createAiSession();
    return ChatSession.fromJson(data);
  }

  Future<List<ChatMessage>> getAiMessages(String sessionId) async {
    final data = await api.getAiMessages(sessionId);
    return data.map((e) => ChatMessage.fromJson(e)).toList();
  }

  Future<ChatSendResponse> sendAiMessage(String message, {String? sessionId}) async {
    final data = await api.sendAiMessage(message, sessionId: sessionId);
    return ChatSendResponse.fromJson(data);
  }
}


