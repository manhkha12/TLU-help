// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckInState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isRefreshing => throw _privateConstructorUsedError;
  List<AttendanceRecord> get records =>
      throw _privateConstructorUsedError; // Danh sách records điểm danh
  String? get currentSessionId =>
      throw _privateConstructorUsedError; // Session hiện tại
  AttendanceSession? get activeSession =>
      throw _privateConstructorUsedError; // Thông tin session đang diễn ra
  String? get checkinStatus => throw _privateConstructorUsedError;
  bool? get checkinSuccess => throw _privateConstructorUsedError;
  String? get checkinMessage => throw _privateConstructorUsedError;
  String? get filePath => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  bool get isOccurring => throw _privateConstructorUsedError;
  bool get isAllowed => throw _privateConstructorUsedError;
  String get timingStatusText => throw _privateConstructorUsedError;
  bool get isLocationOk => throw _privateConstructorUsedError;
  double? get gpsDistance => throw _privateConstructorUsedError;
  String get locationStatusText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckInStateCopyWith<CheckInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInStateCopyWith<$Res> {
  factory $CheckInStateCopyWith(
          CheckInState value, $Res Function(CheckInState) then) =
      _$CheckInStateCopyWithImpl<$Res, CheckInState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isRefreshing,
      List<AttendanceRecord> records,
      String? currentSessionId,
      AttendanceSession? activeSession,
      String? checkinStatus,
      bool? checkinSuccess,
      String? checkinMessage,
      String? filePath,
      double? latitude,
      double? longitude,
      bool isOccurring,
      bool isAllowed,
      String timingStatusText,
      bool isLocationOk,
      double? gpsDistance,
      String locationStatusText});

  $AttendanceSessionCopyWith<$Res>? get activeSession;
}

