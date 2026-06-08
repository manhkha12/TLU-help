// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_checkin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomCheckinModelImpl _$$RoomCheckinModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RoomCheckinModelImpl(
      roomName: json['roomName'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      validWifiBssids: (json['validWifiBssids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$RoomCheckinModelImplToJson(
        _$RoomCheckinModelImpl instance) =>
    <String, dynamic>{
      'roomName': instance.roomName,
      'lat': instance.lat,
      'lng': instance.lng,
      'validWifiBssids': instance.validWifiBssids,
    };
