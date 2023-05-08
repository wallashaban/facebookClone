import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';

class RowWidget extends StatelessWidget {
  final String text;
 final VoidCallback onPressed;
  const RowWidget({super.key,
  required this.text,
  required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width*0.8,
          child: Text(text,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style:  TextStyle(
            fontSize: 18.sp,
          ),),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.edit,color: AppColors.darkGrey,),
        ),
      ],
    );
  }
}
