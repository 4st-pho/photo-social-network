import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_text_style.dart';

class ShortProfile extends StatelessWidget {
  final String username;
  final String shortName;
  final String imagePath;
  final bool isImageFromAssets;
  const ShortProfile(
      {Key? key,
      required this.username,
      required this.shortName,
      required this.imagePath,
      this.isImageFromAssets = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundImage: (isImageFromAssets
              ? AssetImage(imagePath)
              : NetworkImage(imagePath) as ImageProvider),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: AppTextStyle.blackW700Medium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '@$shortName',
                style: AppTextStyle.blackW400Small,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ))
      ],
    );
  }
}
