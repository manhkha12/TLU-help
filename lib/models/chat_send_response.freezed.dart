// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_send_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatSendResponse _$ChatSendResponseFromJson(Map<String, dynamic> json) {
  return _ChatSendResponse.fromJson(json);
}

/// @nodoc
mixin _$ChatSendResponse {
  @JsonKey(name: 'sessionId')
  String get sessionId => throw _privateConstructorUsedError;
  ChatMessage get message => throw _privateConstructorUsedError;
  int? get sources => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatSendResponseCopyWith<ChatSendResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatSendResponseCopyWith<$Res> {
  factory $ChatSendResponseCopyWith(
          ChatSendResponse value, $Res Function(ChatSendResponse) then) =
      _$ChatSendResponseCopyWithImpl<$Res, ChatSendResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sessionId') String sessionId,
      ChatMessage message,
      int? sources});

  $ChatMessageCopyWith<$Res> get message;
}

/// @nodoc
class _$ChatSendResponseCopyWithImpl<$Res, $Val extends ChatSendResponse>
    implements $ChatSendResponseCopyWith<$Res> {
  _$ChatSendResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? message = null,
    Object? sources = freezed,
  }) {
    return _then(_value.copyWith(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatMessage,
      sources: freezed == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatMessageCopyWith<$Res> get message {
    return $ChatMessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChatSendResponseImplCopyWith<$Res>
    implements $ChatSendResponseCopyWith<$Res> {
  factory _$$ChatSendResponseImplCopyWith(_$ChatSendResponseImpl value,
          $Res Function(_$ChatSendResponseImpl) then) =
      __$$ChatSendResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sessionId') String sessionId,
      ChatMessage message,
      int? sources});

  @override
  $ChatMessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$ChatSendResponseImplCopyWithImpl<$Res>
    extends _$ChatSendResponseCopyWithImpl<$Res, _$ChatSendResponseImpl>
    implements _$$ChatSendResponseImplCopyWith<$Res> {
  __$$ChatSendResponseImplCopyWithImpl(_$ChatSendResponseImpl _value,
      $Res Function(_$ChatSendResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? message = null,
    Object? sources = freezed,
  }) {
    return _then(_$ChatSendResponseImpl(
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ChatMessage,
      sources: freezed == sources
          ? _value.sources
          : sources // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatSendResponseImpl implements _ChatSendResponse {
  const _$ChatSendResponseImpl(
      {@JsonKey(name: 'sessionId') required this.sessionId,
      required this.message,
      this.sources});

  factory _$ChatSendResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatSendResponseImplFromJson(json);

  @override
  @JsonKey(name: 'sessionId')
  final String sessionId;
  @override
  final ChatMessage message;
  @override
  final int? sources;

  @override
  String toString() {
    return 'ChatSendResponse(sessionId: $sessionId, message: $message, sources: $sources)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatSendResponseImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.sources, sources) || other.sources == sources));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sessionId, message, sources);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatSendResponseImplCopyWith<_$ChatSendResponseImpl> get copyWith =>
      __$$ChatSendResponseImplCopyWithImpl<_$ChatSendResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatSendResponseImplToJson(
      this,
    );
  }
}

abstract class _ChatSendResponse implements ChatSendResponse {
  const factory _ChatSendResponse(
      {@JsonKey(name: 'sessionId') required final String sessionId,
      required final ChatMessage message,
      final int? sources}) = _$ChatSendResponseImpl;

  factory _ChatSendResponse.fromJson(Map<String, dynamic> json) =
      _$ChatSendResponseImpl.fromJson;

  @override
  @JsonKey(name: 'sessionId')
  String get sessionId;
  @override
  ChatMessage get message;
  @override
  int? get sources;
  @override
  @JsonKey(ignore: true)
  _$$ChatSendResponseImplCopyWith<_$ChatSendResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
