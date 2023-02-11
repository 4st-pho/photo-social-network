import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_color.dart';
import 'package:photo_social_network/app/config/app_text_style.dart';

class CustomBottomNaviagtionBarItem extends StatelessWidget {
  const CustomBottomNaviagtionBarItem(
      {super.key,
      required this.icon,
      required this.label,
      this.isSelected = false,
      required this.ontap});
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColor.primary : AppColor.darkGrey;
    final textStyle = isSelected
        ? AppTextStyle.redW400Medium
        : AppTextStyle.darkGreyW400Medium;
    final screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
        child: InkWell(
      onTap: ontap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIcon(color),
          _buildLabel(textStyle),
          _buildBottomBar(screenWidth)
        ],
      ),
    ));
  }

  Widget _buildIcon(Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: 8),
      child: Icon(icon, color: color),
    );
  }

  Widget _buildLabel(TextStyle textStyle) {
    return Text(
      label,
      style: textStyle,
      maxLines: 1,
    );
  }

  Widget _buildBottomBar(double screenWidth) {
    final color = isSelected ? AppColor.primary : Colors.transparent;
    return Container(
      width: double.infinity,
      height: 5,
      margin: EdgeInsets.only(
        left: screenWidth / 14,
        right: screenWidth / 14,
        top: 4,
      ),
      padding: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }
}
