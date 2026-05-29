import 'package:freezed_annotation/freezed_annotation.dart';

part 'semester.freezed.dart';
part 'semester.g.dart';
@freezed
class Semester with _$Semester {
  // Thêm dòng này để định nghĩa được method/getter custom
  const Semester._(); 

  const factory Semester({
     String? id, // Thêm id từ JSON mới của bạn
    @JsonKey(name: 'semester_name') required String semesterName,
    @JsonKey(name: 'academic_year') required String academicYear,
    @JsonKey(name: 'tuition_per_credit') double? tuitionPerCredit,
  }) = _Semester;

  factory Semester.fromJson(Map<String, dynamic> json) =>
      _$SemesterFromJson(json);

  // Tạo một trọng số để so sánh (Weight)
  // Ví dụ: "2024-2025" và "Học kỳ 2" sẽ có trọng số lớn hơn
  double get priority {
    // Lấy năm bắt đầu (ví dụ: 2024 từ "2024-2025")
    final startYear = double.tryParse(academicYear.split('-').first) ?? 0;
    // Học kỳ 2 cộng thêm 0.5, Học kỳ 1 cộng 0.1
    final semesterValue = semesterName.contains('2') ? 0.5 : 0.1;
    return startYear + semesterValue;
  }
}