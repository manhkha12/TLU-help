import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/features/finance/cubit/finance_cubit.dart';
import 'package:tlu_students/features/finance/cubit/finance_state.dart';
import 'package:tlu_students/routes.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/extensions/num_extension.dart';
import 'package:tlu_students/models/tuition_fee.dart';
import 'package:intl/intl.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FinanceCubit, FinanceState>(
      listener: (context, state) {
        state.maybeWhen(
          paymentLinkReady: (url) {
            Navigator.pushNamed(
              context,
              RouteName.webViewPayment,
              arguments: url,
            ).then((_) {
              // Refresh data after returning from payment
              context.read<FinanceCubit>().getTuitionFees();
            });
          },
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(message)),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.colors.primaryBackground,
          appBar: AppBar(
            backgroundColor: context.colors.white,
            elevation: 0,
            title: Text(
              'Học phí',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: context.colors.textPrimary),
            ),
            centerTitle: true,
          ),
          body: state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (fees) => RefreshIndicator(
              onRefresh: () => context.read<FinanceCubit>().getTuitionFees(),
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: fees.length,
                itemBuilder: (context, index) {
                  final fee = fees[index];
                  return _buildTuitionCard(context, fee);
                },
              ),
            ),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(message),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<FinanceCubit>().getTuitionFees(),
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            ),
            orElse: () => const Center(child: Text('Không có dữ liệu')),
          ),
        );
      },
    );
  }

  Widget _buildTuitionCard(BuildContext context, TuitionFee fee) {
    final isUnpaid = fee.status == 'UNPAID';
    final statusColor = _getStatusColor(context, fee.status);
    final statusText = _getStatusText(fee.status);

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            RouteName.tuitionDetail,
            arguments: fee.semester.id,
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding:  EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fee.semester.semesterName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: context.colors.tluBlueColor,
                          ),
                        ),
                        Text(
                          'Năm học: ${fee.semester.academicYear}',
                          style: TextStyle(
                              color: context.colors.textSecondary, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: statusColor.withOpacity(0.5)),
                    ),
                    child: Text(
                      statusText,
                      style: TextStyle(
                        color: statusColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 24),
              _buildInfoRow(context, 'Tổng tiền:', fee.totalAmount.toCurrency()),
              _buildInfoRow(context, 
                  'Miễn giảm:', '- ${fee.discountAmount.toCurrency()}',
                  valueColor: context.colors.tluRedColor),
              _buildInfoRow(context, 'Phải đóng:', fee.finalAmount.toCurrency(),
                  isBold: true),
              if (fee.deadline != null)
                _buildInfoRow(context, 
                  'Hạn nộp:',
                  DateFormat('dd/MM/yyyy').format(fee.deadline!),
                  valueColor: isUnpaid ? context.colors.tluRedColor : null,
                ),
              if (isUnpaid) ...[
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<FinanceCubit>().payTuition(fee.id);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.tluBlueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'Thanh toán ngay',
                      style: TextStyle(
                        color: context.colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value,
      {bool isBold = false, Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: context.colors.textSecondary)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? 16 : 14,
              color: valueColor ?? context.colors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(BuildContext context, String status) {
    switch (status) {
      case 'PAID':
        return context.colors.tluIndigoColor;
      case 'UNPAID':
        return context.colors.tluRedColor;
      case 'OVERDUE':
        return context.colors.tluRedColor;
      default:
        return context.colors.textSecondary;
    }
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'PAID':
        return 'Đã đóng';
      case 'UNPAID':
        return 'Chưa đóng';
      case 'OVERDUE':
        return 'Quá hạn';
      default:
        return status;
    }
  }
}
