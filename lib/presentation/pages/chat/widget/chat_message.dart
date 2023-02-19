import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_color.dart';
import 'package:photo_social_network/app/config/app_text_style.dart';
import 'package:photo_social_network/data/models/message.dart';

class ChatMessage extends StatelessWidget {
  final String uid;
  final String avatar;
  final Message message;

  const ChatMessage(
      {Key? key,
      required this.uid,
      required this.message,
      required this.avatar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message.senderId == uid) {
      return Row(
        children: [
          _buildMessageContent(),
          const SizedBox(width: 16),
          _buildAvatar(),
        ],
      );
    }
    return Row(
      children: [
        _buildAvatar(),
        const SizedBox(width: 16),
        _buildMessageContent(alignRight: true),
      ],
    );
  }

  Widget _buildMessageContent({bool alignRight = false}) {
    return Expanded(
      child: Row(
        mainAxisAlignment:
            alignRight ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              borderRadius: BorderRadius.only(
                topLeft: alignRight ? Radius.zero : const Radius.circular(6),
                topRight: alignRight ? const Radius.circular(6) : Radius.zero,
                bottomLeft: const Radius.circular(6),
                bottomRight: const Radius.circular(6),
              ),
            ),
            child: Text(message.message, style: AppTextStyle.blackW400Medium),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 14,
      backgroundImage: NetworkImage(avatar),
    );
  }
}
