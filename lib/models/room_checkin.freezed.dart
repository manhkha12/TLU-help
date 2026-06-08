// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_checkin.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomCheckinModel _$RoomCheckinModelFromJson(Map<String, dynamic> json) {
  return _RoomCheckinModel.fromJson(json);
}

/// @nodoc
mixin _$RoomCheckinModel {
  String get roomName => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;
  List<String> get validWifiBssids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoomCheckinModelCopyWith<RoomCheckinModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomCheckinModelCopyWith<$Res> {
  factory $RoomCheckinModelCopyWith(
          RoomCheckinModel value, $Res Function(RoomCheckinModel) then) =
      _$RoomCheckinModelCopyWithImpl<$Res, RoomCheckinModel>;
  @useResult
  $Res call(
      {String roomName, double lat, double lng, List<String> validWifiBssids});
}

/// @nodoc
class _$RoomCheckinModelCopyWithImpl<$Res, $Val extends RoomCheckinModel>
    implements $RoomCheckinModelCopyWith<$Res> {
  _$RoomCheckinModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomName = null,
    Object? lat = null,
    Object? lng = null,
    Object? validWifiBssids = null,
  }) {
    return _then(_value.copyWith(
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      validWifiBssids: null == validWifiBssids
          ? _value.validWifiBssids
          : validWifiBssids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomCheckinModelImplCopyWith<$Res>
    implements $RoomCheckinModelCopyWith<$Res> {
  factory _$$RoomCheckinModelImplCopyWith(_$RoomCheckinModelImpl value,
          $Res Function(_$RoomCheckinModelImpl) then) =
      __$$RoomCheckinModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String roomName, double lat, double lng, List<String> validWifiBssids});
}

/// @nodoc
class __$$RoomCheckinModelImplCopyWithImpl<$Res>
    extends _$RoomCheckinModelCopyWithImpl<$Res, _$RoomCheckinModelImpl>
    implements _$$RoomCheckinModelImplCopyWith<$Res> {
  __$$RoomCheckinModelImplCopyWithImpl(_$RoomCheckinModelImpl _value,
      $Res Function(_$RoomCheckinModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomName = null,
    Object? lat = null,
    Object? lng = null,
    Object? validWifiBssids = null,
  }) {
    return _then(_$RoomCheckinModelImpl(
      roomName: null == roomName
          ? _value.roomName
          : roomName // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      validWifiBssids: null == validWifiBssids
          ? _value._validWifiBssids
          : validWifiBssids // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomCheckinModelImpl implements _RoomCheckinModel {
  const _$RoomCheckinModelImpl(
      {required this.roomName,
      required this.lat,
      required this.lng,
      final List<String> validWifiBssids = const []})
      : _validWifiBssids = validWifiBssids;

  factory _$RoomCheckinModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomCheckinModelImplFromJson(json);

  @override
  final String roomName;
  @override
  final double lat;
  @override
  final double lng;
  final List<String> _validWifiBssids;
  @override
  @JsonKey()
  List<String> get validWifiBssids {
    if (_validWifiBssids is EqualUnmodifiableListView) return _validWifiBssids;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validWifiBssids);
  }

  @override
  String toString() {
    return 'RoomCheckinModel(roomName: $roomName, lat: $lat, lng: $lng, validWifiBssids: $validWifiBssids)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomCheckinModelImpl &&
            (identical(other.roomName, roomName) ||
                other.roomName == roomName) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            const DeepCollectionEquality()
                .equals(other._validWifiBssids, _validWifiBssids));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, roomName, lat, lng,
      const DeepCollectionEquality().hash(_validWifiBssids));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomCheckinModelImplCopyWith<_$RoomCheckinModelImpl> get copyWith =>
      __$$RoomCheckinModelImplCopyWithImpl<_$RoomCheckinModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomCheckinModelImplToJson(
      this,
    );
  }
}

abstract class _RoomCheckinModel implements RoomCheckinModel {
  const factory _RoomCheckinModel(
      {required final String roomName,
      required final double lat,
      required final double lng,
      final List<String> validWifiBssids}) = _$RoomCheckinModelImpl;

  factory _RoomCheckinModel.fromJson(Map<String, dynamic> json) =
      _$RoomCheckinModelImpl.fromJson;

  @override
  String get roomName;
  @override
  double get lat;
  @override
  double get lng;
  @override
  List<String> get validWifiBssids;
  @override
  @JsonKey(ignore: true)
  _$$RoomCheckinModelImplCopyWith<_$RoomCheckinModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
