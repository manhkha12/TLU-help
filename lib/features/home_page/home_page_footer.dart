import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tlu_students/features/calendar/calendar_cubit/calendar_cubit.dart';
import 'package:tlu_students/features/calendar/calendar_cubit/calender_state.dart';
import 'package:tlu_students/features/academic/cubit/academic_cubit.dart';
import 'package:tlu_students/features/academic/cubit/academic_state.dart';
import 'package:tlu_students/features/finance/cubit/finance_cubit.dart';
import 'package:tlu_students/features/finance/cubit/finance_state.dart';
import 'package:tlu_students/features/home_page/news_card.dart';
import 'package:tlu_students/gen/assets.gen.dart';
import 'package:tlu_students/models/course_response.dart';
import 'package:tlu_students/routes.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';
import 'package:tlu_students/features/localization/localizations.dart';
import 'package:tlu_students/features/home_page/news_cubit/news_cubit.dart';
import 'package:tlu_students/features/home_page/news_cubit/news_state.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

class HomePageFooter extends StatefulWidget {
  const HomePageFooter({super.key});

  @override
  State<HomePageFooter> createState() => _HomePageFooterState();
}

class _HomePageFooterState extends State<HomePageFooter> {
  late CalendarCubit _calendarCubit;

  @override
  void initState() {
    super.initState();
    _calendarCubit = context.read<CalendarCubit>();
    // Fetch all courses (no semester filter) to get full schedule
    _calendarCubit.getCourses(null);
    // Fetch news
    context.read<NewsCubit>().getNews(limit: 5);
  }

  /// Convert Dart's DateTime.weekday (Mon=1..Sun=7) to backend's day_of_week
  /// Backend uses: 2=Thứ 2 (Mon), 3=Thứ 3 (Tue), ..., 7=Thứ 7 (Sat), 1=Chủ Nhật (Sun)
  int _dartWeekdayToBackend(int dartWeekday) {
    if (dartWeekday == 7) return 1; // Sunday
    return dartWeekday + 1;
  }

  /// Filter and sort courses for today
  List<CourseData> _getTodayCourses(List<CourseData> allCourses) {
    if (allCourses.isEmpty) return [];

    final now = DateTime.now();
    final todayDate = now.normalizeDate;

    // 1. Tìm học kỳ hiện tại (kỳ có priority cao nhất)
    final semesters = allCourses.map((c) => c.semester).toSet().toList();
    semesters.sort((a, b) => b!.priority.compareTo(a!.priority));
    final currentSemesterId = semesters.isNotEmpty ? semesters.first!.id : null;

    final todayBackend = _dartWeekdayToBackend(now.weekday);

    final todayCourses = allCourses.where((c) {
      // 1. Check semester (Phải thuộc học kỳ hiện tại)
      if (currentSemesterId != null && c.semesterId != currentSemesterId) {
        return false;
      }

      // 2. Check day of week (Phải trùng Thứ)
      if (c.dayOfWeek != todayBackend) return false;

      // 3. Check date range (Phải nằm trong thời gian học của học phần)
      final startDate = c.startDate.normalizeDate;
      final endDate = c.endDate.normalizeDate;

      final isInDateRange = (todayDate.isAtSameMomentAs(startDate) ||
              todayDate.isAfter(startDate)) &&
          (todayDate.isAtSameMomentAs(endDate) || todayDate.isBefore(endDate));

      if (!isInDateRange) return false;

      // 4. Check time (Chỉ hiện các lớp chưa kết thúc - Optional cho "Upcoming")
      final endTimeStr = c.lessonSlot.split('-').last.trim();
      final classEndMinutes = _parseTime(endTimeStr);
      final nowMinutes = now.hour * 60 + now.minute;

      return classEndMinutes > nowMinutes;
    }).toList();

    // Sort by start time
    todayCourses.sort((a, b) {
      final aTime = _parseTime(a.lessonSlot.split('-').first.trim());
      final bTime = _parseTime(b.lessonSlot.split('-').first.trim());
      return aTime.compareTo(bTime);
    });

    return todayCourses;
  }

