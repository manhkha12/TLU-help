import 'package:flutter/material.dart';
import 'package:tlu_students/features/chat/indicator.dart';
import 'package:tlu_students/shared/extensions/extensions.dart';
import 'package:tlu_students/shared/widgets/app_text.dart';
import 'package:tlu_students/features/localization/localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tlu_students/features/chat/cubit/chat_cubit.dart';
import 'package:tlu_students/features/chat/cubit/messaging_state.dart';
import 'package:tlu_students/features/chat/models/message_model.dart';

import 'package:intl/intl.dart';


class ChatDetailScreen extends StatefulWidget {
  final String name;
  final bool isBot;
  final String conversationId;

  const ChatDetailScreen({
    super.key,
    required this.name,
    required this.conversationId,
    this.isBot = false,
  });


  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<String> _recommendations = [
    'chat.rec_tuition'.tr(),
    'chat.rec_exams'.tr(),
    'chat.rec_scholarship'.tr(),
    'chat.rec_grades'.tr()
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  // Hàm xử lý khi nhấn gửi hoặc chọn gợi ý
  void _handleSend(String value) {
    if (value.trim().isEmpty) return;

    context.read<ChatCubit>().sendMessage(value);
    _messageController.clear();
    
    // Scroll to bottom after a short delay
    Future.delayed(const Duration(milliseconds: 100), _scrollToBottom);
  }



  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          context.read<ChatCubit>().cleanupEmptyChat();
        }
      },

      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          toolbarHeight: 70,
          leading: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: context.colors.tluBlueColor.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back_ios_new,
                  color: context.colors.tluBlueColor, size: 16),
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Row(
            children: [
              _buildAvatar(),
              const SizedBox(width: 12),
              _buildTitleInfo(),
            ],
          ),
          actions: _buildAppBarActions(),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: context.colors.tluBlueColor.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
        ),
        body: BlocConsumer<ChatCubit, MessagingState>(
          listener: (context, state) {
            if (!state.isSending) {
              Future.delayed(const Duration(milliseconds: 100), _scrollToBottom);
            }
          },
          builder: (context, state) {


            return Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: state.isLoading && state.messages.isEmpty
                        ? Center(child: CircularProgressIndicator(color: context.colors.tluBlueColor))
                        : ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                            itemCount: state.messages.length + (state.isSending ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index == state.messages.length && state.isSending) {
                                return const TypingIndicator();
                              }
                              
                              final message = state.messages[index];
                              String formattedTime = '';
                              try {
                                final date = DateTime.parse(message.createdAt);
                                formattedTime = DateFormat('HH:mm').format(date);
                              } catch (e) {
                                formattedTime = '';
                              }
                              String keyword = '';
                              if (!message.isMe && widget.isBot) {
                                for (int i = index - 1; i >= 0; i--) {
                                  if (state.messages[i].isMe) {
                                    keyword = state.messages[i].content;
                                    break;
                                  }
                                }
                              }
    
                              return _buildChatBubble(
                                context,
                                message: message.content,
                                isMe: message.isMe,
                                time: formattedTime,
                                keyword: keyword,
                              );
                            },
                          ),
                  ),
                  if (widget.isBot && !state.isSending) _buildRecommendations(),
                  _buildMessageInput(context, state.isSending),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRecommendations() {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: _recommendations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ActionChip(
              label: AppText(
                _recommendations[index],
                style: const TextStyle(fontSize: 12, color: Color(0xFF154EE7)),
              ),
              backgroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFF154EE7), width: 0.5),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () {
                // Khi nhấn vào gợi ý, điền vào ô chat và gửi luôn
                _messageController.text = _recommendations[index];
                _handleSend(_recommendations[index]);
              },
            ),
          );
        },
      ),
    );
  }
  // --- WIDGET HELPER ---

  Widget _buildAvatar() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor:
              widget.isBot ? Colors.blue.shade100 : Colors.orange.shade100,
          child: Icon(
            widget.isBot ? Icons.auto_awesome : Icons.person,
            size: 20,
            color: widget.isBot ? Colors.blue : Colors.orange,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitleInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            widget.name,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          AppText('common.online'.tr(),
              style: const TextStyle(color: Colors.green, fontSize: 11)),
        ],
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      if (!widget.isBot) ...[
        IconButton(
            icon: const Icon(Icons.phone_outlined, color: Colors.black54),
            onPressed: () {}),
        IconButton(
            icon: const Icon(Icons.videocam_outlined, color: Colors.black54),
            onPressed: () {}),
      ],
      IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black54),
          onPressed: () {}),
    ];
  }

  Widget _buildChatBubble(
      BuildContext context,
      {required String message, required bool isMe, required String time, String keyword = ''}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            constraints: const BoxConstraints(maxWidth: 300),
            decoration: BoxDecoration(
              gradient: isMe
                  ? LinearGradient(
                      colors: [context.colors.tluBlueColor, context.colors.tluBlueColor.withOpacity(0.8)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : LinearGradient(
                      colors: [Colors.grey.shade100, Colors.white],
                    ),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(isMe ? 16 : 4),
                bottomRight: Radius.circular(isMe ? 4 : 16),
              ),
              boxShadow: [
                BoxShadow(
                  color: context.colors.tluBlueColor.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: _buildMessageContent(context, message, isMe, keyword),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 4, bottom: 12),
            child: AppText(
              time,
              style: TextStyle(color: Colors.grey.shade400, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageContent(BuildContext context, String text, bool isMe, String keyword) {
    if (isMe || keyword.trim().isEmpty) {
      return AppText(
        text,
        style: TextStyle(
          color: isMe ? Colors.white : Colors.black87,
          fontSize: 14,
          height: 1.4,
        ),
      );
    }

    // Xóa các dấu câu ở cuối keyword (như ?, !, .) để match dễ hơn
    String cleanKeyword = keyword.trim().replaceAll(RegExp(r'[?!\.]+$'), '').trim();

    if (cleanKeyword.isEmpty) {
      return AppText(
        text,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 14,
          height: 1.4,
        ),
      );
    }

    final regex = RegExp(RegExp.escape(cleanKeyword), caseSensitive: false);
    final matches = regex.allMatches(text);

    if (matches.isEmpty) {
      return AppText(
        text,
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 14,
          height: 1.4,
        ),
      );
    }

    List<TextSpan> spans = [];
    int start = 0;

    for (final match in matches) {
      if (match.start > start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }
      spans.add(TextSpan(
        text: text.substring(match.start, match.end),
        style: TextStyle(color: context.colors.tluRedColor, fontWeight: FontWeight.bold),
      ));
      start = match.end;
    }
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black87, fontSize: 14, height: 1.4),
        children: spans,
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context, bool isSending) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade100)),
      ),
      child: SafeArea(
        child: Row(
          children: [
            _buildIconButton(Icons.image_outlined, context.colors.tluRedColor),
            const SizedBox(width: 8),
            _buildIconButton(Icons.attach_file, context.colors.tluRedColor),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: const Color(0xFFF3F5F7),
                    borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  controller: _messageController,
                  maxLines: null,
                  onChanged: (value) {
                    if (value.isNotEmpty && !widget.isBot) {
                      context.read<ChatCubit>().emitTyping();
                    }
                  },
                  onSubmitted: (value) {
                    if (!isSending) _handleSend(value);
                  },
                  decoration: InputDecoration(
                      hintText: 'chat.type_message'.tr(),
                      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none),
                ),
              ),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: isSending ? null : () => _handleSend(_messageController.text),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSending ? Colors.grey : context.colors.tluBlueColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.send_rounded, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFF3F5F7),
          borderRadius: BorderRadius.circular(12)),
      child: IconButton(icon: Icon(icon, color: color), onPressed: () {}),
    );
  }
}

