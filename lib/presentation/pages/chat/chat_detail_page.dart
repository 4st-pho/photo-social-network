import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_color.dart';
import 'package:photo_social_network/app/config/app_text_style.dart';
import 'package:photo_social_network/data/models/room.dart';
import 'package:photo_social_network/presentation/pages/chat/widget/chat_message.dart';

class ChatDetailPage extends StatefulWidget {
  final Room room;
  const ChatDetailPage({Key? key, required this.room}) : super(key: key);

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.room.friendname(myId: '123'),
          style: AppTextStyle.blackW600extraLarge,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColor.lightGrey),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: widget.room.messages.length,
        separatorBuilder: (context, _) => const SizedBox(height: 24),
        itemBuilder: (context, index) {
          final message = widget.room.messages[index];
          return ChatMessage(
            uid: '123',
            message: message,
            avatar: message.senderId == '123'
                ? widget.room.myAvatar(myId: '123')
                : widget.room.friendAvatar(myId: '123'),
          );
        },
      ),
    );
  }
}
