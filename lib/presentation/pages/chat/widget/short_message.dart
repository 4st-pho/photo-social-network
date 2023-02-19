import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_text_style.dart';

class ShortMessage extends StatelessWidget {
  final String avatar;
  final String fullname;
  final String message;

  const ShortMessage({
    Key? key,
    required this.avatar,
    required this.fullname,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 32, backgroundImage: NetworkImage(avatar)),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(fullname, style: AppTextStyle.blackW700Medium),
              Text(message, style: AppTextStyle.blackW400Medium, maxLines: 1),
            ],
          ),
        )
      ],
    );
  }
}
