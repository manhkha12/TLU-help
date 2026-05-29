// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tuition_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TuitionDetailImpl _$$TuitionDetailImplFromJson(Map<String, dynamic> json) =>
    _$TuitionDetailImpl(
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => TuitionSubject.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: TuitionSummary.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TuitionDetailImplToJson(_$TuitionDetailImpl instance) =>
    <String, dynamic>{
      'subjects': instance.subjects,
      'summary': instance.summary,
    };

_$TuitionSubjectImpl _$$TuitionSubjectImplFromJson(Map<String, dynamic> json) =>
    _$TuitionSubjectImpl(
      subjectCode: json['subject_code'] as String,
      subjectName: json['subject_name'] as String,
      credits: (json['credits'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$TuitionSubjectImplToJson(
        _$TuitionSubjectImpl instance) =>
    <String, dynamic>{
      'subject_code': instance.subjectCode,
      'subject_name': instance.subjectName,
      'credits': instance.credits,
      'amount': instance.amount,
    };

_$TuitionSummaryImpl _$$TuitionSummaryImplFromJson(Map<String, dynamic> json) =>
    _$TuitionSummaryImpl(
      totalCredits: (json['total_credits'] as num).toInt(),
      tuitionPerCredit: (json['tuition_per_credit'] as num).toDouble(),
      totalAmount: (json['total_amount'] as num).toDouble(),
      discountAmount: (json['discount_amount'] as num).toDouble(),
      finalAmount: (json['final_amount'] as num).toDouble(),
    );

Map<String, dynamic> _$$TuitionSummaryImplToJson(
        _$TuitionSummaryImpl instance) =>
    <String, dynamic>{
      'total_credits': instance.totalCredits,
      'tuition_per_credit': instance.tuitionPerCredit,
      'total_amount': instance.totalAmount,
      'discount_amount': instance.discountAmount,
      'final_amount': instance.finalAmount,
    };
