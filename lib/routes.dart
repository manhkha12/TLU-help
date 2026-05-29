import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tlu_students/features/academic/academic_screen.dart';
import 'package:tlu_students/features/academic/cubit/academic_cubit.dart';
import 'package:tlu_students/features/calendar/calendar_cubit/calendar_cubit.dart';
import 'package:tlu_students/features/calendar/calendar_screen.dart';
import 'package:tlu_students/features/calendar/semester_cubit/semester_cubit.dart';
import 'package:tlu_students/features/chat/chat_screen.dart';
import 'package:tlu_students/features/chat/inbox_meessed.dart';
import 'package:tlu_students/features/checkin/checkin_screen.dart';
import 'package:tlu_students/features/checkin/cubit/checkin_cubit.dart';
import 'package:tlu_students/features/common/splash_screen.dart';
import 'package:tlu_students/features/finance/cubit/finance_cubit.dart';
import 'package:tlu_students/features/finance/finance_screen.dart';
import 'package:tlu_students/features/finance/tuition_detail_screen.dart';
import 'package:tlu_students/features/finance/web_view_payment.dart';
import 'package:tlu_students/features/home_page/news_detail_screen.dart';
import 'package:tlu_students/models/news_model.dart';

import 'package:tlu_students/features/home_page/home_page_screen.dart';
import 'package:tlu_students/features/login/cubit/login_cubit.dart';
import 'package:tlu_students/features/login/login_screen.dart';
import 'package:tlu_students/features/main_screen.dart';
import 'package:tlu_students/features/profile/cubit/profile_cubit.dart';
import 'package:tlu_students/features/profile/profile_screen.dart';
import 'package:tlu_students/features/register/register.dart';
import 'package:tlu_students/features/service/service_screen.dart';
import 'package:tlu_students/intro/intro_screen.dart';
import 'package:tlu_students/features/notification/notification_screen.dart';

class RouteName {
  static const String splash = '/';
  static const String main = '/main';
  static const String register = '/register';
  static const String login = '/login';
  static const String intro = '/intro';
  static const String home = '/home';
  static const String academic = '/academic';
  static const String checkin = '/checkin';
  static const String chat = '/chat';
  static const String service = '/service';
  static const String finance = '/finance';
  static const String profile = '/profile';
  static const String calendar = '/calendar';
  static const String chatDetail = '/chat_detail';
  static const String notification = '/notification';
  static const String tuitionDetail = '/tuition_detail';
  static const String webViewPayment = '/web_view_payment';
  static const String newsDetail = '/news_detail';
}

RouteFactory onGenerateRoutes() {
  return (RouteSettings settings) {
    if (settings.name == RouteName.splash) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const SplashScreen(),
      );
    }
    if (settings.name == RouteName.intro) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const IntroScreen(),
      );
    }
    // Trong routes.dart
if (settings.name == RouteName.main) {
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.I<ProfileCubit>()),
        BlocProvider(create: (_) => GetIt.I<CalendarCubit>()),
        BlocProvider(create: (_) => GetIt.I<FinanceCubit>()..getTuitionFees()),
        BlocProvider(create: (_) => GetIt.I<AcademicCubit>()..fetchAcademicData()),
        BlocProvider(create: (_) => GetIt.I<CheckInCubit>()),
      ],
      child: const MainScreen(), 
    ),
  );
}
    if (settings.name == RouteName.chatDetail) {
      final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => ChatDetailScreen(
          name: args['name'],
          conversationId: args['conversationId'],
          isBot: args['isBot'] ?? false,
        ),
      );
    }

    if (settings.name == RouteName.home) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const HomePageScreen(),
      );
    }

if (settings.name == RouteName.profile) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => BlocProvider(
          create: (_) => GetIt.I<ProfileCubit>(),
          child: const ProfileScreen(),
        ),
      );
    }
    if (settings.name == RouteName.calendar) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => GetIt.I<SemesterCubit>()),
            BlocProvider(create: (_) => GetIt.I<CalendarCubit>()),
          ],
          child: const CalendarScreen(),
        ),
      );
    }
    if (settings.name == RouteName.academic) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => BlocProvider(
          create: (_) => GetIt.I<AcademicCubit>(),
          child: const AcademicScreen(),
        ),
      );
    }
    if (settings.name == RouteName.checkin) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => BlocProvider(
          create: (_) => GetIt.I<CheckInCubit>(),
          child: const CheckinScreen(),
        ),
      );
    }
    if (settings.name == RouteName.chat) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const ChatScreen(),
      );
    }
    if (settings.name == RouteName.service) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const ServiceScreen(),
      );
    }
    if (settings.name == RouteName.finance) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => BlocProvider(
          create: (_) => GetIt.I<FinanceCubit>()..getTuitionFees(),
          child: const FinanceScreen(),
        ),
      );
    }
    if (settings.name == RouteName.register) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const RegisterScreen(),
      );
    }
     if (settings.name == RouteName.login) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => BlocProvider(
          create: (_) => GetIt.I<LoginCubit>(),
          child: const LoginScreen(),
        ),
      );
    }
    if (settings.name == RouteName.notification) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => const NotificationScreen(),
      );
    }
    if (settings.name == RouteName.tuitionDetail) {
      final semesterId = settings.arguments as String;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => BlocProvider(
          create: (_) => GetIt.I<FinanceCubit>()..getTuitionDetail(semesterId),
          child: const TuitionDetailScreen(),
        ),
      );
    }
    if (settings.name == RouteName.webViewPayment) {
      final url = settings.arguments as String;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => WebViewPayment(url: url),
      );
    }
    if (settings.name == RouteName.newsDetail) {
      final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => NewsDetailScreen(
          newsId: args['newsId'],
          initialNews: args['initialNews'] as NewsModel?,
        ),
      );
    }
  };
}
