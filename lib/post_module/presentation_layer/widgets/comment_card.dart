import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';
import '../../domain_layer/entities/comment.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundImage: NetworkImage(comment.profilePic),
        ),
         SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.gray,
              borderRadius: BorderRadius.circular(30.r),
            ),
            padding:  EdgeInsets.all(10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: comment.name,
                  size: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(text: comment.comment, size: 16.sp),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
