import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/route_config.dart';
import 'package:photo_social_network/presentation/pages/chat/widget/short_message.dart';
import 'package:provider/provider.dart';
import 'package:photo_social_network/app/config/app_color.dart';
import 'package:photo_social_network/app/config/app_string.dart';
import 'package:photo_social_network/app/config/app_text_style.dart';
import 'package:photo_social_network/data/models/room.dart';
import 'package:photo_social_network/presentation/bloc/chat_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late final ChatBloc _chatBloc;
  @override
  void initState() {
    _chatBloc = context.read<ChatBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          AppString.chats,
          style: AppTextStyle.blackW600extraLarge,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(height: 1, color: AppColor.lightGrey),
        ),
      ),
      body: StreamBuilder<List<Room>>(
          stream: _chatBloc.roomsDataStream,
          initialData: const [],
          builder: (context, snapshot) {
            final rooms = snapshot.data ?? [];
            return ListView.builder(
              itemBuilder: (context, index) {
                final room = rooms[index];
                final lastMessage = room.lastMessage;
                return Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed(Routes.chatDetail, arguments: room),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: AppColor.lightGrey,
                            ),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16),
                        child: ShortMessage(
                          avatar: room.friendAvatar(myId: '123'),
                          message: lastMessage.message,
                          fullname: lastMessage.senderId == '123'
                              ? 'You'
                              : room.friendname(myId: '123'),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: rooms.length,
            );
          }),
    );
  }
}
