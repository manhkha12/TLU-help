import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

Object? readUserId(Map json, String key) => json['userId'] ?? json['id'];

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: 'userId', readValue: readUserId) required String userId,
    @JsonKey(name: 'fullName') required String fullName,
    @JsonKey(name: 'code') String? code,
    @JsonKey(name: 'avatarUrl') String? avatarUrl,
    @JsonKey(name: 'subtitle') String? subtitle,
    @JsonKey(name: 'role') String? role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
