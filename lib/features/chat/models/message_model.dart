import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

enum MessageType {
  @JsonValue('TEXT')
  text,
  @JsonValue('IMAGE')
  image,
  @JsonValue('FILE')
  file,
}

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'content') required String content,
    @JsonKey(name: 'senderId') required String senderId,
    @JsonKey(name: 'createdAt') required String createdAt,
    @JsonKey(name: 'messageType') @Default(MessageType.text) MessageType messageType,
    @JsonKey(name: 'mediaUrl') String? mediaUrl,
    @JsonKey(name: 'isRead') @Default(false) bool isRead,
    @Default(false) bool isMe,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
}
