import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/data/local/app_provider.dart';
import 'package:tlu_students/models/app_error.dart';
import 'package:tlu_students/repository/messaging_repository.dart';
import 'package:tlu_students/features/chat/models/message_model.dart';
import 'package:tlu_students/features/chat/models/conversation_model.dart';
import 'messaging_state.dart';

class ChatCubit extends Cubit<MessagingState> {
  final MessagingRepository repository;
  final AppProvider appProvider;
  StreamSubscription? _messageSubscription;
  StreamSubscription? _typingSubscription;

  ChatCubit({
    required this.repository,
    required this.appProvider,
  }) : super(const MessagingState());

  void init() {
    final token = appProvider.accessToken;
    if (token != null) {
      repository.connectSocket();
      _listenToSocket();
    }
    getConversations();
    getAiSessions();
    getUnreadCount();
  }

  void _listenToSocket() {
    _messageSubscription?.cancel();
    _messageSubscription = repository.messageStream.listen((data) {
      final newMessage = MessageModel.fromJson(data);
      if (newMessage.id.isNotEmpty) {
        if (state.currentConversationId != null && !state.isAiChat) {
           emit(state.copyWith(
             messages: [...state.messages, newMessage.copyWith(isMe: false)],
           ));
        }
        getConversations();
      }
    });

    _typingSubscription?.cancel();
    _typingSubscription = repository.typingStream.listen((data) {
      final convId = data['conversationId'] as String;
      final updatedTyping = Map<String, String>.from(state.typingUsers);
      updatedTyping[convId] = 'Someone is typing...';
      emit(state.copyWith(typingUsers: updatedTyping));

      Timer(const Duration(seconds: 3), () {
        final currentTyping = Map<String, String>.from(state.typingUsers);
        currentTyping.remove(convId);
        emit(state.copyWith(typingUsers: currentTyping));
      });
    });
  }

