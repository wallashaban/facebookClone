// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_app/home_module/ppresentation_layer/screens/add_story_screen.dart';
import 'package:facebook_app/profile_module/presentation_layer/controllers/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/srvices/service_locator.dart';
import '../../../core/utils/exports.dart';

class UserStoryWidget extends StatelessWidget {
  const UserStoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => AddStoryScreen(),
          ),
        );
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          height: 170.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.gray,
          ),
          child: Stack(
            children: [
              BlocProvider(
                create: (context) => sl<ProfileCubit>()..getUserData(),
                child: BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var profileCubit = BlocProvider.of<ProfileCubit>(context);
                    debugPrint('profile${profileCubit.user}');
                    return ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.r),
                          topRight: Radius.circular(20.r),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: profileCubit.user.image!,
                          height: 100.h,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ));
                  },
                ),
              ),
              Positioned(
                top: 85.h,
                left: 35.w,
                child: CircleAvatar(
                  radius: 17.r,
                  backgroundColor: AppColors.gray,
                  child: CircleAvatar(
                    radius: 15.r,
                    backgroundColor: AppColors.facebookBlue,
                    child: const Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomText(
                    text: AppConstants.createStory,
                    size: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
