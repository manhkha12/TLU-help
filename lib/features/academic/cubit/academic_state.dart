import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/models/app_error.dart';
import 'package:tlu_students/models/semester_result.dart'; // Đường dẫn tới model GPA của bạn
import 'package:tlu_students/models/grade_item.dart';     // Đường dẫn tới model Bảng điểm của bạn

part 'academic_state.freezed.dart';

@freezed
class AcademicState with _$AcademicState {
 
  factory AcademicState({
    @Default(false) bool isLoading,
    @Default([]) List<GradeItem> gradeItems,
    @Default([]) List<SemesterResult> semesterResults,
    AppError? error,
  }) = _AcademicState;

  AcademicState._();

}