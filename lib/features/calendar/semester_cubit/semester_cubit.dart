import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/features/calendar/semester_cubit/semester_state.dart';
import 'package:tlu_students/repository/module_repository.dart';

class SemesterCubit extends Cubit<SemesterState> {
  ModuleRespository moduleRespository;
  SemesterCubit({required this.moduleRespository}) : super(SemesterState());

  Future<void> getSemesters() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final semesters = await moduleRespository.getSemester();
      emit(state.copyWith(
          isLoading: false, semesters: semesters, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
