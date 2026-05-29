import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tlu_students/features/localization/localizations.dart';
import 'package:tlu_students/features/service/cubit/service_cubit.dart';
import 'package:tlu_students/features/service/cubit/service_state.dart';
import 'package:tlu_students/features/service/widgets/request_detail_bottom_sheet.dart';
import 'package:tlu_students/models/document_type.dart';
import 'package:tlu_students/models/service_request.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primaryBackground,
      appBar: AppBar(
        backgroundColor: context.colors.white,
        elevation: 0,
        title: AppText(
          'service.title'.tr(),
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: context.colors.textPrimary,
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.history, color: Colors.black),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              color: context.colors.white,
              child: TabBar(
                indicatorColor: context.colors.tluBlueColor,
                labelColor: context.colors.tluBlueColor,
                unselectedLabelColor: context.colors.textSecondary,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                tabs: [
                  Tab(text: 'service.forms_tab'.tr()),
                  Tab(text: 'service.history_tab'.tr()),
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<ServiceCubit, ServiceState>(
                builder: (context, state) {
                  if (state.isLoading && state.requests.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return TabBarView(
                    children: [
                      // Tab 1: Forms
                      _buildFormsTab(context, state),
                      // Tab 2: History
                      _buildHistoryTab(context, state),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormsTab(BuildContext context, ServiceState state) {
    final latestRequest =
        state.requests.isNotEmpty ? state.requests.first : null;

    return RefreshIndicator(
      onRefresh: () => context.read<ServiceCubit>().init(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (latestRequest != null) ...[
              _buildActiveRequestCard(context, latestRequest),
              const SizedBox(height: 24),
            ],
            AppText(
              'service.available_forms'.tr(),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: context.colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  ...state.documentTypes.asMap().entries.map((entry) {
                    final index = entry.key;
                    final type = entry.value;
                    return Column(
                      children: [
                        _buildFormItem(context, type: type),
                        if (index < state.documentTypes.length - 1)
                          Divider(height: 1, color: context.colors.divider),
                      ],
                    );
                  }),
                ],
              ),
            ),
            if (state.documentTypes.isEmpty && !state.isLoading)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: AppText('common.no_data'.tr(), color: context.colors.textSecondary),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryTab(BuildContext context, ServiceState state) {
    return RefreshIndicator(
      onRefresh: () => context.read<ServiceCubit>().init(),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: state.requests.length,
        itemBuilder: (context, index) {
          final request = state.requests[index];
          return _buildHistoryItem(context, request);
        },
      ),
    );
  }

  Widget _buildHistoryItem(BuildContext context, ServiceRequest request) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: context.colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.colors.lightBorder),
      ),
      child: ListTile(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => BlocProvider.value(
              value: context.read<ServiceCubit>(),
              child: RequestDetailBottomSheet(request: request),
            ),
          );
        },
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: context.colors.tluBlueColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.description_outlined,
              color: context.colors.tluBlueColor, size: 22),
        ),
        title: AppText(
          request.documentType?.documentName ??
              'service.student_confirmation'.tr(),
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        subtitle: AppText(
          request.createdAt.format('dd/MM/yyyy HH:mm'),
          fontSize: 12,
          color: context.colors.textSecondary,
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: _getStatusColor(context, request.status).withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: AppText(
            request.status.name.toUpperCase(),
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: _getStatusColor(context, request.status),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(BuildContext context, ServiceRequestStatus status) {
    switch (status) {
      case ServiceRequestStatus.pending:
        return context.colors.tluLightBlueColor;
      case ServiceRequestStatus.processing:
        return context.colors.tluBlueColor;
      case ServiceRequestStatus.completed:
        return context.colors.tluIndigoColor; // TLU Indigo
      case ServiceRequestStatus.cancelled:
        return context.colors.tluRedColor;
      default:
        return context.colors.textSecondary;
    }
  }
}

Widget _buildActiveRequestCard(BuildContext context, ServiceRequest request) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: context.colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: context.colors.black.withOpacity(0.04),
          blurRadius: 15,
          offset: const Offset(0, 4),
        )
      ],
      border: Border.all(color: context.colors.lightBorder),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: context.colors.tluBlueColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: AppText(
                'REQUEST ID: #${request.id}',
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: context.colors.tluBlueColor,
              ),
            ),
            Icon(Icons.description_outlined,
                color: context.colors.tluBlueColor, size: 28),
          ],
        ),
        const SizedBox(height: 16),
        AppText(
          request.documentType?.documentName ??
              'service.student_confirmation'.tr(),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: context.colors.textPrimary,
        ),
        const SizedBox(height: 24),
        _buildVerticalTimeline(context, request),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) => BlocProvider.value(
                  value: context.read<ServiceCubit>(),
                  child: RequestDetailBottomSheet(request: request),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.tluBlueColor.withOpacity(0.1),
              foregroundColor: context.colors.tluBlueColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.info_outline, size: 18),
                const SizedBox(width: 8),
                AppText('service.view_details'.tr(),
                    fontWeight: FontWeight.bold),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildVerticalTimeline(BuildContext context, ServiceRequest request) {
  final status = request.status;

  return Column(
    children: [
      _buildTimelineStep(
        context,
        title: 'service.status_submitted'.tr(),
        subtitle: request.createdAt.format('MMM d, h:mm a'),
        isCompleted: true,
        isActive: status == ServiceRequestStatus.pending,
        isLast: false,
      ),
      _buildTimelineStep(
        context,
        title: 'service.status_processing'.tr(),
        subtitle: 'Estimated: 1-2 business days',
        description: 'Office of Academic Affairs',
        isCompleted: status != ServiceRequestStatus.pending,
        isActive: status == ServiceRequestStatus.processing,
        isLast: false,
      ),
      _buildTimelineStep(
        context,
        title: 'service.status_completed'.tr(),
        subtitle: 'Notification will be sent',
        isCompleted: status == ServiceRequestStatus.completed,
        isActive: status == ServiceRequestStatus.completed,
        isLast: true,
      ),
    ],
  );
}

