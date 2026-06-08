import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../models/app_error.dart';
import '../../../models/document_type.dart';
import '../../../models/service_request.dart';

part 'service_state.freezed.dart';

@freezed
class ServiceState with _$ServiceState {
  const factory ServiceState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default([]) List<ServiceRequest> requests,
    @Default([]) List<DocumentType> documentTypes,
    AppError? error,
  }) = _ServiceState;
}
