import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/features/academic/cubit/academic_state.dart';
import 'package:tlu_students/models/app_error.dart';
import 'package:tlu_students/repository/module_repository.dart';

class AcademicCubit extends Cubit<AcademicState> {
  ModuleRespository moduleRespository;

  AcademicCubit({required this.moduleRespository}) : super(AcademicState());

  Future<void> fetchAcademicData() async {
    try {
      print("🚀 [AcademicCubit] Bắt đầu lấy dữ liệu học tập...");
      emit(state.copyWith(isLoading: true, error: null));

      print("⏳ [AcademicCubit] Đang gọi API getGrade...");
      final gradeItems = await moduleRespository.getGrade();
      print(
          "✅ [AcademicCubit] getGrade thành công: ${gradeItems.length} môn học");

      print("⏳ [AcademicCubit] Đang gọi API getGpa...");
      final semesterResults = await moduleRespository.getGpa();
      print(
          "✅ [AcademicCubit] getGpa thành công: ${semesterResults.length} học kỳ");

      print("✨ [AcademicCubit] Cập nhật State với dữ liệu mới");
      emit(state.copyWith(
        isLoading: false,
        gradeItems: gradeItems,
        semesterResults: semesterResults,
      ));
    } catch (e) {
      print("❌ [AcademicCubit] Lỗi fetchAcademicData: $e");
      emit(
          state.copyWith(isLoading: false, error: AppError.data(e.toString())));
    }
  }
}
