import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/features/localization/localizations.dart';
import 'package:tlu_students/features/service/cubit/service_cubit.dart';
import 'package:tlu_students/models/service_request.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';
import 'package:tlu_students/shared/widgets/buttons/app_button.dart';
import 'package:url_launcher/url_launcher.dart';

class RequestDetailBottomSheet extends StatelessWidget {
  final ServiceRequest request;

  const RequestDetailBottomSheet({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final isPending = request.status == ServiceRequestStatus.pending;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
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
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppText(
                  request.documentType?.documentName ?? 'service.student_confirmation'.tr(),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildStatusBadge(context, request.status),
            ],
          ),
          const SizedBox(height: 8),
          AppText(
            'service.request_id'.tr(args: [request.id.toString()]),
            color: Colors.grey,
            fontSize: 12,
          ),
          if (request.reason != null && request.reason!.isNotEmpty) ...[
            const SizedBox(height: 20),
            AppText(
              'service.reason_label'.tr(),
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              child: AppText(request.reason!),
            ),
          ],
          if (request.attachmentUrl != null) ...[
            const SizedBox(height: 16),
            AppText('service.attachment_label'.tr(), fontWeight: FontWeight.bold),
            const SizedBox(height: 8),
            InkWell(
              onTap: () async {
                final url = Uri.parse(request.attachmentUrl!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.colors.tluBlueColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: context.colors.tluBlueColor.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.picture_as_pdf, color: context.colors.tluBlueColor),
                    const SizedBox(width: 12),
                    Expanded(
                      child: AppText(
                        request.attachmentUrl!.split('/').last,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        color: context.colors.tluBlueColor,
                      ),
                    ),
                    const Icon(Icons.open_in_new, size: 18, color: Colors.grey),
                  ],
                ),
              ),
            ),
          ],
          if (request.status == ServiceRequestStatus.rejected && request.rejectionReason != null) ...[
            const SizedBox(height: 16),
            AppText(
              'service.rejection_reason'.tr(args: [request.rejectionReason!]),
              color: context.colors.tluRedColor,
              fontWeight: FontWeight.bold,
            ),
          ],
          const SizedBox(height: 24),
          if (isPending)
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: 'common.delete'.tr(),
                    primaryColor: context.colors.tluRedColor,
                    onPressed: () {
                      context.read<ServiceCubit>().deleteRequest(request.id);
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppButton(
                    label: 'common.edit'.tr(),
                    primaryColor: context.colors.tluBlueColor,
                    onPressed: () {
                      // Logic for edit can be added here
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            )
          else
            AppButton(
              label: 'common.close'.tr(),
              onPressed: () => Navigator.pop(context),
            ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, ServiceRequestStatus status) {
    Color color;
    String label;

    switch (status) {
      case ServiceRequestStatus.pending:
        color = Colors.orange;
        label = 'service.status_pending'.tr();
        break;
      case ServiceRequestStatus.processing:
        color = context.colors.tluBlueColor;
        label = 'service.status_processing'.tr();
        break;
      case ServiceRequestStatus.completed:
        color = Colors.teal;
        label = 'service.status_completed'.tr();
        break;
      case ServiceRequestStatus.rejected:
        color = context.colors.tluRedColor;
        label = 'service.status_rejected'.tr();
        break;
      case ServiceRequestStatus.cancelled:
        color = Colors.grey;
        label = 'service.status_cancelled'.tr();
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color),
      ),
      child: AppText(
        label,
        color: color,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
