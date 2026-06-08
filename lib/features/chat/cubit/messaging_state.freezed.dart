// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messaging_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MessagingState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSending => throw _privateConstructorUsedError;
  List<ConversationModel> get conversations =>
      throw _privateConstructorUsedError;
  List<ChatSession> get aiSessions => throw _privateConstructorUsedError;
  List<MessageModel> get messages => throw _privateConstructorUsedError;
  List<UserModel> get searchResults => throw _privateConstructorUsedError;
  int get totalUnread => throw _privateConstructorUsedError;
  String? get currentConversationId => throw _privateConstructorUsedError;
  String? get currentAiSessionId => throw _privateConstructorUsedError;
  bool get isAiChat => throw _privateConstructorUsedError;
  String? get nextCursor => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  AppError? get error => throw _privateConstructorUsedError;
  Map<String, String> get typingUsers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessagingStateCopyWith<MessagingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagingStateCopyWith<$Res> {
  factory $MessagingStateCopyWith(
          MessagingState value, $Res Function(MessagingState) then) =
      _$MessagingStateCopyWithImpl<$Res, MessagingState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSending,
      List<ConversationModel> conversations,
      List<ChatSession> aiSessions,
      List<MessageModel> messages,
      List<UserModel> searchResults,
      int totalUnread,
      String? currentConversationId,
      String? currentAiSessionId,
      bool isAiChat,
      String? nextCursor,
      bool hasMore,
      AppError? error,
      Map<String, String> typingUsers});

  $AppErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$MessagingStateCopyWithImpl<$Res, $Val extends MessagingState>
    implements $MessagingStateCopyWith<$Res> {
  _$MessagingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSending = null,
    Object? conversations = null,
    Object? aiSessions = null,
    Object? messages = null,
    Object? searchResults = null,
    Object? totalUnread = null,
    Object? currentConversationId = freezed,
    Object? currentAiSessionId = freezed,
    Object? isAiChat = null,
    Object? nextCursor = freezed,
    Object? hasMore = null,
    Object? error = freezed,
    Object? typingUsers = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
      conversations: null == conversations
          ? _value.conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ConversationModel>,
      aiSessions: null == aiSessions
          ? _value.aiSessions
          : aiSessions // ignore: cast_nullable_to_non_nullable
              as List<ChatSession>,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
      searchResults: null == searchResults
          ? _value.searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      totalUnread: null == totalUnread
          ? _value.totalUnread
          : totalUnread // ignore: cast_nullable_to_non_nullable
              as int,
      currentConversationId: freezed == currentConversationId
          ? _value.currentConversationId
          : currentConversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentAiSessionId: freezed == currentAiSessionId
          ? _value.currentAiSessionId
          : currentAiSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      isAiChat: null == isAiChat
          ? _value.isAiChat
          : isAiChat // ignore: cast_nullable_to_non_nullable
              as bool,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
      typingUsers: null == typingUsers
          ? _value.typingUsers
          : typingUsers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppErrorCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $AppErrorCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessagingStateImplCopyWith<$Res>
    implements $MessagingStateCopyWith<$Res> {
  factory _$$MessagingStateImplCopyWith(_$MessagingStateImpl value,
          $Res Function(_$MessagingStateImpl) then) =
      __$$MessagingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSending,
      List<ConversationModel> conversations,
      List<ChatSession> aiSessions,
      List<MessageModel> messages,
      List<UserModel> searchResults,
      int totalUnread,
      String? currentConversationId,
      String? currentAiSessionId,
      bool isAiChat,
      String? nextCursor,
      bool hasMore,
      AppError? error,
      Map<String, String> typingUsers});

  @override
  $AppErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$MessagingStateImplCopyWithImpl<$Res>
    extends _$MessagingStateCopyWithImpl<$Res, _$MessagingStateImpl>
    implements _$$MessagingStateImplCopyWith<$Res> {
  __$$MessagingStateImplCopyWithImpl(
      _$MessagingStateImpl _value, $Res Function(_$MessagingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSending = null,
    Object? conversations = null,
    Object? aiSessions = null,
    Object? messages = null,
    Object? searchResults = null,
    Object? totalUnread = null,
    Object? currentConversationId = freezed,
    Object? currentAiSessionId = freezed,
    Object? isAiChat = null,
    Object? nextCursor = freezed,
    Object? hasMore = null,
    Object? error = freezed,
    Object? typingUsers = null,
  }) {
    return _then(_$MessagingStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
      conversations: null == conversations
          ? _value._conversations
          : conversations // ignore: cast_nullable_to_non_nullable
              as List<ConversationModel>,
      aiSessions: null == aiSessions
          ? _value._aiSessions
          : aiSessions // ignore: cast_nullable_to_non_nullable
              as List<ChatSession>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageModel>,
      searchResults: null == searchResults
          ? _value._searchResults
          : searchResults // ignore: cast_nullable_to_non_nullable
              as List<UserModel>,
      totalUnread: null == totalUnread
          ? _value.totalUnread
          : totalUnread // ignore: cast_nullable_to_non_nullable
              as int,
      currentConversationId: freezed == currentConversationId
          ? _value.currentConversationId
          : currentConversationId // ignore: cast_nullable_to_non_nullable
              as String?,
      currentAiSessionId: freezed == currentAiSessionId
          ? _value.currentAiSessionId
          : currentAiSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      isAiChat: null == isAiChat
          ? _value.isAiChat
          : isAiChat // ignore: cast_nullable_to_non_nullable
              as bool,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
      typingUsers: null == typingUsers
          ? _value._typingUsers
          : typingUsers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$MessagingStateImpl implements _MessagingState {
  const _$MessagingStateImpl(
      {this.isLoading = false,
      this.isSending = false,
      final List<ConversationModel> conversations = const [],
      final List<ChatSession> aiSessions = const [],
      final List<MessageModel> messages = const [],
      final List<UserModel> searchResults = const [],
      this.totalUnread = 0,
      this.currentConversationId,
      this.currentAiSessionId,
      this.isAiChat = false,
      this.nextCursor,
      this.hasMore = false,
      this.error,
      final Map<String, String> typingUsers = const {}})
      : _conversations = conversations,
        _aiSessions = aiSessions,
        _messages = messages,
        _searchResults = searchResults,
        _typingUsers = typingUsers;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSending;
  final List<ConversationModel> _conversations;
  @override
  @JsonKey()
  List<ConversationModel> get conversations {
    if (_conversations is EqualUnmodifiableListView) return _conversations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversations);
  }

  final List<ChatSession> _aiSessions;
  @override
  @JsonKey()
  List<ChatSession> get aiSessions {
    if (_aiSessions is EqualUnmodifiableListView) return _aiSessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aiSessions);
  }

  final List<MessageModel> _messages;
  @override
  @JsonKey()
  List<MessageModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  final List<UserModel> _searchResults;
  @override
  @JsonKey()
  List<UserModel> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  @JsonKey()
  final int totalUnread;
  @override
  final String? currentConversationId;
  @override
  final String? currentAiSessionId;
  @override
  @JsonKey()
  final bool isAiChat;
  @override
  final String? nextCursor;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  final AppError? error;
  final Map<String, String> _typingUsers;
  @override
  @JsonKey()
  Map<String, String> get typingUsers {
    if (_typingUsers is EqualUnmodifiableMapView) return _typingUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_typingUsers);
  }

  @override
  String toString() {
    return 'MessagingState(isLoading: $isLoading, isSending: $isSending, conversations: $conversations, aiSessions: $aiSessions, messages: $messages, searchResults: $searchResults, totalUnread: $totalUnread, currentConversationId: $currentConversationId, currentAiSessionId: $currentAiSessionId, isAiChat: $isAiChat, nextCursor: $nextCursor, hasMore: $hasMore, error: $error, typingUsers: $typingUsers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagingStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSending, isSending) ||
                other.isSending == isSending) &&
            const DeepCollectionEquality()
                .equals(other._conversations, _conversations) &&
            const DeepCollectionEquality()
                .equals(other._aiSessions, _aiSessions) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality()
                .equals(other._searchResults, _searchResults) &&
            (identical(other.totalUnread, totalUnread) ||
                other.totalUnread == totalUnread) &&
            (identical(other.currentConversationId, currentConversationId) ||
                other.currentConversationId == currentConversationId) &&
            (identical(other.currentAiSessionId, currentAiSessionId) ||
                other.currentAiSessionId == currentAiSessionId) &&
            (identical(other.isAiChat, isAiChat) ||
                other.isAiChat == isAiChat) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality()
                .equals(other._typingUsers, _typingUsers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSending,
      const DeepCollectionEquality().hash(_conversations),
      const DeepCollectionEquality().hash(_aiSessions),
      const DeepCollectionEquality().hash(_messages),
      const DeepCollectionEquality().hash(_searchResults),
      totalUnread,
      currentConversationId,
      currentAiSessionId,
      isAiChat,
      nextCursor,
      hasMore,
      error,
      const DeepCollectionEquality().hash(_typingUsers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagingStateImplCopyWith<_$MessagingStateImpl> get copyWith =>
      __$$MessagingStateImplCopyWithImpl<_$MessagingStateImpl>(
          this, _$identity);
}

abstract class _MessagingState implements MessagingState {
  const factory _MessagingState(
      {final bool isLoading,
      final bool isSending,
      final List<ConversationModel> conversations,
      final List<ChatSession> aiSessions,
      final List<MessageModel> messages,
      final List<UserModel> searchResults,
      final int totalUnread,
      final String? currentConversationId,
      final String? currentAiSessionId,
      final bool isAiChat,
      final String? nextCursor,
      final bool hasMore,
      final AppError? error,
      final Map<String, String> typingUsers}) = _$MessagingStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isSending;
  @override
  List<ConversationModel> get conversations;
  @override
  List<ChatSession> get aiSessions;
  @override
  List<MessageModel> get messages;
  @override
  List<UserModel> get searchResults;
  @override
  int get totalUnread;
  @override
  String? get currentConversationId;
  @override
  String? get currentAiSessionId;
  @override
  bool get isAiChat;
  @override
  String? get nextCursor;
  @override
  bool get hasMore;
  @override
  AppError? get error;
  @override
  Map<String, String> get typingUsers;
  @override
  @JsonKey(ignore: true)
  _$$MessagingStateImplCopyWith<_$MessagingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
