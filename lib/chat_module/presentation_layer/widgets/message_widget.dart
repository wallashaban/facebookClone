// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';

class MessageWidget extends StatelessWidget {
  final bool isMe;
   String? message;
  String? image;
   MessageWidget({
    super.key,
    required this.isMe,
     this.message,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          // width: MediaQuery.of(context).size.width*0.6,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
              color:image!=null?Colors.transparent: isMe ? AppColors.facebookBlue : AppColors.gray,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(30),
                topRight: const Radius.circular(30),
                bottomLeft: !isMe ? Radius.zero : const Radius.circular(30),
                bottomRight: isMe ? Radius.zero : const Radius.circular(30),
              )),
          child: image!=null?ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(30),
                topRight: const Radius.circular(30),
                bottomLeft: !isMe ? Radius.zero : const Radius.circular(30),
                bottomRight: isMe ? Radius.zero : const Radius.circular(30),
              ),
            child: Image.network(image!,width: MediaQuery.of(context).size.width*0.6,
            height: MediaQuery.of(context).size.height*0.4,fit: BoxFit.fill,),
          ):Text(message!,
          style: TextStyle(
            color: isMe ? AppColors.white : AppColors.black,
             fontSize: 18.sp,
             overflow: TextOverflow.visible,
          ),)
           /* CustomText(
            text: message!,
            size: 18.sp,
            color: isMe ? AppColors.white : AppColors.black,
          ), */
        ),
      ],
    );
  }
}
