// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceRequestImpl _$$ServiceRequestImplFromJson(Map<String, dynamic> json) =>
    _$ServiceRequestImpl(
      id: json['id'],
      documentTypeId: json['document_type_id'],
      userId: json['user_id'],
      documentType: json['documentType'] == null
          ? null
          : DocumentType.fromJson(json['documentType'] as Map<String, dynamic>),
      reason: json['reason'] as String?,
      attachmentUrl: json['attachment_url'] as String?,
      status: $enumDecode(_$ServiceRequestStatusEnumMap, json['status']),
      rejectionReason: json['rejection_reason'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$ServiceRequestImplToJson(
        _$ServiceRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'document_type_id': instance.documentTypeId,
      'user_id': instance.userId,
      'documentType': instance.documentType,
      'reason': instance.reason,
      'attachment_url': instance.attachmentUrl,
      'status': _$ServiceRequestStatusEnumMap[instance.status]!,
      'rejection_reason': instance.rejectionReason,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$ServiceRequestStatusEnumMap = {
  ServiceRequestStatus.pending: 1,
  ServiceRequestStatus.processing: 2,
  ServiceRequestStatus.completed: 3,
  ServiceRequestStatus.rejected: 4,
  ServiceRequestStatus.cancelled: 5,
};
