// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tuition_fee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TuitionFee _$TuitionFeeFromJson(Map<String, dynamic> json) {
  return _TuitionFee.fromJson(json);
}

/// @nodoc
mixin _$TuitionFee {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_amount')
  double get totalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_amount')
  double get discountAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_amount')
  double get finalAmount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_status')
  String? get paymentStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'deadline')
  DateTime? get deadline => throw _privateConstructorUsedError;
  Semester get semester => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TuitionFeeCopyWith<TuitionFee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TuitionFeeCopyWith<$Res> {
  factory $TuitionFeeCopyWith(
          TuitionFee value, $Res Function(TuitionFee) then) =
      _$TuitionFeeCopyWithImpl<$Res, TuitionFee>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'discount_amount') double discountAmount,
      @JsonKey(name: 'final_amount') double finalAmount,
      String status,
      @JsonKey(name: 'payment_status') String? paymentStatus,
      @JsonKey(name: 'deadline') DateTime? deadline,
      Semester semester});

  $SemesterCopyWith<$Res> get semester;
}

/// @nodoc
class _$TuitionFeeCopyWithImpl<$Res, $Val extends TuitionFee>
    implements $TuitionFeeCopyWith<$Res> {
  _$TuitionFeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalAmount = null,
    Object? discountAmount = null,
    Object? finalAmount = null,
    Object? status = null,
    Object? paymentStatus = freezed,
    Object? deadline = freezed,
    Object? semester = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as Semester,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SemesterCopyWith<$Res> get semester {
    return $SemesterCopyWith<$Res>(_value.semester, (value) {
      return _then(_value.copyWith(semester: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TuitionFeeImplCopyWith<$Res>
    implements $TuitionFeeCopyWith<$Res> {
  factory _$$TuitionFeeImplCopyWith(
          _$TuitionFeeImpl value, $Res Function(_$TuitionFeeImpl) then) =
      __$$TuitionFeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'discount_amount') double discountAmount,
      @JsonKey(name: 'final_amount') double finalAmount,
      String status,
      @JsonKey(name: 'payment_status') String? paymentStatus,
      @JsonKey(name: 'deadline') DateTime? deadline,
      Semester semester});

  @override
  $SemesterCopyWith<$Res> get semester;
}

/// @nodoc
class __$$TuitionFeeImplCopyWithImpl<$Res>
    extends _$TuitionFeeCopyWithImpl<$Res, _$TuitionFeeImpl>
    implements _$$TuitionFeeImplCopyWith<$Res> {
  __$$TuitionFeeImplCopyWithImpl(
      _$TuitionFeeImpl _value, $Res Function(_$TuitionFeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? totalAmount = null,
    Object? discountAmount = null,
    Object? finalAmount = null,
    Object? status = null,
    Object? paymentStatus = freezed,
    Object? deadline = freezed,
    Object? semester = null,
  }) {
    return _then(_$TuitionFeeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentStatus: freezed == paymentStatus
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      semester: null == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as Semester,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TuitionFeeImpl implements _TuitionFee {
  const _$TuitionFeeImpl(
      {required this.id,
      @JsonKey(name: 'total_amount') required this.totalAmount,
      @JsonKey(name: 'discount_amount') required this.discountAmount,
      @JsonKey(name: 'final_amount') required this.finalAmount,
      required this.status,
      @JsonKey(name: 'payment_status') this.paymentStatus,
      @JsonKey(name: 'deadline') this.deadline,
      required this.semester});

  factory _$TuitionFeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TuitionFeeImplFromJson(json);

  @override
  final String id;
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
  final String status;
  @override
  @JsonKey(name: 'payment_status')
  final String? paymentStatus;
  @override
  @JsonKey(name: 'deadline')
  final DateTime? deadline;
  @override
  final Semester semester;

  @override
  String toString() {
    return 'TuitionFee(id: $id, totalAmount: $totalAmount, discountAmount: $discountAmount, finalAmount: $finalAmount, status: $status, paymentStatus: $paymentStatus, deadline: $deadline, semester: $semester)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TuitionFeeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.finalAmount, finalAmount) ||
                other.finalAmount == finalAmount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.semester, semester) ||
                other.semester == semester));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, totalAmount, discountAmount,
      finalAmount, status, paymentStatus, deadline, semester);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TuitionFeeImplCopyWith<_$TuitionFeeImpl> get copyWith =>
      __$$TuitionFeeImplCopyWithImpl<_$TuitionFeeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TuitionFeeImplToJson(
      this,
    );
  }
}

abstract class _TuitionFee implements TuitionFee {
  const factory _TuitionFee(
      {required final String id,
      @JsonKey(name: 'total_amount') required final double totalAmount,
      @JsonKey(name: 'discount_amount') required final double discountAmount,
      @JsonKey(name: 'final_amount') required final double finalAmount,
      required final String status,
      @JsonKey(name: 'payment_status') final String? paymentStatus,
      @JsonKey(name: 'deadline') final DateTime? deadline,
      required final Semester semester}) = _$TuitionFeeImpl;

  factory _TuitionFee.fromJson(Map<String, dynamic> json) =
      _$TuitionFeeImpl.fromJson;

  @override
  String get id;
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
  String get status;
  @override
  @JsonKey(name: 'payment_status')
  String? get paymentStatus;
  @override
  @JsonKey(name: 'deadline')
  DateTime? get deadline;
  @override
  Semester get semester;
  @override
  @JsonKey(ignore: true)
  _$$TuitionFeeImplCopyWith<_$TuitionFeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
