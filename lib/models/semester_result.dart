import 'package:freezed_annotation/freezed_annotation.dart';

import 'semester.dart';

part 'semester_result.freezed.dart';
part 'semester_result.g.dart';

@freezed
class SemesterResult with _$SemesterResult {
  const factory SemesterResult({
    required String id,
    @JsonKey(name: 'gpa_semester') required double gpaSemester,
    @JsonKey(name: 'gpa_cumulative') required double gpaCumulative,
    required Semester semester,
  }) = _SemesterResult;

  factory SemesterResult.fromJson(Map<String, dynamic> json) => _$SemesterResultFromJson(json);
}

