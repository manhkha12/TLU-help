import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/models/app_error.dart';
import 'package:tlu_students/models/chat_message.dart';
import 'package:tlu_students/models/chat_session.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default(false) bool isLoading,
    @Default(false) bool isSending,
    @Default([]) List<ChatSession> sessions,
    @Default([]) List<ChatMessage> messages,
    String? currentSessionId,
    AppError? error,
  }) = _ChatState;
}
