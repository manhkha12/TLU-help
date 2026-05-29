import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/repository/module_repository.dart';
import 'finance_state.dart';

class FinanceCubit extends Cubit<FinanceState> {
  final ModuleRespository _repository;

  FinanceCubit(this._repository) : super(const FinanceState.initial());

  Future<void> getTuitionFees() async {
    try {
      emit(const FinanceState.loading());
      final fees = await _repository.getTuitionFees();
      emit(FinanceState.loaded(tuitionFees: fees));
    } catch (e) {
      emit(FinanceState.error(e.toString()));
    }
  }

  Future<void> getTuitionDetail(String semesterId) async {
    try {
      emit(const FinanceState.loading());
      final detail = await _repository.getTuitionDetail(semesterId);
      emit(FinanceState.detailLoaded(detail: detail));
    } catch (e) {
      emit(FinanceState.error(e.toString()));
    }
  }

  Future<void> payTuition(String tuitionFeeId) async {
    try {
      emit(const FinanceState.loading());
      final url = await _repository.payTuition(tuitionFeeId);
      emit(FinanceState.paymentLinkReady(paymentUrl: url));
    } catch (e) {
      emit(FinanceState.error(e.toString()));
    }
  }
}