/// @nodoc
class _$CheckInStateCopyWithImpl<$Res, $Val extends CheckInState>
    implements $CheckInStateCopyWith<$Res> {
  _$CheckInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRefreshing = null,
    Object? records = null,
    Object? currentSessionId = freezed,
    Object? activeSession = freezed,
    Object? checkinStatus = freezed,
    Object? checkinSuccess = freezed,
    Object? checkinMessage = freezed,
    Object? filePath = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isOccurring = null,
    Object? isAllowed = null,
    Object? timingStatusText = null,
    Object? isLocationOk = null,
    Object? gpsDistance = freezed,
    Object? locationStatusText = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<AttendanceRecord>,
      currentSessionId: freezed == currentSessionId
          ? _value.currentSessionId
          : currentSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      activeSession: freezed == activeSession
          ? _value.activeSession
          : activeSession // ignore: cast_nullable_to_non_nullable
              as AttendanceSession?,
      checkinStatus: freezed == checkinStatus
          ? _value.checkinStatus
          : checkinStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      checkinSuccess: freezed == checkinSuccess
          ? _value.checkinSuccess
          : checkinSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkinMessage: freezed == checkinMessage
          ? _value.checkinMessage
          : checkinMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isOccurring: null == isOccurring
          ? _value.isOccurring
          : isOccurring // ignore: cast_nullable_to_non_nullable
              as bool,
      isAllowed: null == isAllowed
          ? _value.isAllowed
          : isAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      timingStatusText: null == timingStatusText
          ? _value.timingStatusText
          : timingStatusText // ignore: cast_nullable_to_non_nullable
              as String,
      isLocationOk: null == isLocationOk
          ? _value.isLocationOk
          : isLocationOk // ignore: cast_nullable_to_non_nullable
              as bool,
      gpsDistance: freezed == gpsDistance
          ? _value.gpsDistance
          : gpsDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      locationStatusText: null == locationStatusText
          ? _value.locationStatusText
          : locationStatusText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AttendanceSessionCopyWith<$Res>? get activeSession {
    if (_value.activeSession == null) {
      return null;
    }

    return $AttendanceSessionCopyWith<$Res>(_value.activeSession!, (value) {
      return _then(_value.copyWith(activeSession: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckInStateImplCopyWith<$Res>
    implements $CheckInStateCopyWith<$Res> {
  factory _$$CheckInStateImplCopyWith(
          _$CheckInStateImpl value, $Res Function(_$CheckInStateImpl) then) =
      __$$CheckInStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isRefreshing,
      List<AttendanceRecord> records,
      String? currentSessionId,
      AttendanceSession? activeSession,
      String? checkinStatus,
      bool? checkinSuccess,
      String? checkinMessage,
      String? filePath,
      double? latitude,
      double? longitude,
      bool isOccurring,
      bool isAllowed,
      String timingStatusText,
      bool isLocationOk,
      double? gpsDistance,
      String locationStatusText});

  @override
  $AttendanceSessionCopyWith<$Res>? get activeSession;
}

/// @nodoc
class __$$CheckInStateImplCopyWithImpl<$Res>
    extends _$CheckInStateCopyWithImpl<$Res, _$CheckInStateImpl>
    implements _$$CheckInStateImplCopyWith<$Res> {
  __$$CheckInStateImplCopyWithImpl(
      _$CheckInStateImpl _value, $Res Function(_$CheckInStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isRefreshing = null,
    Object? records = null,
    Object? currentSessionId = freezed,
    Object? activeSession = freezed,
    Object? checkinStatus = freezed,
    Object? checkinSuccess = freezed,
    Object? checkinMessage = freezed,
    Object? filePath = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isOccurring = null,
    Object? isAllowed = null,
    Object? timingStatusText = null,
    Object? isLocationOk = null,
    Object? gpsDistance = freezed,
    Object? locationStatusText = null,
  }) {
    return _then(_$CheckInStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
      records: null == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<AttendanceRecord>,
      currentSessionId: freezed == currentSessionId
          ? _value.currentSessionId
          : currentSessionId // ignore: cast_nullable_to_non_nullable
              as String?,
      activeSession: freezed == activeSession
          ? _value.activeSession
          : activeSession // ignore: cast_nullable_to_non_nullable
              as AttendanceSession?,
      checkinStatus: freezed == checkinStatus
          ? _value.checkinStatus
          : checkinStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      checkinSuccess: freezed == checkinSuccess
          ? _value.checkinSuccess
          : checkinSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      checkinMessage: freezed == checkinMessage
          ? _value.checkinMessage
          : checkinMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: freezed == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isOccurring: null == isOccurring
          ? _value.isOccurring
          : isOccurring // ignore: cast_nullable_to_non_nullable
              as bool,
      isAllowed: null == isAllowed
          ? _value.isAllowed
          : isAllowed // ignore: cast_nullable_to_non_nullable
              as bool,
      timingStatusText: null == timingStatusText
          ? _value.timingStatusText
          : timingStatusText // ignore: cast_nullable_to_non_nullable
              as String,
      isLocationOk: null == isLocationOk
          ? _value.isLocationOk
          : isLocationOk // ignore: cast_nullable_to_non_nullable
              as bool,
      gpsDistance: freezed == gpsDistance
          ? _value.gpsDistance
          : gpsDistance // ignore: cast_nullable_to_non_nullable
              as double?,
      locationStatusText: null == locationStatusText
          ? _value.locationStatusText
          : locationStatusText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckInStateImpl extends _CheckInState {
  _$CheckInStateImpl(
      {this.isLoading = false,
      this.isRefreshing = false,
      final List<AttendanceRecord> records = const [],
      this.currentSessionId,
      this.activeSession,
      this.checkinStatus,
      this.checkinSuccess,
      this.checkinMessage,
      this.filePath,
      this.latitude,
      this.longitude,
      this.isOccurring = false,
      this.isAllowed = false,
      this.timingStatusText = 'checkin.no_class_scheduled',
      this.isLocationOk = false,
      this.gpsDistance,
      this.locationStatusText = 'checkin.checking_permissions'})
      : _records = records,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isRefreshing;
  final List<AttendanceRecord> _records;
  @override
  @JsonKey()
  List<AttendanceRecord> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

// Danh sách records điểm danh
  @override
  final String? currentSessionId;
// Session hiện tại
  @override
  final AttendanceSession? activeSession;
// Thông tin session đang diễn ra
  @override
  final String? checkinStatus;
  @override
  final bool? checkinSuccess;
  @override
  final String? checkinMessage;
  @override
  final String? filePath;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey()
  final bool isOccurring;
  @override
  @JsonKey()
  final bool isAllowed;
  @override
  @JsonKey()
  final String timingStatusText;
  @override
  @JsonKey()
  final bool isLocationOk;
  @override
  final double? gpsDistance;
  @override
  @JsonKey()
  final String locationStatusText;

  @override
  String toString() {
    return 'CheckInState(isLoading: $isLoading, isRefreshing: $isRefreshing, records: $records, currentSessionId: $currentSessionId, activeSession: $activeSession, checkinStatus: $checkinStatus, checkinSuccess: $checkinSuccess, checkinMessage: $checkinMessage, filePath: $filePath, latitude: $latitude, longitude: $longitude, isOccurring: $isOccurring, isAllowed: $isAllowed, timingStatusText: $timingStatusText, isLocationOk: $isLocationOk, gpsDistance: $gpsDistance, locationStatusText: $locationStatusText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            const DeepCollectionEquality().equals(other._records, _records) &&
            (identical(other.currentSessionId, currentSessionId) ||
                other.currentSessionId == currentSessionId) &&
            (identical(other.activeSession, activeSession) ||
                other.activeSession == activeSession) &&
            (identical(other.checkinStatus, checkinStatus) ||
                other.checkinStatus == checkinStatus) &&
            (identical(other.checkinSuccess, checkinSuccess) ||
                other.checkinSuccess == checkinSuccess) &&
            (identical(other.checkinMessage, checkinMessage) ||
                other.checkinMessage == checkinMessage) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isOccurring, isOccurring) ||
                other.isOccurring == isOccurring) &&
            (identical(other.isAllowed, isAllowed) ||
                other.isAllowed == isAllowed) &&
            (identical(other.timingStatusText, timingStatusText) ||
                other.timingStatusText == timingStatusText) &&
            (identical(other.isLocationOk, isLocationOk) ||
                other.isLocationOk == isLocationOk) &&
            (identical(other.gpsDistance, gpsDistance) ||
                other.gpsDistance == gpsDistance) &&
            (identical(other.locationStatusText, locationStatusText) ||
                other.locationStatusText == locationStatusText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isRefreshing,
      const DeepCollectionEquality().hash(_records),
      currentSessionId,
      activeSession,
      checkinStatus,
      checkinSuccess,
      checkinMessage,
      filePath,
      latitude,
      longitude,
      isOccurring,
      isAllowed,
      timingStatusText,
      isLocationOk,
      gpsDistance,
      locationStatusText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInStateImplCopyWith<_$CheckInStateImpl> get copyWith =>
      __$$CheckInStateImplCopyWithImpl<_$CheckInStateImpl>(this, _$identity);
}

abstract class _CheckInState extends CheckInState {
  factory _CheckInState(
      {final bool isLoading,
      final bool isRefreshing,
      final List<AttendanceRecord> records,
      final String? currentSessionId,
      final AttendanceSession? activeSession,
      final String? checkinStatus,
      final bool? checkinSuccess,
      final String? checkinMessage,
      final String? filePath,
      final double? latitude,
      final double? longitude,
      final bool isOccurring,
      final bool isAllowed,
      final String timingStatusText,
      final bool isLocationOk,
      final double? gpsDistance,
      final String locationStatusText}) = _$CheckInStateImpl;
  _CheckInState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isRefreshing;
  @override
  List<AttendanceRecord> get records;
  @override // Danh sách records điểm danh
  String? get currentSessionId;
  @override // Session hiện tại
  AttendanceSession? get activeSession;
  @override // Thông tin session đang diễn ra
  String? get checkinStatus;
  @override
  bool? get checkinSuccess;
  @override
  String? get checkinMessage;
  @override
  String? get filePath;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  bool get isOccurring;
  @override
  bool get isAllowed;
  @override
  String get timingStatusText;
  @override
  bool get isLocationOk;
  @override
  double? get gpsDistance;
  @override
  String get locationStatusText;
  @override
  @JsonKey(ignore: true)
  _$$CheckInStateImplCopyWith<_$CheckInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
