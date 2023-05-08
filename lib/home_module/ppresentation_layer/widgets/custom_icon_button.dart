import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double iconSize;
  final Color? color;
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.iconSize = 30.0,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.all(6.0.r),
      decoration: BoxDecoration(color: AppColors.gray, shape: BoxShape.circle),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: iconSize,
            color: color,
          )),
    );
  }
}
