import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/models/chat_session.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/features/localization/localizations.dart';
import 'package:tlu_students/routes.dart';

import 'package:tlu_students/features/chat/cubit/chat_cubit.dart';
import 'package:tlu_students/features/chat/cubit/messaging_state.dart';
import 'package:tlu_students/features/chat/models/conversation_model.dart';

import 'package:intl/intl.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back_ios_new,
        //       color: Colors.black, size: 20),
        //   onPressed: () => Navigator.pop(context),
        // ),
        title: AppText(
          'chat.title'.tr(),
          style: TextStyle(
              color: context.colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit_note,
                color: context.colors.tluBlueColor, size: 28),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: BlocBuilder<ChatCubit, MessagingState>(
        builder: (context, state) {
          if (state.isLoading && state.conversations.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              // 1. Thanh tìm kiếm
              _buildSearchBar(context),

              // 2. Danh sách Active Users (Stories) - Mockup
              // _buildActiveUsers(context),

              const Divider(height: 1, thickness: 0.5),

              // 3. Danh sách tin nhắn
              if (state.searchResults.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: state.searchResults.length,
                    itemBuilder: (context, index) {
                      final user = state.searchResults[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: user.avatarUrl != null
                              ? NetworkImage(user.avatarUrl!)
                              : null,
                          child: user.avatarUrl == null
                              ? const Icon(Icons.person)
                              : null,
                        ),
                        title: AppText(user.fullName,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: AppText(
                            '${user.code ?? ''}${user.subtitle != null ? ' • ${user.subtitle}' : ''}'),
                        onTap: () async {
                          final navigator = Navigator.of(context);
                          final conversation = await context
                              .read<ChatCubit>()
                              .createConversation(user.userId);
                          if (conversation != null) {
                            navigator.pushNamed(
                              RouteName.chatDetail,
                              arguments: {
                                'name': conversation.partner.fullName,
                                'conversationId': conversation.id,
                                'isBot': false,
                              },
                            );
                          }
                        },
                      );
                    },
                  ),
                )
              else
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      context.read<ChatCubit>().getConversations();
                      context.read<ChatCubit>().getAiSessions();
                    },
                    child: Builder(
                      builder: (context) {
                        final List<dynamic> combinedList = [
                          ...state.aiSessions,
                          ...state.conversations
                        ];
                        combinedList.sort((a, b) {
                          String? tA = (a is ChatSession)
                              ? a.lastMessageAt
                              : (a is ConversationModel
                                  ? a.lastMessageAt
                                  : null);
                          String? tB = (b is ChatSession)
                              ? b.lastMessageAt
                              : (b is ConversationModel
                                  ? b.lastMessageAt
                                  : null);
                          return (DateTime.tryParse(tB ?? '') ?? DateTime(0))
                              .compareTo(
                                  DateTime.tryParse(tA ?? '') ?? DateTime(0));
                        });

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: 1 + combinedList.length,
                          itemBuilder: (context, index) {
                            if (index == 0)
                              return _buildAIChatItem(context, state);

                            final item = combinedList[index - 1];
                            if (item is ChatSession) {
                              return _buildAiSessionItem(context, item);
                            }

                            if (item is ConversationModel) {
                              return Column(
                                children: [
                                  _buildChatItem(context, conversation: item),
                                  const Divider(
                                      height: 1, indent: 80, thickness: 0.2),
                                ],
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        );
                      },
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAiSessionItem(BuildContext context, ChatSession session) {
    String formattedTime = '';
    if (session.lastMessageAt != null) {
      try {
        DateTime time = DateTime.parse(session.lastMessageAt!);
        formattedTime = DateFormat('HH:mm').format(time);
      } catch (_) {}
    }

    // Tiêu đề là câu hỏi đầu tiên của user (ưu tiên firstMessage, fallback lastMessage)
    final String sessionTitle =
        session.firstMessage ?? session.lastMessage ?? 'AI Assistant Session';
    // Subtitle là tin nhắn mới nhất
    final String lastMessage = session.lastMessage ?? 'Click to view history';

    return Column(
      children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.history, color: Colors.blue),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppText(
                  sessionTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 8),
              AppText(formattedTime,
                  style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: AppText(
              lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
          onTap: () {
            context.read<ChatCubit>().selectAiSession(session.id);
            Navigator.pushNamed(
              context,
              RouteName.chatDetail,
              arguments: {
                'name': 'AI Assistant',
                'conversationId': 'ai',
                'isBot': true,
              },
            );
          },
        ),
        const Divider(indent: 80, height: 1, thickness: 0.2),
      ],
    );
  }

  // Widget dành riêng cho AI Bot
  Widget _buildAIChatItem(BuildContext context, MessagingState state) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      tileColor: Colors.blue.withOpacity(0.03), // Làm nổi bật nhẹ vùng AI
      leading: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.colors.tluBlueColor,
              context.colors.tluBlueColor.withOpacity(0.7)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(Icons.auto_awesome, color: Colors.white, size: 28),
      ),
      title: Row(
        children: [
          AppText('chat.ai_assistant'.tr(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: context.colors.tluBlueColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: AppText('common.pro'.tr(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: AppText(
          'chat.ai_hint'.tr(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: context.colors.tluBlueColor, fontWeight: FontWeight.w500),
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
      onTap: () {
        context.read<ChatCubit>().createNewAiChat();

        Navigator.pushNamed(
          context,
          RouteName.chatDetail,
          arguments: {
            'name': 'AI Assistant',
            'conversationId': 'ai',
            'isBot': true,
          },
        );
      },
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F5F7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          onChanged: (value) => context.read<ChatCubit>().searchUsers(value),
          decoration: InputDecoration(
            hintText: 'chat.search_hint'.tr(),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            icon: const Icon(Icons.search, color: Colors.grey, size: 20),
          ),
        ),
      ),
    );
  }

  Widget _buildActiveUsers(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: 3,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildAddStory();
          }
          return _buildActiveAvatar();
        },
      ),
    );
  }

  Widget _buildAddStory() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Color(0xFFF3F5F7),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.black),
          ),
          const SizedBox(height: 8),
          AppText('common.you'.tr(),
              style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildActiveAvatar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?u=avatar'),
              ),
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          AppText('common.student'.tr(), style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildChatItem(
    BuildContext context, {
    required ConversationModel conversation,
  }) {
    String formattedTime = '';
    if (conversation.lastMessage != null) {
      try {
        final date = DateTime.parse(conversation.lastMessage!.createdAt);
        formattedTime = DateFormat('HH:mm').format(date);
      } catch (e) {
        formattedTime = '';
      }
    }

    return Dismissible(
      key: Key(conversation.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        // context.read<MessagingCubit>().deleteConversation(conversation.id);
      },
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blue.shade50,
              backgroundImage: conversation.partner.avatarUrl != null
                  ? NetworkImage(conversation.partner.avatarUrl!)
                  : null,
              child: conversation.partner.avatarUrl == null
                  ? const Icon(Icons.person, color: Colors.blue)
                  : null,
            ),
            if (conversation.unreadCount > 0)
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  constraints:
                      const BoxConstraints(minWidth: 16, minHeight: 16),
                  child: Text(
                    '${conversation.unreadCount}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: AppText(
                conversation.partner.fullName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: conversation.unreadCount > 0
                        ? FontWeight.bold
                        : FontWeight.w600,
                    fontSize: 16),
              ),
            ),
            const SizedBox(width: 8),
            AppText(formattedTime,
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              Expanded(
                child: AppText(
                  conversation.lastMessage?.content ?? 'chat.no_messages'.tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: conversation.unreadCount > 0
                        ? Colors.black87
                        : Colors.grey,
                    fontWeight: conversation.unreadCount > 0
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          context.read<ChatCubit>().selectConversation(conversation.id);
          Navigator.pushNamed(
            context,
            RouteName.chatDetail,
            arguments: {
              'name': conversation.partner.fullName,
              'conversationId': conversation.id,
              'isBot': false,
            },
          );
        },
      ),
    );
  }
}
