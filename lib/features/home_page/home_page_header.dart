import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/features/profile/cubit/profile_cubit.dart';
import 'package:tlu_students/features/profile/cubit/profile_state.dart';
import 'package:tlu_students/gen/assets.gen.dart';
import 'package:tlu_students/routes.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';
import 'package:tlu_students/features/notification/cubit/notification_cubit.dart';
import 'package:badges/badges.dart' as badges;
import 'package:tlu_students/features/localization/localizations.dart';

class HomePageHeader extends StatefulWidget {
  const HomePageHeader({super.key});

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {
  late ProfileCubit profileCubit;
  @override
  void initState() {
    super.initState();
    profileCubit = context.read<ProfileCubit>();
    profileCubit.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      if (state.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      final student = state.student;
      if (student == null) {
        return Center(child: Text('home.header.no_student_data'.tr()));
      }

      return Container(
        decoration: BoxDecoration(
          color: context.colors.tluBlueColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors
                          .white, // Thêm nền trắng nếu logo có nền trong suốt
                      borderRadius:
                          BorderRadius.circular(12), // Bo góc vừa phải
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      border: Border.all(
                          color: context.colors.white.withOpacity(0.5),
                          width: 1.5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          11), // Bo nhỏ hơn border ngoài 1 chút
                      child: Image.asset(
                        Assets.images.logo.path,
                        fit: BoxFit
                            .contain, // Dùng contain nếu logo cần giữ khoảng trống xung quanh
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          'home.header.portal_title'.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: context.colors.tluWhiteColor),
                        ),
                        AppText('home.header.ums'.tr(),
                            style:
                                TextStyle(color: context.colors.tluWhiteColor)),
                      ],
                    ),
                  ),
                  const _NotificationIcon(),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8), // Thêm margin để không sát mép màn hình
                decoration: BoxDecoration(
                  // Hiệu ứng đổ bóng nhẹ để tạo chiều sâu
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(5, 6),
                    ),
                  ],
                  // Gradient nhẹ để Container trông sang hơn
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      context.colors.tluBlueColor.withOpacity(0.55),
                      context.colors.tluRedColor.withOpacity(0.95),
                    ],
                  ),
                  border:
                      Border.all(color: context.colors.white.withOpacity(0.2)),
                  color: context.colors.black.withOpacity(
                      0.4), // Độ tối vừa phải để nổi bật Text trắng
                  borderRadius: BorderRadius.circular(
                      20), // Bo góc tròn hơn (20) theo xu hướng hiện đại
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16), // Padding đồng nhất
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: context.colors.white, width: 2),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://i.pravatar.cc/300'), // Thay bằng ảnh thật của SV
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              blurRadius: 8,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Thông tin sinh viên
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              student.fullName, // "Trần Văn Anh"
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: context.colors.tluWhiteColor,
                              ),
                            ),
                            const SizedBox(height: 2),
                            AppText(
                              'home.header.student_summary'.tr(args: [student.studentCode, student.className]), // "MSV: 123456 • Lớp 12A"
                              style: TextStyle(
                                fontSize: 13,
                                color: context.colors.tluWhiteColor
                                    .withOpacity(0.8),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // Tag khóa học / ngành học
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color:
                                    context.colors.tluRedColor.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: context.colors.tluRedColor
                                        .withOpacity(0.5)),
                              ),
                                child: AppText(
                                  'home.header.year_summary'.tr(),
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: context.colors.tluWhiteColor,
                                  ),
                                ),
                            ),
                          ],
                        ),
                      ),
                      // Nút Settings hoặc Profile

                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(RouteName.profile);
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Assets.icons.settingss.svg(
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            context.colors.tluWhiteColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _NotificationIcon extends StatelessWidget {
  const _NotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final unreadCount = context.watch<NotificationCubit>().state.unreadCount;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(RouteName.notification);
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: context.width * 0.09,
        height: context.width * 0.09,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.colors.black.withOpacity(0.3),
        ),
        child: Center(
          child: badges.Badge(
            showBadge: unreadCount > 0,
            badgeContent: AppText(
              unreadCount > 99 ? '99+' : unreadCount.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
            ),
            position: badges.BadgePosition.topEnd(top: -8, end: -8),
            badgeStyle: badges.BadgeStyle(
              badgeColor: context.colors.textError,
              padding: const EdgeInsets.all(4),
            ),
            child: Assets.icons.noti.svg(color: context.colors.tluWhiteColor),
          ),
        ),
      ),
    );
  }
}
