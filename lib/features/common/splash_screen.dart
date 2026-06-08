import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:lottie/lottie.dart';
import 'package:tlu_students/gen/assets.gen.dart';
import 'package:tlu_students/shared/cubits/app_cubit/app_cubit.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';

import '../../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Gọi check login ngay khi vào splash
    context.read<AppCubit>().checkAuthState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.tluBlueColor,
      // ĐẶT LISTENER Ở ĐÂY LÀ CHUẨN NHẤT
      body: BlocListener<AppCubit, AppState>(
        listener: (context, state) {
          state.whenOrNull(
            authorized: (user) {
              Navigator.of(context).pushReplacementNamed(RouteName.main);
            },
            unAuthorized: () async {
              final prefs = await SharedPreferences.getInstance();
              final isFirstLaunch = prefs.getBool('is_first_launch') ?? true;
              
              if (isFirstLaunch) {
                Navigator.of(context).pushReplacementNamed(RouteName.intro);
              } else {
                Navigator.of(context).pushReplacementNamed(RouteName.login);
              }
            },
          );
        },
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Center(
                    child: Lottie.asset(
                      Assets.images.education,
                      controller: _controller,
                      onLoaded: (composition) {
                        _controller
                          ..duration = composition.duration
                          ..forward();
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppText(
                    'TLU',
                    color: context.colors.tluWhiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                  const SizedBox(height: 4),
                  AppText('UNIVERSITY MOBILE',
                      color: context.colors.tluWhiteColor, fontSize: 16)
                ],
              ),
              const Positioned(
                bottom: 60,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    LoadingDots(), // Chỉ hiển thị UI
                    SizedBox(height: 30),
                    AppText('Powered by', color: Colors.grey, fontSize: 12),
                    SizedBox(height: 4),
                    AppText('TLU IT Center',
                        color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Rút gọn LoadingDots (Chỉ làm UI)
class LoadingDots extends StatefulWidget {
  const LoadingDots({super.key});
  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (index) {
            final double opacity = ((_controller.value + (index * 0.3)) % 1.0);
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(opacity.clamp(0.2, 1.0)),
                shape: BoxShape.circle,
              ),
            );
          }),
        );
      },
    );
  }
}

