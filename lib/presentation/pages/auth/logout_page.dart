import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_images.dart';
import 'package:photo_social_network/app/config/app_string.dart';
import 'package:photo_social_network/app/config/route_config.dart';
import 'package:photo_social_network/data/models/user.dart';
import 'package:photo_social_network/presentation/common/button/dark_button.dart';
import 'package:photo_social_network/presentation/common/button/light_button.dart';
import 'package:photo_social_network/presentation/common/short_profile.dart';

class LogoutPage extends StatelessWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildIntroduce(),
          _buildAuthActionButton(context),
        ],
      ),
    );
  }

  Widget _buildIntroduce() {
    return Expanded(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.logoutBg),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Image.asset(AppImages.authImage, height: 54),
            ),
          ),
          Positioned(
            left: 15,
            bottom: 20,
            child: SizedBox(
              width: 200,
              child: ShortProfile(
                user: UserModel(
                  fullname: 'Pawel Czerwinsky',
                  username: 'pawel_zerwinsky',
                  avatar: AppImages.author,
                ),
                isImageFromAssets: true,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAuthActionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          Expanded(
              child: LightButton(
            text: AppString.loginUs,
            onPressed: () => Navigator.of(context).pushNamed(Routes.login),
          )),
          const SizedBox(width: 20),
          Expanded(
              child: DarkButton(
            text: AppString.registerUs,
            onPressed: () => Navigator.of(context).pushNamed(Routes.register),
          )),
        ],
      ),
    );
  }
}
