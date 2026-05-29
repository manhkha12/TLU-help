import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tlu_students/features/notification/cubit/notification_cubit.dart';
import 'package:tlu_students/features/notification/cubit/notification_state.dart';
import 'package:tlu_students/models/notification_model.dart';
import 'package:tlu_students/routes.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';
import 'package:tlu_students/features/localization/localizations.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().getNotifications();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<NotificationCubit>().getNotifications(isLoadMore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      appBar: AppBar(
        backgroundColor: context.colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,
              color: context.colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: AppText(
          'notification.title'.tr(),
          style: TextStyle(
            color: context.colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.done_all, color: context.colors.black),
            onPressed: () {
              context.read<NotificationCubit>().markAllAsRead();
            },
            tooltip: 'notification.mark_all_read'.tr(),
          ),
        ],
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!state.isSuccess) {
            return Center(child: AppText('notification.error_load'.tr()));
          }
          if (state.notifications.isEmpty) {
            return Center(child: AppText('notification.no_notifications'.tr()));
          }

          return ListView.builder(
            controller: _scrollController,
            itemCount:
                state.notifications.length + (state.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= state.notifications.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              final notification = state.notifications[index];
              return _buildNotificationItem(context, notification);
            },
          );
        },
      ),
    );
  }

  Widget _buildNotificationItem(
      BuildContext context, NotificationModel notification) {
    final bool isUnread = !notification.isRead;

    return Dismissible(
      key: Key(notification.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: context.colors.textError,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        context.read<NotificationCubit>().deleteNotification(notification.id);
      },
      child: InkWell(
        onTap: () {
          if (isUnread) {
            context.read<NotificationCubit>().markAsRead(notification.id);
          }
          context
              .read<NotificationCubit>()
              .getDetailNotification(notification.id);

          _showNotificationDetail(context, notification);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isUnread
                ? context.colors.tluBlueColor.withOpacity(0.05)
                : context.colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: context.colors.divider,
              width: 1,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      notification.title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight:
                            isUnread ? FontWeight.w900 : FontWeight.bold,
                        color: isUnread
                            ? context.colors.black
                            : context.colors.black.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 6),
                    AppText(
                      notification.message,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: isUnread
                            ? context.colors.black.withOpacity(0.9)
                            : context.colors.black.withOpacity(0.6),
                        fontWeight:
                            isUnread ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        AppText(
                          _formatTime(notification.createdAt.toLocal()),
                          style: TextStyle(
                            fontSize: 13,
                            color: isUnread
                                ? context.colors.tluBlueColor
                                : Colors.grey[600],
                            fontWeight:
                                isUnread ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            if (isUnread) {
                              context
                                  .read<NotificationCubit>()
                                  .markAsRead(notification.id);
                            }
                            _showNotificationDetail(context, notification);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: AppText(
                            'Chi tiết',
                            style: TextStyle(
                              color: context.colors.blue,
                              fontSize: 13,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Unread dot
              if (isUnread) ...[
                const SizedBox(width: 8),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.colors.tluBlueColor,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  void _showNotificationDetail(
      BuildContext context, NotificationModel notification) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  notification.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: context.colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                AppText(
                  _formatTime(notification.createdAt.toLocal()),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                Divider(color: context.colors.divider),
                const SizedBox(height: 16),
                AppText(
                  notification.message,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: context.colors.black.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colors.tluBlueColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: AppText(
                      'common.close'.tr(),
                      style: TextStyle(
                        color: context.colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays > 0) {
      return 'common.days_ago'.tr(args: [difference.inDays.toString()]);
    } else if (difference.inHours > 0) {
      return 'common.hours_ago'.tr(args: [difference.inHours.toString()]);
    } else if (difference.inMinutes > 0) {
      return 'common.minutes_ago'.tr(args: [difference.inMinutes.toString()]);
    } else {
      return 'common.just_now'.tr();
    }
  }
}
