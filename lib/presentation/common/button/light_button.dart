import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_color.dart';
import 'package:photo_social_network/app/config/app_text_style.dart';

class LightButton extends StatelessWidget {
  const LightButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: const BorderSide(color: AppColor.black, width: 2),
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        primary: AppColor.white,
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(text, style: AppTextStyle.blackW900Medium),
    );
  }
}