// --- CUSTOM CLIPPER CHO BONG BÓNG CHAT ---
class ChatBubbleClipper extends CustomClipper<Path> {
  final bool isMe;
  ChatBubbleClipper(this.isMe);

  @override
  Path getClip(Size size) {
    final path = Path();
    if (isMe) {
      path.moveTo(20, 0);
      path.lineTo(size.width - 20, 0);
      path.quadraticBezierTo(size.width, 0, size.width, 15);
      path.lineTo(size.width, size.height - 15);
      path.lineTo(size.width, size.height); // Đuôi nhọn bên phải
      path.lineTo(size.width - 15, size.height - 5);
      path.lineTo(20, size.height - 5);
      path.quadraticBezierTo(0, size.height - 5, 0, size.height - 20);
      path.lineTo(0, 20);
      path.quadraticBezierTo(0, 0, 20, 0);
    } else {
      path.moveTo(20, 0);
      path.lineTo(size.width - 20, 0);
      path.quadraticBezierTo(size.width, 0, size.width, 20);
      path.lineTo(size.width, size.height - 20);
      path.quadraticBezierTo(
          size.width, size.height - 5, size.width - 20, size.height - 5);
      path.lineTo(15, size.height - 5);
      path.lineTo(0, size.height); // Đuôi nhọn bên trái
      path.lineTo(0, size.height - 15);
      path.lineTo(0, 20);
      path.quadraticBezierTo(0, 0, 20, 0);
    }
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
