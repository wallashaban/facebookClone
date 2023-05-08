import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';
import '../controller/chat_cubit.dart';

class ChatBottomNavbarScreen extends StatelessWidget {
  const ChatBottomNavbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<ChatCubit>(context);
        return Scaffold(
          appBar: AppBar(
              backgroundColor: AppColors.white,
              title: CustomText(
                text: 'Chats',
                size: 20.sp,
                color: AppColors.black,
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      radius: 20.r,
                      backgroundColor: AppColors.gray,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            color: AppColors.black,
                          ))),
                ),
              ]),
          body: cubit.screens[cubit.index],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.index,
              onTap: (index) {
                cubit.changeNavbar(index);
              },
              unselectedItemColor: AppColors.darkGrey,
              selectedItemColor: AppColors.facebookBlue,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.video_call), label: 'Calls'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people), label: 'People'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.camera_front), label: 'Stories'),
              ]),
        );
      },
    );
  }
}
