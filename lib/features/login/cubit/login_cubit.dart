import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/data/remote/exceptions/exceptions.dart';
import 'package:tlu_students/features/localization/localizations.dart';
import 'package:tlu_students/features/login/cubit/login_state.dart';
import 'package:tlu_students/models/app_error.dart';
import 'package:tlu_students/repository/auth_repository.dart';
import 'package:tlu_students/shared/cubits/app_cubit/app_cubit.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;
  final AppCubit appCubit;
  LoginCubit({
    required this.authRepository,
    required this.appCubit,
  }) : super(LoginState());
  void setEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void setPassword(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> login() async {
    emit(state.copyWith(isLoginning: true, isLoginSuccess: false));
    try {
      final params = state.toLoginParams();
      final user = await authRepository.login(params);
      appCubit.authorized(user);
      emit(
        state.copyWith(
          isLoginning: false,
          isLoginSuccess: true,
        ),
      );
    } catch (e) {
      String message = e.toString();
      if (e is DioException) {
        if (e.error is NoInternetException) {
          message = 'common.no_internet'.tr();
        } else if (e.response?.statusCode == 401) {
          message = 'Tên đăng nhập hoặc mật khẩu không hợp lệ';
        } else if (e.response?.data != null && e.response?.data['message'] != null) {
          message = e.response?.data['message'];
        }
      }
      emit(state.copyWith(
          isLoginning: false, error: AppError.data(message)));
    } finally {
      emit(state.copyWith(error: AppError.none()));
    }
  }
}
