// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';
import '../controllers/profile_cubit.dart';

class EditBioScreen extends StatelessWidget {
  final Users user;

  EditBioScreen({
    required this.user,
    super.key,
  });

  var controller = TextEditingController();
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
        actions: [
          TextButton(
            onPressed: () {
              BlocProvider.of<ProfileCubit>(context)
                  .editBio(controller.text)
                  .then((value) {
                Navigator.pop(context);
              });
            },
            child:  CustomText(
              text: AppConstants.save,
              size: 22.sp,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    user.image!,
                  ),
                  radius: 30.r,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    CustomText(
                      text: '${user.firstName} ${user.surName}',
                      size: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                     CustomText(
                      text: 'Public',
                      size: 16.sp,
                      color: AppColors.darkGrey,
                    ),
                  ],
                ),
              ],
            ),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: TextFormField(
                  //  cursorColor: AppColors.textBodyMediumColor,
                  controller: controller,
                  textInputAction: TextInputAction.done,
                  minLines: 5,
                  maxLines: 5,

                  keyboardType: TextInputType.multiline,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'Please Enter your bio.';
                    }
                    return null;
                  }),
                  decoration: InputDecoration(
                      hintText:
                          '''You can add a short bio to tell people about yourself.
this could be anything such as a favourite quote or what makes you happy.''',
                      filled: true,
                      hintStyle: const TextStyle(fontSize: 14),
                      fillColor: AppColors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
