import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';
import '../controllers/post_cubit.dart';
import 'package:flutter/material.dart';

class PopUpWifget extends StatelessWidget {
  final String? postId;
  final String? storyId;
 final bool isStory;
  const PopUpWifget({super.key, this.postId, this.storyId,this.isStory=false});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Icons.more_horiz,
        color: AppColors.black,
      ),
      color: AppColors.gray,
      itemBuilder: (context) => [
        PopupMenuItem(
          child:  CustomText(
            text: isStory?'Delete Story':'Delete post',
            size: 18.sp,
          ),
          onTap: () {
           isStory?BlocProvider.of<HomeCubit>(context).deleteStory(storyId!).then((value) => Navigator.pop(context)): BlocProvider.of<PostCubit>(context).deletePost(postId!);
          },
        )
      ],
    );
  }
}
