import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/models/course_response.dart';

part 'calender_state.freezed.dart';
@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default([]) List<CourseData> courses,
    String? errorMessage,
  }) = _CalendarState;
}