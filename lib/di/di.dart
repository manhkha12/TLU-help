import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tlu_students/app_config.dart';
import 'package:tlu_students/shared/cubits/app_cubit/app_cubit.dart';
import 'package:tlu_students/shared/cubits/socket_cubit/socket_cubit.dart';
import 'package:tlu_students/features/notification/cubit/notification_cubit.dart';


import 'cubit_modules.dart';
import 'local_modules.dart';
import 'remote_modules.dart';
import 'repository_modules.dart';

import 'package:tlu_students/features/service/cubit/service_cubit.dart';
import 'package:tlu_students/features/chat/cubit/chat_cubit.dart';
import 'package:tlu_students/features/home_page/news_cubit/news_cubit.dart';




Future<void> setupDI() async {
  final getIt = GetIt.I;
  getIt.registerLazySingleton(() => AppConfig());
  await registerLocalModules(getIt);
  await registerRemoteModules(getIt);
  await registerRepositoryModules(getIt);
  await registerCubitModules(getIt);
}

dynamic get globalProviders => [
      BlocProvider(create: (_) => GetIt.I<AppCubit>()),
      BlocProvider(create: (_) => GetIt.I<SocketCubit>()),
      BlocProvider(create: (_) => GetIt.I<NotificationCubit>()..getNotifications()),
      BlocProvider(create: (_) => GetIt.I<ServiceCubit>()..init()),
      BlocProvider(create: (_) => GetIt.I<ChatCubit>()..init()),
      BlocProvider(create: (_) => GetIt.I<NewsCubit>()),
    ]; // Define all global provider


