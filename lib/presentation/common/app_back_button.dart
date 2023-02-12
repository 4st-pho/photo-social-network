import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_icons.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const AppBackButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? () => Navigator.of(context).pop(),
      icon: Image.asset(AppIcons.back, width: 11),
    );
  }
}
