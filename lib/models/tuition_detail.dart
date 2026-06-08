import 'package:freezed_annotation/freezed_annotation.dart';

part 'tuition_detail.freezed.dart';
part 'tuition_detail.g.dart';

@freezed
class TuitionDetail with _$TuitionDetail {
  const factory TuitionDetail({
    required List<TuitionSubject> subjects,
    required TuitionSummary summary,
  }) = _TuitionDetail;

  factory TuitionDetail.fromJson(Map<String, dynamic> json) =>
      _$TuitionDetailFromJson(json);
}

@freezed
class TuitionSubject with _$TuitionSubject {
  const factory TuitionSubject({
    @JsonKey(name: 'subject_code') required String subjectCode,
    @JsonKey(name: 'subject_name') required String subjectName,
    required int credits,
    required double amount,
  }) = _TuitionSubject;

  factory TuitionSubject.fromJson(Map<String, dynamic> json) =>
      _$TuitionSubjectFromJson(json);
}

@freezed
class TuitionSummary with _$TuitionSummary {
  const factory TuitionSummary({
    @JsonKey(name: 'total_credits') required int totalCredits,
    @JsonKey(name: 'tuition_per_credit') required double tuitionPerCredit,
    @JsonKey(name: 'total_amount') required double totalAmount,
    @JsonKey(name: 'discount_amount') required double discountAmount,
    @JsonKey(name: 'final_amount') required double finalAmount,
  }) = _TuitionSummary;

  factory TuitionSummary.fromJson(Map<String, dynamic> json) =>
      _$TuitionSummaryFromJson(json);
}
