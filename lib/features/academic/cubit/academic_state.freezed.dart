// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'academic_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AcademicState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<GradeItem> get gradeItems => throw _privateConstructorUsedError;
  List<SemesterResult> get semesterResults =>
      throw _privateConstructorUsedError;
  AppError? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AcademicStateCopyWith<AcademicState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AcademicStateCopyWith<$Res> {
  factory $AcademicStateCopyWith(
          AcademicState value, $Res Function(AcademicState) then) =
      _$AcademicStateCopyWithImpl<$Res, AcademicState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<GradeItem> gradeItems,
      List<SemesterResult> semesterResults,
      AppError? error});

  $AppErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$AcademicStateCopyWithImpl<$Res, $Val extends AcademicState>
    implements $AcademicStateCopyWith<$Res> {
  _$AcademicStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? gradeItems = null,
    Object? semesterResults = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      gradeItems: null == gradeItems
          ? _value.gradeItems
          : gradeItems // ignore: cast_nullable_to_non_nullable
              as List<GradeItem>,
      semesterResults: null == semesterResults
          ? _value.semesterResults
          : semesterResults // ignore: cast_nullable_to_non_nullable
              as List<SemesterResult>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppErrorCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $AppErrorCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AcademicStateImplCopyWith<$Res>
    implements $AcademicStateCopyWith<$Res> {
  factory _$$AcademicStateImplCopyWith(
          _$AcademicStateImpl value, $Res Function(_$AcademicStateImpl) then) =
      __$$AcademicStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<GradeItem> gradeItems,
      List<SemesterResult> semesterResults,
      AppError? error});

  @override
  $AppErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$AcademicStateImplCopyWithImpl<$Res>
    extends _$AcademicStateCopyWithImpl<$Res, _$AcademicStateImpl>
    implements _$$AcademicStateImplCopyWith<$Res> {
  __$$AcademicStateImplCopyWithImpl(
      _$AcademicStateImpl _value, $Res Function(_$AcademicStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? gradeItems = null,
    Object? semesterResults = null,
    Object? error = freezed,
  }) {
    return _then(_$AcademicStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      gradeItems: null == gradeItems
          ? _value._gradeItems
          : gradeItems // ignore: cast_nullable_to_non_nullable
              as List<GradeItem>,
      semesterResults: null == semesterResults
          ? _value._semesterResults
          : semesterResults // ignore: cast_nullable_to_non_nullable
              as List<SemesterResult>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError?,
    ));
  }
}

/// @nodoc

class _$AcademicStateImpl extends _AcademicState {
  _$AcademicStateImpl(
      {this.isLoading = false,
      final List<GradeItem> gradeItems = const [],
      final List<SemesterResult> semesterResults = const [],
      this.error})
      : _gradeItems = gradeItems,
        _semesterResults = semesterResults,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<GradeItem> _gradeItems;
  @override
  @JsonKey()
  List<GradeItem> get gradeItems {
    if (_gradeItems is EqualUnmodifiableListView) return _gradeItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gradeItems);
  }

  final List<SemesterResult> _semesterResults;
  @override
  @JsonKey()
  List<SemesterResult> get semesterResults {
    if (_semesterResults is EqualUnmodifiableListView) return _semesterResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_semesterResults);
  }

  @override
  final AppError? error;

  @override
  String toString() {
    return 'AcademicState(isLoading: $isLoading, gradeItems: $gradeItems, semesterResults: $semesterResults, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AcademicStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._gradeItems, _gradeItems) &&
            const DeepCollectionEquality()
                .equals(other._semesterResults, _semesterResults) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_gradeItems),
      const DeepCollectionEquality().hash(_semesterResults),
      error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AcademicStateImplCopyWith<_$AcademicStateImpl> get copyWith =>
      __$$AcademicStateImplCopyWithImpl<_$AcademicStateImpl>(this, _$identity);
}

abstract class _AcademicState extends AcademicState {
  factory _AcademicState(
      {final bool isLoading,
      final List<GradeItem> gradeItems,
      final List<SemesterResult> semesterResults,
      final AppError? error}) = _$AcademicStateImpl;
  _AcademicState._() : super._();

  @override
  bool get isLoading;
  @override
  List<GradeItem> get gradeItems;
  @override
  List<SemesterResult> get semesterResults;
  @override
  AppError? get error;
  @override
  @JsonKey(ignore: true)
  _$$AcademicStateImplCopyWith<_$AcademicStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
