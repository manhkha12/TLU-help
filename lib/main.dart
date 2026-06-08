import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tlu_students/di/di.dart' as di;
import 'package:tlu_students/features/localization/app_localization.dart';
import 'package:tlu_students/features/localization/localization_controller.dart';
import 'package:tlu_students/features/localization/translate_extension.dart';
import 'package:tlu_students/shared/cubits/app_cubit/app_cubit.dart';
import 'package:tlu_students/shared/cubits/socket_cubit/socket_cubit.dart';
import 'package:tlu_students/shared/widgets/connection_widget.dart';

import 'package:toastification/toastification.dart';
import 'package:tlu_students/features/chat/cubit/chat_cubit.dart';

import 'routes.dart';
import 'shared/theme/color_provider.dart';
import 'shared/theme/colors.dart';
import 'shared/theme/styles.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tlu_students/services/firebase_messaging_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await di.setupDI();
  runApp(AppLocalization(
    initLocale: const AppLocale(locale: Locale('vi', 'VN')),
    supportedLocales: const [Locale('vi', 'VN'), Locale('en', 'US')],
    child: MultiBlocProvider(
      providers: di.globalProviders,
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    // Khởi tạo Firebase Messaging sau khi widget được build và có navigatorKey
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FirebaseMessagingService().init(navigatorKey);
    });
  }

  void _safeProceed(Function(BuildContext) f) {
    final context = navigatorKey.currentState?.overlay?.context;
    if (context != null) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        f(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = LightColorTheme();
    final theme = AppTheme(colors);
    return MultiBlocListener(
      listeners: [
        BlocListener<AppCubit, AppState>(listener: (context, state) {
          state.whenOrNull(
            unAuthorized: () {
              context.read<SocketCubit>().disconnect();
              context.read<ChatCubit>().closeSocket();
            },

            authorized: (user) {
              context.read<SocketCubit>().connect();
              context.read<ChatCubit>().init();
              FirebaseMessagingService().updateToken();
            },



          );
        }),
        BlocListener<SocketCubit, SocketState>(listener: (context, state) {
          log('Socket state: $state');
        })
      ],child:
     ColorThemeProvider(
      colors: colors,
      child: ToastificationWrapper(
        child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: theme.lightTheme,
          darkTheme: theme.lightTheme,
          title: 'Smart Home',
          builder: (context, child) {
            Intl.defaultLocale = context.appLocale.toStringWithSeparator;
            return MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1)),
              child: ConnectionWidget(child: child!),
            );
          },
          locale: context.appLocale.locale,
          localizationsDelegates: context.localizationDelegates,
          initialRoute: RouteName.splash,
          onGenerateRoute: onGenerateRoutes(),
        ),
      ),)
    );
  }
}
