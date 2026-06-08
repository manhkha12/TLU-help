// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tuition_fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TuitionFeeImpl _$$TuitionFeeImplFromJson(Map<String, dynamic> json) =>
    _$TuitionFeeImpl(
      id: json['id'] as String,
      totalAmount: (json['total_amount'] as num).toDouble(),
      discountAmount: (json['discount_amount'] as num).toDouble(),
      finalAmount: (json['final_amount'] as num).toDouble(),
      status: json['status'] as String,
      paymentStatus: json['payment_status'] as String?,
      deadline: json['deadline'] == null
          ? null
          : DateTime.parse(json['deadline'] as String),
      semester: Semester.fromJson(json['semester'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TuitionFeeImplToJson(_$TuitionFeeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total_amount': instance.totalAmount,
      'discount_amount': instance.discountAmount,
      'final_amount': instance.finalAmount,
      'status': instance.status,
      'payment_status': instance.paymentStatus,
      'deadline': instance.deadline?.toIso8601String(),
      'semester': instance.semester,
    };
