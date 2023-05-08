import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';
import '../controllers/profile_cubit.dart';

class EditProfilePicture extends StatelessWidget {
  final Users user;
  const EditProfilePicture({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             CustomText(
              text: AppConstants.profilePicture,
              size: 23.sp,
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<ProfileCubit>(context).updateProfileImage();
              },
              child:  CustomText(
                text: AppConstants.edit,
                size: 23.sp,
                color: AppColors.facebookBlue,
              ),
            ),
          ],
        ),
        // const SizedBox(height: 10,),
        CircleAvatar(
          radius: 100.r,
          child: CachedNetworkImage(imageUrl: user.image!,),
        ),
      ],
    );
  }
}
