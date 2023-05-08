import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';

class CreatePostContainer extends StatelessWidget {
  final Users currentUser;
  CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
         AppConstants. navigateTo(
            context,
            AppRoutes.createPost,
          );
        },
        child: Container(
          color: AppColors.white,
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          height: 80.0.h,
          child: Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.gray,
                backgroundImage: NetworkImage(currentUser.image!),
              ),
               SizedBox(
                width: 10.0.w,
              ),
              Expanded(
                  child: Container(
                   // width: MediaQuery.of(context).size.width*0.6,
                    padding:  EdgeInsets.all(7.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r,),
                      border:const Border(
                        bottom:  BorderSide(color: AppColors.ablack),
                        top:  BorderSide(color: AppColors.ablack),
                        left:  BorderSide(color: AppColors.ablack),
                        right:  BorderSide(color: AppColors.ablack),
                      ),
                    ),
                    child:  CustomText(
                                  text: AppConstants.addPostText,
                                  size: 20.sp,
                                ),
                  ))
              ,  Padding(
                padding: EdgeInsets.only(left:15.0.w),
                child:const Icon(Icons.photo_library,color: AppColors.green,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
