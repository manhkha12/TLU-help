import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/features/calendar/calendar_cubit/calender_state.dart';
import 'package:tlu_students/repository/module_repository.dart';

class CalendarCubit extends Cubit<CalendarState> {
  ModuleRespository moduleRespository;
  CalendarCubit({required this.moduleRespository}) : super(CalendarState());



  Future<void> getCourses(String? semesterId) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final courses = await moduleRespository.getCourse(semesterId);
      emit(state.copyWith(isLoading: false, courses: courses, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}