import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';

class NotificationWidget extends StatelessWidget {
  final notifications;
  const NotificationWidget({
    Key? key,
    required this.notifications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      color: AppColors.white,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: AppColors.gray,
            backgroundImage: NetworkImage(
              notifications['profilePic'],
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: notifications['body'],
                  size: 16.sp,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: notifications['createdAt'],
                  size: 16.sp,
                  color: AppColors.darkGrey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
