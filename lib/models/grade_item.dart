import 'package:freezed_annotation/freezed_annotation.dart';

import 'semester.dart';

part 'grade_item.freezed.dart';
part 'grade_item.g.dart';

@freezed
class GradeItem with _$GradeItem {
  const factory GradeItem({   
    required String id,
    @JsonKey(name: 'score_attendance') double? scoreAttendance,
    @JsonKey(name: 'score_process') double? scoreProcess,
    @JsonKey(name: 'score_final') double? scoreFinal,
    @JsonKey(name: 'score_total_10') double? scoreTotal10,
    @JsonKey(name: 'enrollment') required Enrollment enrollment,

  }) = _GradeItem;  

  factory GradeItem.fromJson(Map<String, dynamic> json) => _$GradeItemFromJson(json);
}

@freezed
class CourseClass with _$CourseClass {
  const factory CourseClass({
    required String id,
    required Subject subject,
    required Semester semester,
  }) = _CourseClass;

  factory CourseClass.fromJson(Map<String, dynamic> json) => _$CourseClassFromJson(json);
}

@freezed
class Subject with _$Subject {
  const factory Subject({
    @JsonKey(name: 'subject_code') required String subjectCode,
    @JsonKey(name: 'subject_name') required String subjectName,
    required int credits,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);
}


@freezed
class Enrollment with _$Enrollment {
  const factory Enrollment({
    required String id,
    @JsonKey(name: 'course_class') required CourseClass courseClass,
  }) = _Enrollment;

  factory Enrollment.fromJson(Map<String, dynamic> json) => _$EnrollmentFromJson(json);
}