Widget _buildTimelineStep(
  BuildContext context, {
  required String title,
  required String subtitle,
  String? description,
  required bool isCompleted,
  required bool isActive,
  required bool isLast,
}) {
  final color =
      isCompleted ? context.colors.tluBlueColor : context.colors.disabledInputBorder;

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: isCompleted ? context.colors.tluBlueColor : context.colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: isCompleted
                    ? context.colors.tluBlueColor
                    : context.colors.disabledInputBorder,
                width: 2,
              ),
            ),
            child: isCompleted
                ? Icon(Icons.check, size: 16, color: context.colors.white)
                : isActive
                    ? Icon(Icons.refresh,
                        size: 16, color: context.colors.tluBlueColor)
                    : null,
          ),
          if (!isLast)
            Container(
              width: 2,
              height: 40,
              color: isCompleted
                  ? context.colors.tluBlueColor
                  : context.colors.divider,
            ),
        ],
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              title,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isCompleted ? context.colors.textPrimary : context.colors.textSecondary,
            ),
            const SizedBox(height: 2),
            AppText(
              subtitle,
              fontSize: 13,
              color: context.colors.textSecondary,
            ),
            if (description != null) ...[
              const SizedBox(height: 4),
              AppText(
                description,
                fontSize: 13,
                color: context.colors.textTerrary,
              ),
            ],
            if (!isLast) const SizedBox(height: 20),
          ],
        ),
      ),
    ],
  );
}

Widget _buildFormItem(BuildContext context, {required DocumentType type}) {
  IconData icon;

  final name = type.documentName.toLowerCase();
  final idString = type.id.toString();
  if (name.contains('transcript') || idString == '2') {
    icon = Icons.assignment_outlined;
  } else if (name.contains('confirmation') ||
      name.contains('chứng nhận') ||
      idString == '5') {
    icon = Icons.assignment_ind_outlined;
  } else if (name.contains('id card') || idString == '4') {
    icon = Icons.badge_outlined;
  } else {
    icon = Icons.description_outlined;
  }

  return ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    onTap: () {
      _showConfirmDialog(context, type);
    },
    leading: Icon(icon, color: context.colors.textPrimary, size: 26),
    title: AppText(
      type.documentName,
      fontSize: 16,
      color: context.colors.textPrimary,
    ),
    trailing: Icon(Icons.chevron_right, color: context.colors.textSecondary, size: 20),
  );
}

void _showConfirmDialog(BuildContext context, DocumentType documentType) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Icon(Icons.description_outlined, color: context.colors.tluBlueColor),
            const SizedBox(width: 12),
            Expanded(
              child: AppText(
                'service.confirm_request_title'.tr(),
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: context.colors.textPrimary,
              ),
            ),
          ],
        ),
        content: AppText(
          'service.confirm_request_content'.tr(args: [documentType.documentName]),
          fontSize: 15,
          color: context.colors.textPrimary,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: AppText(
              'common.cancel'.tr(),
              color: Colors.grey.shade600,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<ServiceCubit>().createRequest(documentType.id, null);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colors.tluBlueColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
            ),
            child: AppText(
              'common.confirm'.tr(),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      );
    },
  );
}
