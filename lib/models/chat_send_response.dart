import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/models/chat_message.dart';

part 'chat_send_response.freezed.dart';
part 'chat_send_response.g.dart';

@freezed
class ChatSendResponse with _$ChatSendResponse {
  const factory ChatSendResponse({
    @JsonKey(name: 'sessionId') required String sessionId,
    required ChatMessage message,
    int? sources,
  }) = _ChatSendResponse;

  factory ChatSendResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatSendResponseFromJson(json);
}
