import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home_module/ppresentation_layer/widgets/row_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/exports.dart';
import 'add_work_screen.dart';

class EditDetailsScreen extends StatelessWidget {
  //final Users user;
  const EditDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var user = BlocProvider.of<HomeCubit>(context).user;
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
          text: AppConstants.editDetails,
          color: AppColors.black,
          size: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CustomText(
                text: AppConstants.customise,
                size: 25.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
               CustomText(
                text: AppConstants.detailsCondition,
                size: 20.sp,
                color: AppColors.darkGrey,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
               CustomText(
                text: AppConstants.work,
                size: 25.sp,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              user.workPlace!=null
                  ? RowWidget(
                      text: user.workPlace!,
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddWorkScreen(
                                  isWorkplace: true,
                                )));
                      })
                  : CustomButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddWorkScreen(
                                  isWorkplace: true,
                                )));
                      },
                      text: AppConstants.addWork,
                      size: 16.sp,
                      color: AppColors.gray,
                      textColor: AppColors.black,
                      fontWeight: FontWeight.w400,
                      height: 40.h,
                      radius: 5.r,
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const CustomText(text: AppConstants.education, size: 25),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              user.university!=null
                  ? RowWidget(text: user.university!, onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddWorkScreen(
                            isUniversity: true,
                          )));
                  })
                  : CustomButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddWorkScreen(
                                  isUniversity: true,
                                )));
                      },
                      text: AppConstants.adduniversity,
                      size: 16.sp,
                      color: AppColors.gray,
                      textColor: AppColors.black,
                      fontWeight: FontWeight.w400,
                      height: 40.h,
                      radius: 5.r,
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              user.school!=null
                  ? RowWidget(text: user.school!, onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddWorkScreen(
                            isSchool: true,
                          )));
                  })
                  : CustomButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddWorkScreen(
                                  isSchool: true,
                                )));
                      },
                      text: AppConstants.addSchool,
                      size: 16.sp,
                      color: AppColors.gray,
                      textColor: AppColors.black,
                      fontWeight: FontWeight.w400,
                      height: 40.h,
                      radius: 5.r,
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const CustomText(text: AppConstants.currentTwon, size: 25),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              user.currentTown!=null
                  ? RowWidget(text: user.currentTown!, onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddWorkScreen(
                            isCurrentTown: true,
                          )));
                  })
                  : CustomButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddWorkScreen(
                                  isCurrentTown: true,
                                )));
                      },
                      text: AppConstants.addCurrentTown,
                      size: 16.sp,
                      color: AppColors.gray,
                      textColor: AppColors.black,
                      fontWeight: FontWeight.w400,
                      height: 40.h,
                      radius: 5.r,
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
               CustomText(text: AppConstants.homeTown, size: 25.sp),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              user.homeTown!=null
                  ? RowWidget(text: user.homeTown!, onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddWorkScreen(
                            isHomeTown: true,
                          )));
                  })
                  : CustomButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AddWorkScreen(
                                  isHomeTown: true,
                                )));
                      },
                      text: AppConstants.addHomeTown,
                      size: 16.sp,
                      color: AppColors.gray,
                      textColor: AppColors.black,
                      fontWeight: FontWeight.w400,
                      height: 40.h,
                      radius: 5.r,
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const CustomText(text: AppConstants.relationship, size: 25),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              user.relationship!=null
                  ? RowWidget(text: user.relationship!, onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddWorkScreen(
                          isRelationship: true,
                        )));
                  })
                  : CustomButton(
                      onPressed: () {
                         Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddWorkScreen(
                          isRelationship: true,
                        )));
                      },
                      text: AppConstants.addRelationship,
                      size: 16.sp,
                      color: AppColors.gray,
                      textColor: AppColors.black,
                      fontWeight: FontWeight.w400,
                      height: 40.h,
                      radius: 5.r,
                    ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            //  const Spacer(),
              CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: AppConstants.save,
                size: 20.sp,
                color: AppColors.facebookBlue,
                height: 40.h,
                radius: 5.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
