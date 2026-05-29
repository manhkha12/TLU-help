import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_checkin.freezed.dart';
part 'room_checkin.g.dart';

@freezed
class RoomCheckinModel with _$RoomCheckinModel {
  const factory RoomCheckinModel({
    required String roomName,
    required double lat,
    required double lng,
    @Default([]) List<String> validWifiBssids, // Mặc định là list rỗng nếu không truyền
  }) = _RoomCheckinModel;

  // Thêm cái này để có thể parse dữ liệu từ API Server trả về
  factory RoomCheckinModel.fromJson(Map<String, dynamic> json) =>
      _$RoomCheckinModelFromJson(json);
}