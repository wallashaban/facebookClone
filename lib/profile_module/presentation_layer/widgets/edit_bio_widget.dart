import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';
import '../screens/edit_bio_screen.dart';

class EditBio extends StatelessWidget {
  final Users user;
  const EditBio({
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
              text: AppConstants.bio,
              size: 23.sp,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EditBioScreen(
                      user: user,
                    ),
                  ),
                );
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
        CustomText(
          text: user.bio!,
          size: 20.sp,
        ),
      ],
    );
  }
}
