import 'package:freezed_annotation/freezed_annotation.dart';

part 'student.freezed.dart';
part 'student.g.dart';

@freezed
class Student with _$Student {
  const factory Student({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'student_code') required String studentCode,
    @JsonKey(name: 'full_name') required String fullName,
    required DateTime dob,
    required String gender,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'class_name') required String className,
    required String address,
@JsonKey(fromJson: _doubleFromValue) // Sử dụng hàm convert ở dưới
    double? gpa,
        required String email,
    @JsonKey(name: 'major_name') required String majorName,
    @JsonKey(name: 'department_name') required String departmentName,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Student;

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
}
double? _doubleFromValue(dynamic value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}