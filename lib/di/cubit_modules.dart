import 'package:get_it/get_it.dart';
import 'package:tlu_students/features/academic/cubit/academic_cubit.dart';
import 'package:tlu_students/features/calendar/calendar_cubit/calendar_cubit.dart';
import 'package:tlu_students/features/calendar/semester_cubit/semester_cubit.dart';
import 'package:tlu_students/features/checkin/cubit/checkin_cubit.dart';
import 'package:tlu_students/features/login/cubit/login_cubit.dart';
import 'package:tlu_students/features/profile/cubit/profile_cubit.dart';
import 'package:tlu_students/shared/cubits/app_cubit/app_cubit.dart';
import 'package:tlu_students/shared/cubits/socket_cubit/socket_cubit.dart';
import 'package:tlu_students/features/notification/cubit/notification_cubit.dart';
import 'package:tlu_students/features/service/cubit/service_cubit.dart';
import 'package:tlu_students/features/chat/cubit/chat_cubit.dart';
import 'package:tlu_students/features/finance/cubit/finance_cubit.dart';
import 'package:tlu_students/features/home_page/news_cubit/news_cubit.dart';






Future<void> registerCubitModules(GetIt getIt) async {
  // register cubit modules
  getIt
    ..registerLazySingleton(() => AppCubit(authRepository: getIt()))
    ..registerFactory(
      () => LoginCubit(
        authRepository: getIt(),
        appCubit: getIt(),
      ),
    )
   
    ..registerFactory(
      () => ProfileCubit(
        authRepository: getIt(),
      ),
    )
    ..registerFactory(
      () => AcademicCubit(
        moduleRespository: getIt(),
      ),
    )
    ..registerFactory(
      () => SemesterCubit(
        moduleRespository: getIt(),
      ),
    )
    ..registerFactory(
      () => CalendarCubit(
        moduleRespository: getIt(),
      ),
    )
    ..registerLazySingleton(
      () => SocketCubit(userRepository: getIt()),
    )
    ..registerFactory(() => CheckInCubit(
          userRepository: getIt(),
          moduleRespository: getIt(),
        ))
    ..registerFactory(() => NotificationCubit(moduleRespository: getIt()))
    ..registerFactory(() => ServiceCubit(moduleRespository: getIt()))
    ..registerLazySingleton(() => ChatCubit(repository: getIt(), appProvider: getIt()))
    ..registerFactory(() => FinanceCubit(getIt()))
    ..registerFactory(() => NewsCubit(getIt()));



    // ..registerFactoryParam<ModuleDetailsCubit, Module, dynamic>(
    //   (module, _) => ModuleDetailsCubit(
    //     moduleRespository: getIt(),
    //     userRepository: getIt(),
    //     module: module,
    //   ),
    // )
    // ..registerFactory(
    //   () => AddModuleCubit(
    //     moduleRespository: getIt(),
    //     appCubit: getIt(),
    //     userRepository: getIt(),
    //   ),
    // )
    // ..registerFactory(
    //   () => LoginCubit(
    //     authRepository: getIt(),
    //     appCubit: getIt(),
    //   ),
    // )
    // ..registerFactory(() => RenameNodeCubit(moduleRespository: getIt()))
    // ..registerFactory(
    //     () => GetHistoryConnectionCubit(moduleRespository: getIt()))
    // ..registerFactory(
    //   () => SignupCubit(
    //     authRepository: getIt(),
    //   ),
    // )
    // ..registerFactory(
    //   () => ModuleCubit(
    //     moduleRespository: getIt(),
    //     userRepository: getIt(),
    //   ),
    // )
    // ..registerFactoryParam<ModuleMenuCubit, Module, dynamic>(
    //   (module, _) => ModuleMenuCubit(
    //     moduleRespository: getIt(),
    //     userRepository: getIt(),
    //     module: module,
    //   ),
    // );
}
