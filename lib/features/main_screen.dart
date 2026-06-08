import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/features/academic/academic_screen.dart';
import 'package:tlu_students/features/chat/chat_screen.dart';
import 'package:tlu_students/features/checkin/checkin_screen.dart';
import 'package:tlu_students/features/finance/finance_screen.dart';
import 'package:tlu_students/features/home_page/home_page_screen.dart';
import 'package:tlu_students/features/service/service_screen.dart';
import 'package:tlu_students/gen/assets.gen.dart';
import 'package:tlu_students/routes.dart';
import 'package:tlu_students/shared/cubits/app_cubit/app_cubit.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';
import 'package:tlu_students/shared/widgets/bottom_navigation/custom_bottom_navigation.dart';
import 'package:tlu_students/shared/widgets/custom_app_bar.dart';
import 'package:tlu_students/features/localization/localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  final bottomNavKey = GlobalKey<BottomNavigationState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppCubit, AppState>(
      listener: (_, state) {
        state.whenOrNull(
          unAuthorized: () => Navigator.of(context).pushNamedAndRemoveUntil(
            RouteName.login,
            (_) => false,
          ),
        );
      },
      child: BottomNavigation(
        initIndex: 0,
        inActiveColor: context.colors.unHighlightTab,
        activeColor: context.colors.tluBlueColor,
        backgroundColor: context.colors.primaryBackground,
        iconSize: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            )
          ],
        ),
        items: [
          BottomNavigationItem(
              icon: Assets.icons.hom.path,
              page: const HomePageScreen(),
              label: 'main.home'.tr()),
          // BottomNavigationItem(
          //   icon: Assets.icons.ecadamic.path,
          //   page: const AcademicScreen(),
          // ),
          BottomNavigationItem(
              icon: Assets.icons.checkin.path,
              page: const CheckinScreen(),
              label: 'main.attendance'.tr()),
          BottomNavigationItem(
              icon: Assets.icons.walle.path,
              page: const FinanceScreen(),
              label: 'main.finance'.tr()),
          BottomNavigationItem(
              icon: Assets.icons.inbox.path,
              page: const ChatScreen(),
              label: 'main.inbox'.tr()),
          BottomNavigationItem(
              icon: Assets.icons.service.path,
              page: const ServiceScreen(),
              label: 'main.service'.tr())
        ],
      ),
    );
  }
}
