import 'package:get_it/get_it.dart';
import 'package:tlu_students/repository/auth_repository.dart';
import 'package:tlu_students/repository/module_repository.dart';
import 'package:tlu_students/repository/user_repository.dart';
import 'package:tlu_students/repository/messaging_repository.dart';
import 'package:tlu_students/repository/news_repository.dart';



Future<void> registerRepositoryModules(GetIt getIt) async {
  getIt
    ..registerLazySingleton(() => ModuleRespository(getIt(), getIt()))
    ..registerLazySingleton(() => AuthRepository(getIt(), getIt()))
    ..registerLazySingleton(
      () => UserRepository(appProvider: getIt(), appConfig: getIt()),
    )
    ..registerLazySingleton(() => MessagingRepository(api: getIt(), userRepository: getIt()))
    ..registerLazySingleton(() => NewsRepository(getIt()));
}

