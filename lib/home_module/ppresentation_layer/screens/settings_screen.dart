import 'package:facebook_app/core/srvices/service_locator.dart';
import 'package:facebook_app/profile_module/presentation_layer/controllers/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              AppConstants.navigateTo(
                context,
                AppRoutes.navbarScreen,
                1,
              );
            },
            child: BlocProvider(
              create: (context) => sl<ProfileCubit>()..getUserData(),
              child: BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var profileCubit = BlocProvider.of<ProfileCubit>(context);
                  debugPrint('profile${profileCubit.user}');
                  return Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(profileCubit.user.image!),
                        radius: 25.w,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text:
                                '${profileCubit.user.firstName} ${profileCubit.user.surName}',
                            size: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          CustomText(text: 'See your profile', size: 18.sp),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            onPressed: () {
              BlocProvider.of<AuthenticationCubit>(context)
                  .signOut()
                  .then((value) => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                      ));
            },
            height: 40.h,
            textColor: AppColors.facebookBlue,
            color: AppColors.gray,
            text: AppConstants.logOut,
            size: 20.sp,
          ),
        ],
      ),
    );
  }
}
