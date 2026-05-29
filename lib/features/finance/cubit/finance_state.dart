import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/models/tuition_fee.dart';
import 'package:tlu_students/models/tuition_detail.dart';

part 'finance_state.freezed.dart';

@freezed
class FinanceState with _$FinanceState {
  const factory FinanceState.initial() = _Initial;
  const factory FinanceState.loading() = _Loading;
  const factory FinanceState.loaded({
    required List<TuitionFee> tuitionFees,
  }) = _Loaded;
  const factory FinanceState.detailLoaded({
    required TuitionDetail detail,
  }) = _DetailLoaded;
  const factory FinanceState.paymentLinkReady({
    required String paymentUrl,
  }) = _PaymentLinkReady;
  const factory FinanceState.error(String message) = _Error;
}
