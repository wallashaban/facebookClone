import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double size;
  final FontWeight fontWeight;
  final double height;
  final double width;
  final Color color;
  final IconData icon;
  final Color foreGroundColor;
  const CustomButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
    required this.size,
    this.height = 60,
    this.foreGroundColor=AppColors.white,
    this.color = Colors.blue,
    this.width = double.infinity,
    this.fontWeight = FontWeight.bold,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon),
          label: CustomText(
            text: text,
            size: size,
            fontWeight: fontWeight,
          ),
          style: ElevatedButton.styleFrom(foregroundColor: foreGroundColor,
          backgroundColor: color),
        ),
      ),
    );
  }
}
