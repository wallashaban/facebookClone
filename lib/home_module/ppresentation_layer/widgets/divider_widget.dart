import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(.0.r),
      child: Divider(
        height: 3.h,
        thickness: 2.h,
        color: AppColors.darkGrey,
      ),
    );
  }
}
