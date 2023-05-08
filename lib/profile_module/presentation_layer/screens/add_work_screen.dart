// ignore_for_file: must_be_immutable

import 'package:facebook_app/profile_module/presentation_layer/controllers/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';

class AddWorkScreen extends StatelessWidget {
  final bool isUniversity, isSchool, isWorkplace, isCurrentTown, isHomeTown,isRelationship;
  AddWorkScreen({
    super.key,
    this.isCurrentTown = false,
    this.isHomeTown = false,
    this.isUniversity = false,
    this.isSchool = false,
    this.isWorkplace = false,
    this.isRelationship=false,
  });
  var controller = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProfileCubit>(context);
    controller = TextEditingController(
      text: isWorkplace?cubit.user.workPlace!=null?cubit.user.workPlace!:null
    :isUniversity?cubit.user.university!=null?cubit.user.university!:null
    :isSchool?cubit.user.school!=null?cubit.user.school!:null
    :isCurrentTown?cubit.user.currentTown!=null?cubit.user.currentTown!:null
    :isRelationship?cubit.user.relationship!=null?cubit.user.relationship!:null
    :cubit.user.homeTown!=null?cubit.user.homeTown!:null
    );
    return Scaffold(
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
          text: isRelationship? AppConstants.addRelationship
          :isWorkplace? AppConstants.addWork
          :isHomeTown ?
          AppConstants.addHomeTown:isUniversity?
          
          AppConstants.addUniversity:
          isSchool?AppConstants.addSchool:AppConstants.addCurrentTown,
          color: AppColors.black,
          size: 20.sp,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                isRelationship
                    ? cubit.editRelationship(
                        controller.text,
                      ).then((value) =>Navigator.of(context).pop()):
                isWorkplace
                    ? cubit.editWorkplace(
                        controller.text,
                      ).then((value) =>Navigator.of(context).pop())
                    : isCurrentTown
                        ? cubit.editCurrnteCity(controller.text).then((value) =>Navigator.of(context).pop())
                        : isHomeTown
                            ? cubit.editHomeTown(controller.text).then((value) =>Navigator.of(context).pop())
                            : isSchool
                                ? cubit.editSchool(controller.text).then((value) =>Navigator.of(context).pop())
                                : cubit.editUniversity(controller.text).then((value) =>Navigator.of(context).pop());
              }
              
            },
            child:  CustomText(
              text: AppConstants.save,
              size: 22.sp,
            ),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: CustomTextFormField(
          hintText:isRelationship
              ? AppConstants.relationship:
           isWorkplace
              ? AppConstants.workplaceName
              : isCurrentTown
                  ? AppConstants.currentTwon
                  : isHomeTown
                      ? AppConstants.homeTown
                      : isUniversity
                          ? AppConstants.universityName
                          : AppConstants.schoolName,
          controller: controller,
          vaildator: (value) {
            if (value.isEmpty) {
              return 'Please this field is required to save';
            }
          },
          noBorder: true,
        ),
      ),
    );
  }
}
