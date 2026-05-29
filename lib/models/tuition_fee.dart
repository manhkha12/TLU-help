import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/models/semester.dart';

part 'tuition_fee.freezed.dart';
part 'tuition_fee.g.dart';

@freezed
class TuitionFee with _$TuitionFee {
  const factory TuitionFee({
    required String id,
    @JsonKey(name: 'total_amount') required double totalAmount,
    @JsonKey(name: 'discount_amount') required double discountAmount,
    @JsonKey(name: 'final_amount') required double finalAmount,
    required String status,
    @JsonKey(name: 'payment_status') String? paymentStatus,
    @JsonKey(name: 'deadline') DateTime? deadline,
    required Semester semester,
  }) = _TuitionFee;

  factory TuitionFee.fromJson(Map<String, dynamic> json) =>
      _$TuitionFeeFromJson(json);
}