  // --- USER CONVERSATIONS ---
  Future<void> getConversations() async {
    emit(state.copyWith(isLoading: true));
    try {
      final conversations = await repository.getConversations();
      // Sắp xếp mới nhất lên đầu
      conversations.sort((a, b) {
        final timeA = a.lastMessageAt != null ? DateTime.tryParse(a.lastMessageAt!) ?? DateTime(0) : DateTime(0);
        final timeB = b.lastMessageAt != null ? DateTime.tryParse(b.lastMessageAt!) ?? DateTime(0) : DateTime(0);
        return timeB.compareTo(timeA);
      });
      emit(state.copyWith(isLoading: false, conversations: conversations));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: AppError.data(e.toString())));
    }
  }

  Future<void> getUnreadCount() async {
    try {
      final count = await repository.getUnreadCount();
      emit(state.copyWith(totalUnread: count));
    } catch (_) {}
  }

  Future<void> selectConversation(String conversationId) async {
    if (state.currentConversationId == conversationId && state.messages.isNotEmpty) {
      return;
    }
    emit(state.copyWith(
      currentConversationId: conversationId, 
      currentAiSessionId: null,
      isAiChat: false,
      messages: [], 
      nextCursor: null, 
      hasMore: false
    ));
    await getMessages(conversationId);
    repository.joinConversation(conversationId);
    await repository.markAsRead(conversationId);
    getUnreadCount();
  }

  void clearCurrentChat() {
    if (state.currentConversationId != null) {
      repository.leaveConversation(state.currentConversationId!);
    }
    emit(state.copyWith(currentConversationId: null, currentAiSessionId: null, messages: []));
  }

  Future<void> cleanupEmptyChat() async {
    // Nếu đang load hoặc đã có tin nhắn thì không xóa
    if (state.isLoading || state.messages.isNotEmpty) {
      clearCurrentChat();
      return;
    }

    try {
      if (state.isAiChat && state.currentAiSessionId != null) {
        await repository.deleteAiSession(state.currentAiSessionId!);
        getAiSessions();
      } else if (state.currentConversationId != null) {
        await repository.deleteConversation(state.currentConversationId!);
        getConversations();
      }
    } catch (_) {
      // Bỏ qua lỗi xóa
    } finally {
      clearCurrentChat();
    }
  }


  Future<void> getMessages(String conversationId, {bool loadMore = false}) async {
    if (loadMore && !state.hasMore) return;
    emit(state.copyWith(isLoading: !loadMore));
    try {
      final result = await repository.getMessages(conversationId, cursor: loadMore ? state.nextCursor : null);
      final List<MessageModel> newMessages = result['messages'];
      final List<MessageModel> updatedMessages = loadMore ? [...newMessages, ...state.messages] : newMessages;

      emit(state.copyWith(
        isLoading: false,
        messages: updatedMessages.map((m) => m.copyWith(isMe: m.senderId == appProvider.userId)).toList(),
        hasMore: result['hasMore'],
        nextCursor: result['nextCursor'],
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: AppError.data(e.toString())));
    }
  }

  // --- AI CHAT SESSIONS ---
  Future<void> getAiSessions() async {
    emit(state.copyWith(isLoading: true));
    try {
      final sessions = await repository.getAiSessions();
      // Sắp xếp mới nhất lên đầu
      sessions.sort((a, b) {
        final timeA = a.lastMessageAt != null ? DateTime.tryParse(a.lastMessageAt!) ?? DateTime(0) : DateTime(0);
        final timeB = b.lastMessageAt != null ? DateTime.tryParse(b.lastMessageAt!) ?? DateTime(0) : DateTime(0);
        return timeB.compareTo(timeA);
      });
      emit(state.copyWith(isLoading: false, aiSessions: sessions));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: AppError.data(e.toString())));
    }
  }

  Future<void> selectAiSession(String sessionId) async {
    emit(state.copyWith(
      currentAiSessionId: sessionId, 
      currentConversationId: null,
      isAiChat: true,
      messages: []
    ));
    await getAiMessages(sessionId);
  }

  Future<void> getAiMessages(String sessionId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final aiMessages = await repository.getAiMessages(sessionId);
      final mappedMessages = aiMessages.map((m) => MessageModel(
        id: m.id,
        content: m.messageContent,
        senderId: m.senderType == 'USER' ? (appProvider.userId ?? 'me') : 'bot',
        createdAt: m.createdAt,
        isMe: m.senderType == 'USER',
      )).toList();
      
      emit(state.copyWith(isLoading: false, messages: mappedMessages));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: AppError.data(e.toString())));
    }
  }

  Future<void> createNewAiChat() async {
    emit(state.copyWith(isLoading: true, error: null, currentAiSessionId: null, isAiChat: true, messages: []));
    try {
      final session = await repository.createAiSession();
      emit(state.copyWith(
        isLoading: false,
        currentAiSessionId: session.id,
        aiSessions: [session, ...state.aiSessions],
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: AppError.data(e.toString())));
    }
  }

  // --- COMMON SEND ---
  void sendMessage(String content, {String type = 'TEXT'}) async {
    if (content.trim().isEmpty) return;

    if (state.isAiChat) {
      _sendAiMessage(content);
    } else {
      _sendUserMessage(content, type: type);
    }
  }

  void _sendUserMessage(String content, {String type = 'TEXT'}) {
    if (state.currentConversationId == null) return;
    final tempMsg = MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      senderId: appProvider.userId ?? '',
      createdAt: DateTime.now().toIso8601String(),
      isMe: true,
    );
    emit(state.copyWith(messages: [...state.messages, tempMsg]));
    repository.sendSocketMessage({
      'conversationId': state.currentConversationId,
      'content': content,
      'messageType': type,
    });
  }

  Future<void> _sendAiMessage(String content) async {
    final tempUserMessage = MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: content,
      senderId: appProvider.userId ?? 'me',
      createdAt: DateTime.now().toIso8601String(),
      isMe: true,
    );

    emit(state.copyWith(
      isSending: true,
      messages: [...state.messages, tempUserMessage],
    ));

    try {
      final response = await repository.sendAiMessage(content, sessionId: state.currentAiSessionId);
      final botMsg = MessageModel(
        id: response.message.id,
        content: response.message.messageContent,
        senderId: 'bot',
        createdAt: response.message.createdAt,
        isMe: false,
      );

      emit(state.copyWith(
        isSending: false,
        currentAiSessionId: response.sessionId,
        messages: [...state.messages, botMsg],
      ));
      getAiSessions();
    } catch (e) {
      emit(state.copyWith(isSending: false, error: AppError.data(e.toString())));
    }
  }

  // --- HELPER METHODS ---
  void emitTyping() {
    if (state.currentConversationId != null && !state.isAiChat) {
      repository.emitTyping(state.currentConversationId!);
    }
  }

  void closeSocket() {
    repository.disconnectSocket();
  }

  Future<void> searchUsers(String query) async {
    if (query.length < 2) {
      emit(state.copyWith(searchResults: []));
      return;
    }
    try {
      final results = await repository.searchUsers(query);
      emit(state.copyWith(searchResults: results));
    } catch (e) {
      print('Error searching users: $e');
      emit(state.copyWith(error: AppError.data(e.toString())));
    }
  }

  Future<ConversationModel?> createConversation(String targetUserId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final conversation = await repository.createConversation(targetUserId);
      emit(state.copyWith(
        isLoading: false,
        conversations: [conversation, ...state.conversations.where((c) => c.id != conversation.id)],
        searchResults: [],
      ));
      selectConversation(conversation.id);
      return conversation;
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: AppError.data(e.toString())));
      return null;
    }
  }

  @override
  Future<void> close() {
    _messageSubscription?.cancel();
    _typingSubscription?.cancel();
    return super.close();
  }
}
