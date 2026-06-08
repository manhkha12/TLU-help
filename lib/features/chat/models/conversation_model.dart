import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';
import 'message_model.dart';

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

@freezed
class ConversationModel with _$ConversationModel {
  const factory ConversationModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'partner') required UserModel partner,
    @JsonKey(name: 'lastMessage') MessageModel? lastMessage,
    @JsonKey(name: 'lastMessageAt') String? lastMessageAt,
    @JsonKey(name: 'unreadCount') @Default(0) int unreadCount,
  }) = _ConversationModel;

  factory ConversationModel.fromJson(Map<String, dynamic> json) => _$ConversationModelFromJson(json);
}
