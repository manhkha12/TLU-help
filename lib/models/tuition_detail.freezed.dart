// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tuition_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TuitionDetail _$TuitionDetailFromJson(Map<String, dynamic> json) {
  return _TuitionDetail.fromJson(json);
}

/// @nodoc
mixin _$TuitionDetail {
  List<TuitionSubject> get subjects => throw _privateConstructorUsedError;
  TuitionSummary get summary => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TuitionDetailCopyWith<TuitionDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TuitionDetailCopyWith<$Res> {
  factory $TuitionDetailCopyWith(
          TuitionDetail value, $Res Function(TuitionDetail) then) =
      _$TuitionDetailCopyWithImpl<$Res, TuitionDetail>;
  @useResult
  $Res call({List<TuitionSubject> subjects, TuitionSummary summary});

  $TuitionSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$TuitionDetailCopyWithImpl<$Res, $Val extends TuitionDetail>
    implements $TuitionDetailCopyWith<$Res> {
  _$TuitionDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjects = null,
    Object? summary = null,
  }) {
    return _then(_value.copyWith(
      subjects: null == subjects
          ? _value.subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<TuitionSubject>,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as TuitionSummary,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TuitionSummaryCopyWith<$Res> get summary {
    return $TuitionSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TuitionDetailImplCopyWith<$Res>
    implements $TuitionDetailCopyWith<$Res> {
  factory _$$TuitionDetailImplCopyWith(
          _$TuitionDetailImpl value, $Res Function(_$TuitionDetailImpl) then) =
      __$$TuitionDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TuitionSubject> subjects, TuitionSummary summary});

  @override
  $TuitionSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$TuitionDetailImplCopyWithImpl<$Res>
    extends _$TuitionDetailCopyWithImpl<$Res, _$TuitionDetailImpl>
    implements _$$TuitionDetailImplCopyWith<$Res> {
  __$$TuitionDetailImplCopyWithImpl(
      _$TuitionDetailImpl _value, $Res Function(_$TuitionDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjects = null,
    Object? summary = null,
  }) {
    return _then(_$TuitionDetailImpl(
      subjects: null == subjects
          ? _value._subjects
          : subjects // ignore: cast_nullable_to_non_nullable
              as List<TuitionSubject>,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as TuitionSummary,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TuitionDetailImpl implements _TuitionDetail {
  const _$TuitionDetailImpl(
      {required final List<TuitionSubject> subjects, required this.summary})
      : _subjects = subjects;

  factory _$TuitionDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$TuitionDetailImplFromJson(json);

  final List<TuitionSubject> _subjects;
  @override
  List<TuitionSubject> get subjects {
    if (_subjects is EqualUnmodifiableListView) return _subjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subjects);
  }

  @override
  final TuitionSummary summary;

  @override
  String toString() {
    return 'TuitionDetail(subjects: $subjects, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TuitionDetailImpl &&
            const DeepCollectionEquality().equals(other._subjects, _subjects) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_subjects), summary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TuitionDetailImplCopyWith<_$TuitionDetailImpl> get copyWith =>
      __$$TuitionDetailImplCopyWithImpl<_$TuitionDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TuitionDetailImplToJson(
      this,
    );
  }
}

abstract class _TuitionDetail implements TuitionDetail {
  const factory _TuitionDetail(
      {required final List<TuitionSubject> subjects,
      required final TuitionSummary summary}) = _$TuitionDetailImpl;

  factory _TuitionDetail.fromJson(Map<String, dynamic> json) =
      _$TuitionDetailImpl.fromJson;

  @override
  List<TuitionSubject> get subjects;
  @override
  TuitionSummary get summary;
  @override
  @JsonKey(ignore: true)
  _$$TuitionDetailImplCopyWith<_$TuitionDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TuitionSubject _$TuitionSubjectFromJson(Map<String, dynamic> json) {
  return _TuitionSubject.fromJson(json);
}

/// @nodoc
mixin _$TuitionSubject {
  @JsonKey(name: 'subject_code')
  String get subjectCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'subject_name')
  String get subjectName => throw _privateConstructorUsedError;
  int get credits => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TuitionSubjectCopyWith<TuitionSubject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TuitionSubjectCopyWith<$Res> {
  factory $TuitionSubjectCopyWith(
          TuitionSubject value, $Res Function(TuitionSubject) then) =
      _$TuitionSubjectCopyWithImpl<$Res, TuitionSubject>;
  @useResult
  $Res call(
      {@JsonKey(name: 'subject_code') String subjectCode,
      @JsonKey(name: 'subject_name') String subjectName,
      int credits,
      double amount});
}

/// @nodoc
class _$TuitionSubjectCopyWithImpl<$Res, $Val extends TuitionSubject>
    implements $TuitionSubjectCopyWith<$Res> {
  _$TuitionSubjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectCode = null,
    Object? subjectName = null,
    Object? credits = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      subjectCode: null == subjectCode
          ? _value.subjectCode
          : subjectCode // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TuitionSubjectImplCopyWith<$Res>
    implements $TuitionSubjectCopyWith<$Res> {
  factory _$$TuitionSubjectImplCopyWith(_$TuitionSubjectImpl value,
          $Res Function(_$TuitionSubjectImpl) then) =
      __$$TuitionSubjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'subject_code') String subjectCode,
      @JsonKey(name: 'subject_name') String subjectName,
      int credits,
      double amount});
}

/// @nodoc
class __$$TuitionSubjectImplCopyWithImpl<$Res>
    extends _$TuitionSubjectCopyWithImpl<$Res, _$TuitionSubjectImpl>
    implements _$$TuitionSubjectImplCopyWith<$Res> {
  __$$TuitionSubjectImplCopyWithImpl(
      _$TuitionSubjectImpl _value, $Res Function(_$TuitionSubjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subjectCode = null,
    Object? subjectName = null,
    Object? credits = null,
    Object? amount = null,
  }) {
    return _then(_$TuitionSubjectImpl(
      subjectCode: null == subjectCode
          ? _value.subjectCode
          : subjectCode // ignore: cast_nullable_to_non_nullable
              as String,
      subjectName: null == subjectName
          ? _value.subjectName
          : subjectName // ignore: cast_nullable_to_non_nullable
              as String,
      credits: null == credits
          ? _value.credits
          : credits // ignore: cast_nullable_to_non_nullable
              as int,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TuitionSubjectImpl implements _TuitionSubject {
  const _$TuitionSubjectImpl(
      {@JsonKey(name: 'subject_code') required this.subjectCode,
      @JsonKey(name: 'subject_name') required this.subjectName,
      required this.credits,
      required this.amount});

  factory _$TuitionSubjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$TuitionSubjectImplFromJson(json);

  @override
  @JsonKey(name: 'subject_code')
  final String subjectCode;
  @override
  @JsonKey(name: 'subject_name')
  final String subjectName;
  @override
  final int credits;
  @override
  final double amount;

  @override
  String toString() {
    return 'TuitionSubject(subjectCode: $subjectCode, subjectName: $subjectName, credits: $credits, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TuitionSubjectImpl &&
            (identical(other.subjectCode, subjectCode) ||
                other.subjectCode == subjectCode) &&
            (identical(other.subjectName, subjectName) ||
                other.subjectName == subjectName) &&
            (identical(other.credits, credits) || other.credits == credits) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, subjectCode, subjectName, credits, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TuitionSubjectImplCopyWith<_$TuitionSubjectImpl> get copyWith =>
      __$$TuitionSubjectImplCopyWithImpl<_$TuitionSubjectImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TuitionSubjectImplToJson(
      this,
    );
  }
}

abstract class _TuitionSubject implements TuitionSubject {
  const factory _TuitionSubject(
      {@JsonKey(name: 'subject_code') required final String subjectCode,
      @JsonKey(name: 'subject_name') required final String subjectName,
      required final int credits,
      required final double amount}) = _$TuitionSubjectImpl;

  factory _TuitionSubject.fromJson(Map<String, dynamic> json) =
      _$TuitionSubjectImpl.fromJson;

  @override
  @JsonKey(name: 'subject_code')
  String get subjectCode;
  @override
  @JsonKey(name: 'subject_name')
  String get subjectName;
  @override
  int get credits;
  @override
  double get amount;
  @override
  @JsonKey(ignore: true)
  _$$TuitionSubjectImplCopyWith<_$TuitionSubjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TuitionSummary _$TuitionSummaryFromJson(Map<String, dynamic> json) {
  return _TuitionSummary.fromJson(json);
}

/// @nodoc
mixin _$TuitionSummary {
  @JsonKey(name: 'total_credits')
  int get totalCredits => throw _privateConstructorUsedError;
  @JsonKey(name: 'tuition_per_credit')
  double get tuitionPerCredit => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_amount')
  double get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_amount')
  double get finalAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TuitionSummaryCopyWith<TuitionSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TuitionSummaryCopyWith<$Res> {
  factory $TuitionSummaryCopyWith(
          TuitionSummary value, $Res Function(TuitionSummary) then) =
      _$TuitionSummaryCopyWithImpl<$Res, TuitionSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_credits') int totalCredits,
      @JsonKey(name: 'tuition_per_credit') double tuitionPerCredit,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'discount_amount') double discountAmount,
      @JsonKey(name: 'final_amount') double finalAmount});
}

/// @nodoc
class _$TuitionSummaryCopyWithImpl<$Res, $Val extends TuitionSummary>
    implements $TuitionSummaryCopyWith<$Res> {
  _$TuitionSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCredits = null,
    Object? tuitionPerCredit = null,
    Object? totalAmount = null,
    Object? discountAmount = null,
    Object? finalAmount = null,
  }) {
    return _then(_value.copyWith(
      totalCredits: null == totalCredits
          ? _value.totalCredits
          : totalCredits // ignore: cast_nullable_to_non_nullable
              as int,
      tuitionPerCredit: null == tuitionPerCredit
          ? _value.tuitionPerCredit
          : tuitionPerCredit // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      finalAmount: null == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TuitionSummaryImplCopyWith<$Res>
    implements $TuitionSummaryCopyWith<$Res> {
  factory _$$TuitionSummaryImplCopyWith(_$TuitionSummaryImpl value,
          $Res Function(_$TuitionSummaryImpl) then) =
      __$$TuitionSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_credits') int totalCredits,
      @JsonKey(name: 'tuition_per_credit') double tuitionPerCredit,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'discount_amount') double discountAmount,
      @JsonKey(name: 'final_amount') double finalAmount});
}

/// @nodoc
class __$$TuitionSummaryImplCopyWithImpl<$Res>
    extends _$TuitionSummaryCopyWithImpl<$Res, _$TuitionSummaryImpl>
    implements _$$TuitionSummaryImplCopyWith<$Res> {
  __$$TuitionSummaryImplCopyWithImpl(
      _$TuitionSummaryImpl _value, $Res Function(_$TuitionSummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCredits = null,
    Object? tuitionPerCredit = null,
    Object? totalAmount = null,
    Object? discountAmount = null,
    Object? finalAmount = null,
  }) {
    return _then(_$TuitionSummaryImpl(
      totalCredits: null == totalCredits
          ? _value.totalCredits
          : totalCredits // ignore: cast_nullable_to_non_nullable
              as int,
      tuitionPerCredit: null == tuitionPerCredit
          ? _value.tuitionPerCredit
          : tuitionPerCredit // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      finalAmount: null == finalAmount
          ? _value.finalAmount
          : finalAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TuitionSummaryImpl implements _TuitionSummary {
  const _$TuitionSummaryImpl(
      {@JsonKey(name: 'total_credits') required this.totalCredits,
      @JsonKey(name: 'tuition_per_credit') required this.tuitionPerCredit,
      @JsonKey(name: 'total_amount') required this.totalAmount,
      @JsonKey(name: 'discount_amount') required this.discountAmount,
      @JsonKey(name: 'final_amount') required this.finalAmount});

  factory _$TuitionSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TuitionSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'total_credits')
  final int totalCredits;
  @override
  @JsonKey(name: 'tuition_per_credit')
  final double tuitionPerCredit;
  @override
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @override
  @JsonKey(name: 'discount_amount')
  final double discountAmount;
  @override
  @JsonKey(name: 'final_amount')
  final double finalAmount;

  @override
  String toString() {
    return 'TuitionSummary(totalCredits: $totalCredits, tuitionPerCredit: $tuitionPerCredit, totalAmount: $totalAmount, discountAmount: $discountAmount, finalAmount: $finalAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TuitionSummaryImpl &&
            (identical(other.totalCredits, totalCredits) ||
                other.totalCredits == totalCredits) &&
            (identical(other.tuitionPerCredit, tuitionPerCredit) ||
                other.tuitionPerCredit == tuitionPerCredit) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalCredits, tuitionPerCredit,
      totalAmount, discountAmount, finalAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TuitionSummaryImplCopyWith<_$TuitionSummaryImpl> get copyWith =>
      __$$TuitionSummaryImplCopyWithImpl<_$TuitionSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TuitionSummaryImplToJson(
      this,
    );
  }
}

abstract class _TuitionSummary implements TuitionSummary {
  const factory _TuitionSummary(
      {@JsonKey(name: 'total_credits') required final int totalCredits,
      @JsonKey(name: 'tuition_per_credit')
      required final double tuitionPerCredit,
      @JsonKey(name: 'total_amount') required final double totalAmount,
      @JsonKey(name: 'discount_amount') required final double discountAmount,
      @JsonKey(name: 'final_amount')
      required final double finalAmount}) = _$TuitionSummaryImpl;

  factory _TuitionSummary.fromJson(Map<String, dynamic> json) =
      _$TuitionSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'total_credits')
  int get totalCredits;
  @override
  @JsonKey(name: 'tuition_per_credit')
  double get tuitionPerCredit;
  @override
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @override
  @JsonKey(name: 'discount_amount')
  double get discountAmount;
  @override
  @JsonKey(name: 'final_amount')
  double get finalAmount;
  @override
  @JsonKey(ignore: true)
  _$$TuitionSummaryImplCopyWith<_$TuitionSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
