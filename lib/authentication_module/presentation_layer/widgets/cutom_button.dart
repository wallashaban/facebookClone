import 'package:flutter/material.dart';

import '../../../core/utils/exports.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double size;
  final FontWeight fontWeight;
  final double height;
  final double width;
  final Color color;
  final double radius;
  final Color? textColor;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.size,
    this.textColor,
    this.radius = 0,
    this.height = 60,
    this.color = AppColors.facebookBlue,
    this.width = double.infinity,
    this.fontWeight = FontWeight.bold,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 15,
          animationDuration: const Duration(milliseconds: 750),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
        ),
        onPressed: onPressed,
        child: CustomText(
          text: text,
          size: size,
          fontWeight: fontWeight,
          color: textColor,
        ),
      ),
    );
  }
}
