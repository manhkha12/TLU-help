import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';


@freezed
class User with _$User {
  factory User({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'username') required String name,
    @JsonKey(name: 'role') String? role,
    // @JsonKey(name: 'phone_number') String? phoneNumber,
   
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}