import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';

class EditDetails extends StatelessWidget {
  final Users user;
  final bool isProfile;
  final bool isUserProfile;
  const EditDetails({
    super.key,
    required this.user,
    required this.isProfile,
    required this.isUserProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: AppConstants.details,
              size: 23.sp,
            ),
            !isUserProfile
                ? TextButton(
                    onPressed: () {
                      AppConstants.navigateTo(
                        context,
                        AppRoutes.editDetails,
                      );
                    },
                    child: CustomText(
                      text: AppConstants.edit,
                      size: 20.sp,
                      color: AppColors.facebookBlue,
                    ),
                  )
                : SizedBox(
                    height: 0.h,
                  ),
          ],
        ),
        // const SizedBox(height: 10,),
        InkWell(
          onTap: () {
            AppConstants.navigateTo(
              context,
              AppRoutes.editDetails,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isProfile && user.university != null)
                CustomTextIcon(
                  icon: MdiIcons.hatFedora,
                  text: user.university == null
                      ? AppConstants.university
                      : user.university!,
                  size: 18,
                  onPressed: () {},
                  color: AppColors.black,
                  iconColor: AppColors.darkGrey,
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              if (isProfile && user.school != null)
                CustomTextIcon(
                  icon: MdiIcons.school,
                  text:
                      user.school == null ? AppConstants.school : user.school!,
                  size: 18.sp,
                  onPressed: () {},
                  color: AppColors.black,
                  iconColor: AppColors.darkGrey,
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              if (isProfile && user.currentTown != null)
                CustomTextIcon(
                  icon: Icons.place,
                  text: user.currentTown == null
                      ? AppConstants.currentTwon
                      : user.currentTown!,
                  size: 18.sp,
                  onPressed: () {},
                  color: AppColors.black,
                  iconColor: AppColors.darkGrey,
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              if (isProfile && user.homeTown != null)
                CustomTextIcon(
                  icon: Icons.home,
                  text: user.homeTown == null
                      ? AppConstants.homeTown
                      : user.homeTown!,
                  size: 18.sp,
                  onPressed: () {},
                  color: AppColors.black,
                  iconColor: AppColors.darkGrey,
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              if (isProfile && user.relationship != null)
                CustomTextIcon(
                  icon: MdiIcons.heart,
                  text: user.relationship == null
                      ? AppConstants.relationshipStatus
                      : user.relationship!,
                  size: 18.sp,
                  onPressed: () {},
                  color: AppColors.black,
                  iconColor: AppColors.darkGrey,
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              if (isProfile && user.workPlace != null)
                CustomTextIcon(
                  icon: MdiIcons.bagCarryOn,
                  text: user.workPlace == null
                      ? AppConstants.workplace
                      : user.workPlace!,
                  size: 18.sp,
                  onPressed: () {},
                  color: AppColors.black,
                  iconColor: AppColors.darkGrey,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
