import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/models/user.dart';
import 'package:tlu_students/repository/auth_repository.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:tlu_students/repository/module_repository.dart';


import 'app_state.dart';
export 'app_state.dart';

const int splashDuration = 3;

class AppCubit extends Cubit<AppState> {
  final AuthRepository authRepository;

  AppCubit({
    required this.authRepository,
  }) : super(AppState.checking());

  Future<void> checkAuthState() async {
    try {
      if (!authRepository.hasAccessToken) {
        await Future.delayed(const Duration(seconds: splashDuration));
        unauthorized();
        return;
      }
      final res = await Future.wait([
        authRepository.authToken(),
        Future.delayed(const Duration(seconds: splashDuration))
      ]);
      for (var e in res) {
        if (e is User) {
          authorized(e);
          return;
        }
      }
      unauthorized();
    } catch (e) {
      await Future.delayed(const Duration(seconds: splashDuration));
      unauthorized();
    }
  }

  void authorized(User user) {
    emit(AppState.authorized(user: user));
  }

  void unauthorized() {
    emit(AppState.unAuthorized());
  }

  void logout() async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        final moduleRepository = GetIt.I<ModuleRespository>();
        await moduleRepository.unregisterFcmToken(token);
      }
    } catch (e) {
      print("Error unregistering FCM token on logout: $e");
    }
    authRepository.logout();
    unauthorized();
  }
}
