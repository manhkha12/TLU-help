import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tlu_students/features/profile/cubit/profile_state.dart';
import 'package:tlu_students/models/app_error.dart';
import 'package:tlu_students/repository/auth_repository.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final AuthRepository authRepository;
  ProfileCubit({required this.authRepository}) : super(ProfileState());

Future<void> getProfile() async {
    emit(state.copyWith(isLoading: true));
    try {
      final student = await authRepository.getProfile();
      emit(state.copyWith(isLoading: false, isSuccess: true, student: student));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: AppError.data(e.toString())));
    }
  }



}