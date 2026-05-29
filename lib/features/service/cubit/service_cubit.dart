import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/models/app_error.dart';
import 'package:tlu_students/repository/module_repository.dart';
import 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  final ModuleRespository moduleRespository;

  ServiceCubit({required this.moduleRespository}) : super(const ServiceState());

  Future<void> init() async {
    await Future.wait([
      getDocumentTypes(),
      getServiceRequests(),
    ]);
  }

  Future<void> getDocumentTypes() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final documentTypes = await moduleRespository.getDocumentTypes();
      emit(state.copyWith(isLoading: false, documentTypes: documentTypes));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: AppError.data(e.toString()),
      ));
    }
  }

  Future<void> getServiceRequests() async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      final requests = await moduleRespository.getServiceRequests();
      emit(state.copyWith(isLoading: false, requests: requests));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: AppError.data(e.toString()),
      ));
    }
  }

  Future<void> createRequest(dynamic documentTypeId, String? reason, {String? attachmentUrl}) async {
    emit(state.copyWith(isLoading: true, error: null, isSuccess: false));
    try {
      final newRequest = await moduleRespository.createServiceRequest(
        documentTypeId,
        reason,
        attachmentUrl,
      );
      final updatedRequests = [newRequest, ...state.requests];
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        requests: updatedRequests,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: AppError.data(e.toString()),
      ));
    }
  }

  Future<void> updateRequest(dynamic id, dynamic documentTypeId, String? reason, {String? attachmentUrl}) async {
    emit(state.copyWith(isLoading: true, error: null, isSuccess: false));
    try {
      final updatedRequest = await moduleRespository.updateServiceRequest(
        id,
        documentTypeId,
        reason,
        attachmentUrl,
      );
      final updatedRequests = state.requests.map((r) => r.id.toString() == id.toString() ? updatedRequest : r).toList();
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        requests: updatedRequests,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: AppError.data(e.toString()),
      ));
    }
  }

  Future<void> deleteRequest(dynamic id) async {
    emit(state.copyWith(isLoading: true, error: null));
    try {
      await moduleRespository.deleteServiceRequest(id);
      final updatedRequests = state.requests.where((r) => r.id.toString() != id.toString()).toList();
      emit(state.copyWith(isLoading: false, requests: updatedRequests));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: AppError.data(e.toString()),
      ));
    }
  }
}
