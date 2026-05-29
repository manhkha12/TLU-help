import 'package:freezed_annotation/freezed_annotation.dart';
import 'document_type.dart';

part 'service_request.freezed.dart';
part 'service_request.g.dart';

enum ServiceRequestStatus {
  @JsonValue(1)
  pending,
  @JsonValue(2)
  processing,
  @JsonValue(3)
  completed,
  @JsonValue(4)
  rejected,
  @JsonValue(5)
  cancelled,
}

@freezed
class ServiceRequest with _$ServiceRequest {
  const factory ServiceRequest({
    required dynamic id,
    @JsonKey(name: 'document_type_id') required dynamic documentTypeId,
    @JsonKey(name: 'user_id') dynamic? userId,
    DocumentType? documentType,
    String? reason,
    @JsonKey(name: 'attachment_url') String? attachmentUrl,
    required ServiceRequestStatus status,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _ServiceRequest;

  factory ServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestFromJson(json);

  static ServiceRequest fromJsonCustom(Map<String, dynamic> json) {
    final docType = json['documentType'] ?? json['document_type'];
    final Map<String, dynamic> normalizedJson = Map<String, dynamic>.from(json);
    if (docType != null) {
      normalizedJson['documentType'] = docType;
    } else if (json['document_name'] != null) {
      normalizedJson['documentType'] = {
        'id': json['document_type_id'],
        'document_name': json['document_name'],
        'processing_days': json['processing_days'] ?? 0,
      };
    }
    return ServiceRequest.fromJson(normalizedJson);
  }
}
