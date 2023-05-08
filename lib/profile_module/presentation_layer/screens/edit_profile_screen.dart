import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home_module/ppresentation_layer/widgets/divider_widget.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/exports.dart';
import '../widgets/edit_bio_widget.dart';
import '../widgets/edit_cover_pic_widget.dart';
import '../widgets/edit_details_widget.dart';
import '../widgets/edit_profile_pic_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
        title:  CustomText(
          text: AppConstants.editProfile,
          color: AppColors.black,
          size: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<HomeCubit>(context);
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  EditProfilePicture(user: cubit.user),
                  const  DividerWidget(),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  EditCoverPhoto(user: cubit.user),
                   const  DividerWidget(),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  EditBio(user: cubit.user,),
                   const  DividerWidget(),
                  EditDetails(user: cubit.user,isProfile: false,isUserProfile: false,),
                   const  DividerWidget(),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                  ],
              ),
            ),
          );
        },
      ),
    );
  }
}
