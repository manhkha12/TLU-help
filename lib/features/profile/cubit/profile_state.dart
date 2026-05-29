import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/models/app_error.dart';
import 'package:tlu_students/models/student.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    Student? student,
    AppError? error,
  }) = _ProfileState;

  ProfileState._();
} 
