import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_social_network/app/config/app_color.dart';
import 'package:photo_social_network/app/config/app_icons.dart';
import 'package:photo_social_network/data/models/user.dart';
import 'package:photo_social_network/presentation/common/short_profile.dart';

class ShowImagePage extends StatelessWidget {
  final UserModel? user;
  final String imagePath;
  const ShowImagePage({Key? key, required this.user, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(child: Image.network(imagePath, fit: BoxFit.cover)),
          _buildBlurLayer(),
          _buildShotProfile(context),
        ],
      ),
    );
  }

  Widget _buildShotProfile(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: 300,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: user != null
                          ? ShortProfile(user: user!, lightColor: true)
                          : const SizedBox(),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: SvgPicture.asset(AppIcons.close),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBlurLayer() {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      child: Container(
        height: 300,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.black,
              Colors.transparent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