  /// Parse "7:00" or "13:30" to minutes since midnight for sorting
  int _parseTime(String time) {
    try {
      final parts = time.split(':');
      return int.parse(parts[0]) * 60 + int.parse(parts[1]);
    } catch (_) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 0.85,
                    child: BlocBuilder<CalendarCubit, CalendarState>(
                      builder: (context, state) {
                        final todayClasses = _getTodayCourses(state.courses);
                        return ExtentionBox(
                          title: 'home.footer.schedule'.tr(),
                          description: 'home.footer.classes_count'
                              .tr(args: [todayClasses.length.toString()]),
                          icon: Assets.icons.checkin.svg(
                              width: 24,
                              height: 24,
                              color: context.colors.tluBlueColor),
                          color: context.colors.tluBlueColor,
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.calendar);
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 0.85,
                    child: BlocBuilder<AcademicCubit, AcademicState>(
                      builder: (context, state) {
                        final gpa = state.semesterResults.isNotEmpty
                            ? state.semesterResults.first.gpaCumulative
                                .toStringAsFixed(2)
                            : '0.0';
                        return ExtentionBox(
                          title: 'home.footer.grades'.tr(),
                          description: 'home.footer.gpa_value'.tr(args: [gpa]),
                          icon: Assets.icons.grade.svg(
                              width: 24,
                              height: 24,
                              color: context.colors.green400),
                          color: context.colors.green400,
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.academic);
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 0.85,
                    child: BlocBuilder<FinanceCubit, FinanceState>(
                      builder: (context, state) {
                        final unpaidCount = state.maybeWhen(
                          loaded: (fees) =>
                              fees.where((f) => f.status == 'UNPAID').length,
                          orElse: () => 0,
                        );
                        return ExtentionBox(
                          title: 'home.footer.finance'.tr(),
                          description: 'home.footer.unpaid_count'
                              .tr(args: [unpaidCount.toString()]),
                          icon: Assets.icons.walle.svg(
                              width: 24,
                              height: 24,
                              color: context.colors.tluRedColor),
                          color: context.colors.tluRedColor,
                          onTap: () {
                            Navigator.pushNamed(context, RouteName.finance);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 26),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment
                  .end, // Căn lề chân chữ để trông thẳng hàng hơn
              children: [
                Expanded(
                  child: AppText(
                    'home.footer.news_events'.tr(),
                    style: TextStyle(
                      fontSize: 20, // Tăng nhẹ size để tạo sự phân cấp rõ ràng
                      fontWeight: FontWeight.w800, // Đậm hơn một chút
                      letterSpacing:
                          -0.5, // Thu hẹp khoảng cách chữ cho cảm giác hiện đại
                      color: context.colors.black,
                    ),
                  ),

                  // Thêm một dòng sub-text nhỏ để làm UI đầy đặn hơn (optional)
                ),
                // Nút View all được bọc trong InkWell để có hiệu ứng phản hồi khi chạm
                //     InkWell(
                //       onTap: () {
                //         // Điều hướng đến trang tin tức
                //       },
                //       borderRadius: BorderRadius.circular(8),
                //       child: Padding(
                //         padding:
                //             const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                //         child: Row(
                //           children: [
                //             AppText(
                //               'home.footer.view_all'.tr(),
                //               style: TextStyle(
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.w600,
                //                 color: context.colors.tluBlueColor,
                //               ),
                //             ),
                //             const SizedBox(width: 4),
                //             Icon(
                //               Icons.arrow_forward_ios_rounded,
                //               size: 12,
                //               color: context.colors.tluBlueColor,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 360, // Giảm chiều cao vì đã bỏ phần tương tác
              child: BlocBuilder<NewsCubit, NewsState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: (newsList) {
                      final displayList = newsList.take(5).toList();
                      if (displayList.isEmpty) {
                        return Center(
                          child: AppText(
                            'home.footer.no_news'.tr(),
                            style: TextStyle(
                                color: context.colors.black.withOpacity(0.5)),
                          ),
                        );
                      }
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        itemCount: displayList.length,
                        itemBuilder: (context, index) {
                          final news = displayList[index];
                          return NewsCard(
                            news: news,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteName.newsDetail,
                                arguments: {
                                  'newsId': news.id,
                                  'initialNews': news,
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                    error: (message) => Center(child: AppText(message)),
                    orElse: () => const SizedBox.shrink(),
                  );
                },
              ),
            ),

            SizedBox(height: 16),
            // ── Upcoming Classes Section ──
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(
                  'home.footer.upcoming_classes'.tr(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                    color: context.colors.black,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.calendar);
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      children: [
                        AppText(
                          'home.footer.view_all'.tr(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: context.colors.tluBlueColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 12,
                          color: context.colors.tluBlueColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            BlocBuilder<CalendarCubit, CalendarState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (state.errorMessage != null) {
                  return _buildEmptyState(
                    context,
                    icon: Icons.error_outline_rounded,
                    message: 'home.footer.error_load_schedule'.tr(),
                    color: context.colors.tluRedColor,
                  );
                }

                final todayCourses = _getTodayCourses(state.courses);

                if (todayCourses.isEmpty) {
                  return _buildEmptyState(
                    context,
                    icon: Icons.event_available_rounded,
                    message: 'home.footer.no_classes_today'.tr(),
                    color: context.colors.green400,
                  );
                }

                return _UpcomingClassCard(course: todayCourses.first);
              },
            ),
          ],
        ));
  }

  Widget _buildEmptyState(
    BuildContext context, {
    required IconData icon,
    required String message,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.15)),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: color.withOpacity(0.5)),
          const SizedBox(height: 10),
          AppText(
            message,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: context.colors.black.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Upcoming Class Card ──────────────────────────────────────────────────────

class _UpcomingClassCard extends StatelessWidget {
  final CourseData course;
  const _UpcomingClassCard({required this.course});

  @override
  Widget build(BuildContext context) {
    // Determine a color accent based on course position (cycle through colors)
    final accentColors = [
      context.colors.tluBlueColor,
      context.colors.green400,
      context.colors.tluRedColor,
      Colors.orange,
      Colors.purple,
    ];
    final accent = accentColors[
        course.subject.subjectCode.hashCode.abs() % accentColors.length];

    return Container(
      decoration: BoxDecoration(
        color: context.colors.primaryBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.colors.divider, width: 1),
        boxShadow: [
          BoxShadow(
            color: accent.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Left accent bar
            Container(
              width: 5,
              decoration: BoxDecoration(
                color: accent,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subject name + code
                    Row(
                      children: [
                        Expanded(
                          child: AppText(
                            course.subject.subjectName,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: context.colors.black,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: accent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: AppText(
                            '${course.subject.credits} ${'home.footer.credits'.tr()}',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: accent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    AppText(
                      course.subject.subjectCode,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: context.colors.black.withOpacity(0.45),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Info row: time, room, lecturer
                    Wrap(
                      spacing: 16,
                      runSpacing: 6,
                      children: [
                        _InfoChip(
                          icon: Icons.access_time_rounded,
                          label: '${course.startTime} - ${course.endTime}',
                          color: accent,
                        ),
                        _InfoChip(
                          icon: Icons.room_rounded,
                          label: course.room,
                          color: accent,
                        ),
                        _InfoChip(
                          icon: Icons.person_outline_rounded,
                          label: course.lecturer.fullName,
                          color: accent,
                        ),
                        _buildAbsenceBadge(
                            context, course.studentStats!.absent),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAbsenceBadge(BuildContext context, double absent) {
    Color badgeColor;
    String label;

    if (absent == 0) {
      badgeColor = Colors.green;
      label = "Chưa vắng buổi nào";
    } else if (absent <= 2) {
      badgeColor = Colors.orange;
      label = "Vắng ${absent.toInt()} buổi";
    } else {
      badgeColor = Colors.red;
      label = "Vắng ${absent.toInt()} buổi (Cảnh báo)";
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: badgeColor.withOpacity(0.3), width: 1),
      ),
      child: AppText(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: badgeColor,
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _InfoChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color.withOpacity(0.7)),
        const SizedBox(width: 4),
        Flexible(
          child: AppText(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: context.colors.black.withOpacity(0.65),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

// ── Extension Box (unchanged) ────────────────────────────────────────────────

class ExtentionBox extends StatelessWidget {
  final String title;
  final SvgPicture icon;
  final VoidCallback onTap;
  final String description;
  final Color color;
  const ExtentionBox(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      required this.description,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: context.colors.primaryBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: context.colors.divider, width: 1),
        ),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Chỉ chiếm không gian vừa đủ cho nội dung
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: icon,
            ),
            SizedBox(height: 8),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: AppText(title,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: context.colors.black)),
            ),
            AppText(
              description,
              fontSize: 12,
              overflow: TextOverflow.ellipsis, // Thêm dấu ... khi tràn

              maxLines: 1,
              color: context.colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
