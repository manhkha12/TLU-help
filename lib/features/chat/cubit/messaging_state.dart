import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/features/chat/models/conversation_model.dart';
import 'package:tlu_students/features/chat/models/message_model.dart';
import 'package:tlu_students/features/chat/models/user_model.dart';
import 'package:tlu_students/models/chat_session.dart';
import 'package:tlu_students/models/app_error.dart';

part 'messaging_state.freezed.dart';

@freezed
class MessagingState with _$MessagingState {
  const factory MessagingState({
    @Default(false) bool isLoading,
    @Default(false) bool isSending,
    @Default([]) List<ConversationModel> conversations,
    @Default([]) List<ChatSession> aiSessions,
    @Default([]) List<MessageModel> messages,
    @Default([]) List<UserModel> searchResults,
    @Default(0) int totalUnread,
    String? currentConversationId,
    String? currentAiSessionId,
    @Default(false) bool isAiChat,
    String? nextCursor,
    @Default(false) bool hasMore,
    AppError? error,
    @Default({}) Map<String, String> typingUsers, // conversationId -> typing status text
  }) = _MessagingState;
}
