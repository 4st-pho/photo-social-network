import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/route_config.dart';
import 'package:photo_social_network/data/models/user.dart';
import 'package:photo_social_network/presentation/common/short_profile.dart';

class NewsCard extends StatelessWidget {
  final String imagePath;
  final UserModel user;
  const NewsCard({Key? key, required this.user, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: screenWidth - 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => Navigator.of(context)
                .pushNamed(Routes.showImage, arguments: [user, imagePath]),
            child: SizedBox(
              width: screenWidth - 32,
              height: screenWidth - 32,
              child: Image.network(imagePath),
            ),
          ),
          const SizedBox(height: 8),
          ShortProfile(user: user)
        ],
      ),
    );
  }
}
