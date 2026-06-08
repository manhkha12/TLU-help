// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentTypeImpl _$$DocumentTypeImplFromJson(Map<String, dynamic> json) =>
    _$DocumentTypeImpl(
      id: json['id'],
      documentName: json['document_name'] as String,
      processingDays: (json['processing_days'] as num).toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$DocumentTypeImplToJson(_$DocumentTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'document_name': instance.documentName,
      'processing_days': instance.processingDays,
      'description': instance.description,
    };
