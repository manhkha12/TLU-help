import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tlu_students/features/academic/cubit/academic_cubit.dart';
import 'package:tlu_students/features/academic/cubit/academic_state.dart';
import 'package:tlu_students/features/academic/gpa_trend_chart.dart';
import 'package:tlu_students/models/grade_item.dart';
import 'package:tlu_students/models/semester_result.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/features/localization/localizations.dart';

class AcademicScreen extends StatefulWidget {
  const AcademicScreen({super.key});

  @override
  State<AcademicScreen> createState() => _AcademicScreenState();
}

class _AcademicScreenState extends State<AcademicScreen> {
  late AcademicCubit academicCubit;

  @override
  void initState() {
    super.initState();
    academicCubit = context.read<AcademicCubit>();
    academicCubit.fetchAcademicData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'academic.title'.tr(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: BlocBuilder<AcademicCubit, AcademicState>(
        builder: (context, state) {
          // 1. Trạng thái đang load
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Trạng thái lỗi
          if (state.error != null) {
            return Center(
              child: Text("Lỗi: ${state.error?.hashCode}"),
            );
          }

          // 3. Trạng thái có dữ liệu
          // Sắp xếp các học kỳ theo thứ tự thời gian (từ cũ nhất đến mới nhất) để vẽ biểu đồ
          final chronologicalResults = List<SemesterResult>.from(
              state.semesterResults)
            ..sort(
                (a, b) => a.semester.priority.compareTo(b.semester.priority));

          // Sắp xếp các học kỳ theo thứ tự thời gian giảm dần (từ mới nhất đến cũ nhất) để hiển thị trong lịch sử
          final sortedSemesterResults = List<SemesterResult>.from(
              state.semesterResults)
            ..sort(
                (a, b) => b.semester.priority.compareTo(a.semester.priority));

          final latestGpa = sortedSemesterResults.isNotEmpty
              ? sortedSemesterResults.first.gpaCumulative
              : 0.0;

          final totalCredits = state.gradeItems.fold<int>(
              0,
              (sum, item) =>
                  sum + (item.enrollment.courseClass.subject.credits));

          final gpaHistory =
              chronologicalResults.map((e) => e.gpaSemester).toList();

          final semesterNames =
              chronologicalResults.map((e) => e.semester.semesterName).toList();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeaderCard(latestGpa, totalCredits),
                const SizedBox(height: 25),

                if (gpaHistory.isNotEmpty) ...[
                  GpaTrendChart(
                    history: gpaHistory,
                    semesterNames: semesterNames,
                  ),
                  const SizedBox(height: 30),
                ],

                Text(
                  'academic.semester_history'.tr(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // Hiển thị danh sách môn học thật từ API theo từng học kỳ
                if (sortedSemesterResults.isEmpty)
                  _buildSemesterSection(
                    semesterTitle: 'academic.current_semester'.tr(),
                    semesterGpa: 0.0,
                    credits: totalCredits,
                    gradeItems: state.gradeItems,
                    items: state.gradeItems
                        .map((item) => _SubjectTile(
                              context,
                              item,
                            ))
                        .toList(),
                  )
                else
                  ...sortedSemesterResults.map((result) {
                    final semesterGradeItems = state.gradeItems.where((item) {
                      final sem = item.enrollment.courseClass.semester;
                      if (sem.id != null && result.semester.id != null) {
                        return sem.id == result.semester.id;
                      }
                      return sem.semesterName == result.semester.semesterName &&
                          sem.academicYear == result.semester.academicYear;
                    }).toList();

                    final semesterCredits = semesterGradeItems.fold<int>(
                        0,
                        (sum, item) =>
                            sum +
                            (item.enrollment.courseClass.subject.credits));

                    return _buildSemesterSection(
                      semesterTitle:
                          "${result.semester.semesterName} - Năm học ${result.semester.academicYear}",
                      semesterGpa: result.gpaSemester,
                      credits: semesterCredits,
                      gradeItems: semesterGradeItems,
                      items: semesterGradeItems
                          .map((item) => _SubjectTile(
                                context,
                                item,
                              ))
                          .toList(),
                    );
                  }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }

  // Widget: Thẻ Header xanh
  Widget _buildHeaderCard(double gpa, int credits) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: context.colors.tluBlueColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: context.colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem('academic.cumulative_gpa'.tr(), "$gpa", "/ 10.0"),
              _buildStatItem('academic.total_credits'.tr(), "$credits", ""),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              _buildBadge('academic.top_rank'.tr()),
              // const SizedBox(width: 10),
              // _buildBadge('academic.deans_list'.tr()),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value, String subValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 13)),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold)),
            if (subValue.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 4),
                child: Text(subValue,
                    style:
                        const TextStyle(color: Colors.white60, fontSize: 16)),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.tluRedColor),
        color: context.colors.tluRedColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text,
          style: const TextStyle(
              color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500)),
    );
  }

  // Widget: Nhóm theo học kỳ
  Widget _buildSemesterSection({
    required String semesterTitle,
    required double semesterGpa,
    required int credits,
    required List<GradeItem> gradeItems,
    required List<Widget> items,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black12.withOpacity(0.05)),
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        shape: const Border(),
        title: Text(semesterTitle,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87)),
        subtitle: Text(
            'academic.semester_summary'
                .tr(args: [semesterGpa.toString(), credits.toString()]),
            style: TextStyle(
                color: context.colors.tluBlueColor, // Màu xanh trường
                fontSize: 13,
                fontWeight: FontWeight.bold)),
        children: [
          SubjectGradesChart(gradeItems: gradeItems),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(children: items),
          ),
        ],
      ),
    );
  }

  // Widget: Dòng điểm từng môn
  Widget _SubjectTile(BuildContext context, GradeItem item) {
    final subject = item.enrollment.courseClass.subject;
    final score = item.scoreTotal10 ?? 0.0;

    return InkWell(
      onTap: () => _showSubjectGradeDetails(context, item),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(subject.subjectName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 14)),
                  const SizedBox(height: 4),
                  Text(
                      'academic.subject_summary'.tr(args: [
                        subject.subjectCode,
                        subject.credits.toString()
                      ]),
                      style: const TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
            Text(
              score.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: score >= 8.5
                    ? context.colors.tluIndigoColor
                    : (score >= 7.0
                        ? context.colors.tluBlueColor
                        : context.colors.tluLightBlueColor),
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.grey.shade400,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _showSubjectGradeDetails(BuildContext context, GradeItem item) {
    final subject = item.enrollment.courseClass.subject;
    final double attendance = item.scoreAttendance ?? 0.0;
    final double process = item.scoreProcess ?? 0.0;
    final double finalExam = item.scoreFinal ?? 0.0;
    final double total = item.scoreTotal10 ?? 0.0;

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                subject.subjectName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "${subject.subjectCode} • ${subject.credits} tín chỉ",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Chi tiết điểm thành phần",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              _buildGradeComponentRow(
                  "Chuyên cần", attendance, context.colors.tluBlueColor),
              _buildGradeComponentRow(
                  "Điểm quá trình", process, context.colors.tluLightBlueColor),
              _buildGradeComponentRow(
                  "Điểm thi cuối kỳ", finalExam, context.colors.tluRedColor),
              const Divider(height: 32),
              _buildGradeComponentRow(
                "Điểm tổng kết",
                total,
                total >= 8.5
                    ? context.colors.tluIndigoColor
                    : (total >= 7.0
                        ? context.colors.tluBlueColor
                        : context.colors.tluLightBlueColor),
                isBold: true,
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGradeComponentRow(String label, double score, Color color,
      {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
                  fontSize: isBold ? 14 : 13,
                  color: isBold ? Colors.black87 : Colors.grey.shade700,
                ),
              ),
              Text(
                score.toStringAsFixed(1),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isBold ? 16 : 14,
                  color: isBold ? color : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: score / 10.0,
              minHeight: isBold ? 8 : 6,
              backgroundColor: Colors.grey.shade100,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectGradesChart extends StatelessWidget {
  final List<GradeItem> gradeItems;

  const SubjectGradesChart({super.key, required this.gradeItems});

  @override
  Widget build(BuildContext context) {
    if (gradeItems.isEmpty) return const SizedBox.shrink();

    final validItems =
        gradeItems.where((item) => item.scoreTotal10 != null).toList();
    if (validItems.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 20, left: 16, right: 16),
      padding: const EdgeInsets.all(16),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Biểu đồ điểm môn học",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              Text(
                "Thang điểm 10",
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BarChart(
              BarChartData(
                maxY: 10,
                minY: 0,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 2,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.shade200,
                    strokeWidth: 1,
                    dashArray: [4, 4],
                  ),
                ),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 22,
                      getTitlesWidget: (value, meta) {
                        if (value == 0 || value > 10)
                          return const SizedBox.shrink();
                        return Text(
                          value.toStringAsFixed(0),
                          style: TextStyle(
                            color: Colors.grey.shade400,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 24,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < validItems.length) {
                          final code = validItems[index]
                              .enrollment
                              .courseClass
                              .subject
                              .subjectCode;
                          return Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Text(
                              code,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ),
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    tooltipBgColor: context.colors.tluBlueColor,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      final subjectName = validItems[group.x.toInt()]
                          .enrollment
                          .courseClass
                          .subject
                          .subjectName;
                      return BarTooltipItem(
                        "$subjectName\n${rod.toY.toStringAsFixed(2)}",
                        const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      );
                    },
                  ),
                ),
                barGroups: validItems.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final score = item.scoreTotal10 ?? 0.0;

                  final Color barColor;
                  if (score >= 8.5) {
                    barColor = context.colors.tluIndigoColor;
                  } else if (score >= 7.0) {
                    barColor = context.colors.tluBlueColor;
                  } else if (score >= 4.0) {
                    barColor = context.colors.tluLightBlueColor;
                  } else {
                    barColor = context.colors.tluRedColor;
                  }

                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: score,
                        color: barColor,
                        width: 14,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 10,
                          color: Colors.grey.shade100,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
