import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tlu_students/features/calendar/calendar_cubit/calendar_cubit.dart';
import 'package:tlu_students/features/calendar/calendar_cubit/calender_state.dart';
import 'package:tlu_students/features/calendar/semester_cubit/semester_cubit.dart';
import 'package:tlu_students/features/calendar/semester_cubit/semester_state.dart';
import 'package:tlu_students/gen/assets.gen.dart';
import 'package:tlu_students/models/semester.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';
import 'package:tlu_students/features/localization/localizations.dart';
import 'package:tlu_students/models/course_response.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  Semester? _selectedSemester;
  late SemesterCubit _semesterCubit;

  int _selectedWeekday =
      DateTime.now().weekday == 7 ? 2 : DateTime.now().weekday + 1;
  @override
  void initState() {
    super.initState();
    // Khởi tạo danh sách học kỳ
    _semesterCubit = context.read<SemesterCubit>();
    _semesterCubit.getSemesters();
  }

  bool _isCurrentTimeInSlot(String slot) {
    try {
      final now = DateTime.now();
      final parts = slot.split('-');
      if (parts.length != 2) return false;

      final startParts = parts[0].trim().split(':');
      final endParts = parts[1].trim().split(':');

      final startTime = TimeOfDay(
          hour: int.parse(startParts[0]), minute: int.parse(startParts[1]));
      final endTime = TimeOfDay(
          hour: int.parse(endParts[0]), minute: int.parse(endParts[1]));

      final nowDouble = now.hour + now.minute / 60.0;
      final startDouble = startTime.hour + startTime.minute / 60.0;
      final endDouble = endTime.hour + endTime.minute / 60.0;

      return nowDouble >= startDouble && nowDouble <= endDouble;
    } catch (e) {
      return false;
    }
  }

  double _getStartDouble(String slot) {
    try {
      final startPart = slot.split('-')[0].trim();
      final parts = startPart.split(':');
      return int.parse(parts[0]) + int.parse(parts[1]) / 60.0;
    } catch (e) {
      return 0.0;
    }
  }

  int _getActiveOrNextIndex(List<CourseData> courses) {
    if (courses.isEmpty) return -1;

    final now = DateTime.now();
    final todayWeekday = now.weekday == 7 ? 1 : now.weekday + 1;

    // Chỉ tự động highlight cho ngày hôm nay
    if (_selectedWeekday != todayWeekday) return -1;

    final nowDouble = now.hour + now.minute / 60.0;
    int nextIndex = -1;

    for (int i = 0; i < courses.length; i++) {
      final slot = courses[i].lessonSlot;
      final parts = slot.split('-');
      if (parts.length != 2) continue;

      final startDouble = _getStartDouble(slot);
      final endParts = parts[1].trim().split(':');
      final endDouble = int.parse(endParts[0]) + int.parse(endParts[1]) / 60.0;

      // Nếu đang trong giờ học
      if (nowDouble >= startDouble && nowDouble <= endDouble) {
        return i;
      }

      // Tìm lớp tiếp theo (lớp chưa diễn ra và có giờ bắt đầu sớm nhất trong số các lớp chưa diễn ra)
      if (nowDouble < startDouble) {
        if (nextIndex == -1 || startDouble < _getStartDouble(courses[nextIndex].lessonSlot)) {
          nextIndex = i;
        }
      }
    }

    return nextIndex;
  }

  List<DateTime> _getDaysInWeek(DateTime date) {
    // Tìm số ngày chênh lệch so với thứ 2 (Dart: Mon=1, Sun=7)
    int daysToSubtract = date.weekday - 1;
    DateTime monday = date.subtract(Duration(days: daysToSubtract));

    // Tạo danh sách 6 ngày từ Thứ 2 đến Thứ 7
    return List.generate(6, (index) => monday.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(Icons.arrow_back_ios_new,
              color: Colors.black, size: 20),
        ),
        title: AppText(
          'calendar.title'.tr(),
          style: TextStyle(
              color: context.colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Assets.icons.noti.svg(color: Colors.black, width: 15),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildCalendarStrip(),
          const SizedBox(height: 16),

          // PHẦN CHỌN HỌC KỲ VÀ NÚT TÌM
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // 1. Selector chọn học kỳ
                Expanded(
                  child: BlocConsumer<SemesterCubit, SemesterState>(
                    listener: (context, state) {
                      if (state.isSuccess && state.semesters.isNotEmpty) {
                        if (_selectedSemester == null ||
                            !state.semesters.contains(_selectedSemester)) {
                          // Lấy kỳ hiện tại (kỳ có priority cao nhất)
                          final currentSemester = state.semesters.reduce((curr, next) => 
                              curr.priority > next.priority ? curr : next);
                          setState(() {
                            _selectedSemester = currentSemester;
                          });
                          // Tự động gọi API lấy lịch học cho kỳ hiện tại
                          context.read<CalendarCubit>().getCourses(currentSemester.id);
                        }
                      }
                    },
                    builder: (context, state) {
                      if (!state.isSuccess || state.semesters.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return _buildSemesterDropdown(state.semesters);
                    },
                  ),
                ),
                const SizedBox(width: 12),

                // 2. Nút Tìm kiếm
                ElevatedButton(
                  onPressed: () {
                    if (_selectedSemester != null) {
                      // Gọi Cubit lấy lịch học của học kỳ đã chọn
                      context
                          .read<CalendarCubit>()
                          .getCourses(_selectedSemester!.id);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.colors.tluBlueColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                  ),
                  child: const Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // PHẦN HIỂN THỊ LỊCH HỌC SAU KHI TÌM
          Expanded(
            child: BlocBuilder<CalendarCubit, CalendarState>(
              builder: (context, state) {
                if (state.isLoading)
                  return const Center(child: CircularProgressIndicator());

                if (state.isSuccess) {
                  final now = DateTime.now()
                      .normalizeDate; // Dùng extension normalizeDate để bỏ qua giờ phút
                  // LỌC DỮ LIỆU: Chỉ lấy những môn học thuộc Thứ đang được chọn trên thanh CalendarStrip
                  final filteredCourses = state.courses.where((c) {
                    // 1. Kiểm tra Thứ (Thứ 2, 3...)
                    bool isCorrectDay = c.dayOfWeek == _selectedWeekday;

                    // 2. Kiểm tra xem ngày hiện tại có nằm trong khoảng start_date và end_date không
                    // Lưu ý: Chúng ta cần so sánh ngày (Date) chứ không nên so sánh cả Giờ (Time)
                    bool isWithinDateRange = false;
                    if (c.startDate != null && c.endDate != null) {
                      isWithinDateRange = now.isAfter(
                              c.startDate.subtract(const Duration(days: 1))) &&
                          now.isBefore(c.endDate.add(const Duration(days: 1)));
                    }

                    return isCorrectDay && isWithinDateRange;
                  }).toList();

                  if (filteredCourses.isEmpty) {
                    return Center(
                        child: AppText('calendar.no_schedule'.tr()));
                  }

                  // Sắp xếp danh sách theo thời gian bắt đầu
                  filteredCourses.sort((a, b) =>
                      _getStartDouble(a.lessonSlot).compareTo(_getStartDouble(b.lessonSlot)));

                  final activeOrNextIndex = _getActiveOrNextIndex(filteredCourses);

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredCourses.length,
                    itemBuilder: (context, index) {
                      final item = filteredCourses[index];
                      return _buildScheduleItem(
                        time: item.startTime,
                        endTime: item.endTime,
                        course: item.subject.subjectName,
                        room: item.room,
                        instructor: item.lecturer.fullName,
                        color: context.colors.tluBlueColor,
                        isActive: index == activeOrNextIndex,
                      );
                    },
                  );
                }
                return Center(
                    child: AppText('calendar.select_semester_hint'.tr()));
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget Dropdown
  Widget _buildSemesterDropdown(List<Semester> semesters) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colors.divider),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Semester>(
          value: _selectedSemester,
          isExpanded: true, // Để dropdown chiếm hết chiều rộng Expanded
          icon: const Icon(Icons.keyboard_arrow_down),
          onChanged: (newValue) => setState(() => _selectedSemester = newValue),
          items: semesters
              .map((s) => DropdownMenuItem(
                    value: s,
                    child: AppText("${s.semesterName} (${s.academicYear})",
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w600)),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildCalendarStrip() {
    final List<DateTime> currentWeekDays = _getDaysInWeek(DateTime.now());
    final String monthYear =
        DateFormat('MMMM yyyy').format(currentWeekDays.first);
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Divider(color: Colors.grey.withOpacity(0.3), height: 1, thickness: 1),
         
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: currentWeekDays.map((date) {
              // Chuyển weekday của Dart (Mon=1) sang chuẩn của bạn (Mon=2)
              int myWeekday = date.weekday + 1;
              if (date.weekday == 7) myWeekday = 1; // Chủ nhật nếu cần

              return _buildDateItem(
                DateFormat('E').format(date), // 'Mon', 'Tue'...
                date.day.toString(), // '21', '22'...
                _selectedWeekday == myWeekday,
                () => setState(() => _selectedWeekday = myWeekday),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDateItem(
      String day, String date, bool isSelected, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 45,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          // Dùng context của lớp State luôn, không cần truyền động
          color: isSelected ? context.colors.tluBlueColor : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            AppText(
              day,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            AppText(
              date,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget Thanh chọn ngày nằm ngang

// Widget Từng tiết học trong danh sách
Widget _buildScheduleItem({
  required String time,
  required String endTime,
  required String course,
  required String room,
  required String instructor,
  required Color color,
  bool isActive = false,
}) {
  return IntrinsicHeight(
    child: Row(
      children: [
        // 1. Cột thời gian bên trái
        SizedBox(
          width: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFormattedTime(time, isBold: true),
              const SizedBox(height: 4),
              // Giờ kết thúc
              _buildFormattedTime(endTime, isBold: false),
            ],
          ),
        ),

        // 2. PHẦN THAY ĐỔI: Timeline Dot & Line
        Column(
          children: [
            // Nút thắt thời gian dạng "Ring"
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                color: isActive ? color : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: color,
                  width: isActive ? 2 : 2,
                ),
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: color.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ]
                    : null,
              ),
              child: isActive
                  ? Center(
                      child: Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle)))
                  : null,
            ),
            // Đường nối giữa các mốc
            Expanded(
              child: Container(
                width: 2,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(width: 16),

        // 3. Card nội dung môn học (Giữ nguyên hoặc tinh chỉnh nhẹ)
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white, // Chuyển nền sang trắng cho sạch
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
              border: Border(
                left: BorderSide(
                    color: color,
                    width: 4), // Giữ dải màu bên trái làm điểm nhấn
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  course,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.red),
                ),
                const SizedBox(height: 10),
                _buildInfoRow(Icons.location_on_outlined, room),
                const SizedBox(height: 6),
                _buildInfoRow(Icons.person_outline, instructor),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

// Hàm phụ trợ để code gọn hơn
Widget _buildInfoRow(IconData icon, String text) {
  return Row(
    children: [
      Icon(icon, size: 14, color: Colors.black),
      const SizedBox(width: 6),
      Expanded(
        child: AppText(
          text,
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
      ),
    ],
  );
}

Widget _buildFormattedTime(String timeStr, {required bool isBold}) {
  final parts = timeStr.split(' ');
  return Row(
    crossAxisAlignment: CrossAxisAlignment.baseline,
    textBaseline: TextBaseline.alphabetic,
    children: [
      AppText(
        parts[0], // Con số (ví dụ: 9:00)
        style: TextStyle(
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          fontSize: 16,
          color: isBold ? Colors.black : Colors.grey[600],
        ),
      ),
      if (parts.length > 1) ...[
        const SizedBox(width: 2),
        AppText(
          parts[1], // Chữ AM/PM
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: 10, // AM/PM nhỏ hơn nhìn sẽ rất sang
            color: isBold ? Colors.black : Colors.grey[500],
          ),
        ),
      ]
    ],
  );
}
