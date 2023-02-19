import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_text_style.dart';
import 'package:photo_social_network/data/models/user.dart';

class ShortProfile extends StatelessWidget {
  final UserModel user;
  final bool isImageFromAssets;
  final bool lightColor;
  const ShortProfile({
    Key? key,
    this.isImageFromAssets = false,
    required this.user,
    this.lightColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundImage: (isImageFromAssets
              ? AssetImage(user.avatar)
              : NetworkImage(user.avatar) as ImageProvider),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.fullname,
                  style: lightColor
                      ? AppTextStyle.whiteW700Medium
                      : AppTextStyle.blackW700Medium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '@${user.username}',
                  style: lightColor
                      ? AppTextStyle.whiteW400Small
                      : AppTextStyle.blackW400Small,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
