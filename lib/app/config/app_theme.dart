import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_color.dart';

class AppTheme {
  static final light = ThemeData.light();
  static final dark = ThemeData.dark();
  static final general = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColor.white,
    fontFamily: 'Roboto',
    // ignore: deprecated_member_use
    androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
    dividerColor: AppColor.lightGrey,
  );
}
