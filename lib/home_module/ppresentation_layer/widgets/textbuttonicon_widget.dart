import 'package:flutter/material.dart';

import '../../../core/utils/exports.dart';

class CustomTextIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final double size;
  final VoidCallback onPressed;
  final Color color;
  final Color? iconColor;
  final double? iconSize;
  const CustomTextIcon({
    Key? key,
    required this.icon,
    required this.text,
    required this.size,
    required this.onPressed,
    required this.color,
    this.iconColor,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
      label: CustomText(
        text: text,
        size: size,
        color: color,
      ),
    );
  }
}
