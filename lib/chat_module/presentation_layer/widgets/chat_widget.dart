
import '../screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';

class ChatWidget extends StatelessWidget {
  final Users user;
  const ChatWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(
              user: user,
            ),
          ),
        );
      },
      child: Padding(
        padding:
            EdgeInsets.only(left: 10.0.w, right: 10.w, bottom: 5.h, top: 5.h),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundColor: AppColors.gray,
              backgroundImage: NetworkImage(user.image!),
            ),
            SizedBox(
              width: 4.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: '${user.firstName} ${user.surName}',
                    size: 18.sp,
                    color: AppColors.black,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('user')
                          .doc(user.uId)
                          .collection('chat')
                          .orderBy('createdAt')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return CustomText(
                            text:snapshot.data!.docs.isEmpty?'Say hello to your friend 👭':
                                snapshot.data!.docs[snapshot.data!.docs.length-1]['message'],
                            size: 18.sp,
                            color: AppColors.darkGrey,
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
