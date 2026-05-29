import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/models/semester.dart';

part 'semester_state.freezed.dart';

@freezed
class SemesterState with _$SemesterState {
  const factory SemesterState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default([]) List<Semester> semesters,
    String? errorMessage,
  }) = _SemesterState;
}