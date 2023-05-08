import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';
import '../controllers/profile_cubit.dart';

class EditCoverPhoto extends StatelessWidget {
 final Users user;
  const EditCoverPhoto({super.key,required this.user,});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               CustomText(
                text: AppConstants.coverPhoto,
                size: 23.sp,
              ),
              TextButton(
                onPressed: () {
                  BlocProvider.of<ProfileCubit>(context).updateProfileImage();
                },
                child: const CustomText(
                  text: AppConstants.edit,
                  size: 23,
                  color: AppColors.facebookBlue,
                ),
              ),
            ],
          ),
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: NetworkImage(user.cover!,),fit: BoxFit.cover)
            ),
          ),
        ],
      );
  }
}
