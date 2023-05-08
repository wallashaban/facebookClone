// ignore_for_file: must_be_immutable

import 'package:avatar_glow/avatar_glow.dart';

import '../widgets/search_widget.dart';
import '../../../core/utils/exports.dart';
import '../../../profile_module/presentation_layer/controllers/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain_layer/repository/chat_base_repository.dart';
import '../controller/chat_cubit.dart';
import '../widgets/message_widget.dart';

class ChatScreen extends StatelessWidget {
  final Users user;
  ChatScreen({super.key, required this.user});
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ChatCubit>(context);
    var profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.facebookBlue,
          ),
        ),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.gray,
                backgroundImage: NetworkImage(user.image!),
              ),
            ),
            SizedBox(
              width: 4.w,
            ),
            CustomText(
              text: user.firstName,
              size: 18.sp,
              color: AppColors.black,
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                color: AppColors.facebookBlue,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.video_call,
                color: AppColors.facebookBlue,
              )),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('user')
                    .doc(user.uId)
                    .collection('chat')
                    .orderBy('createdAt')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final messages = snapshot.data!.docs.reversed;
                    List<MessageWidget> allMessages = [];
                    for (var message in messages) {
                      final messageWidget = MessageWidget(
                        isMe: message.get('uId') == profileCubit.user.uId,
                        message: message.get('message'),
                        image: message.get('image'),
                      );
                      allMessages.add(messageWidget);
                    }
                    return ListView(
                      reverse: true,
                      children: allMessages,
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ),
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return Row(
                children: [
                  IconButton(
                      onPressed: () async {
                        await cubit.pickImageGallery();
                      },
                      icon: const Icon(
                        Icons.photo,
                        color: AppColors.facebookBlue,
                      )),
               Expanded(
                      child: SearchWidget(
                    searchController: controller,
                    isChat: true,
                  )),
                  IconButton(
                    onPressed: () {
                      cubit.uploadChatImage().then((value) => cubit
                          .sendMessage(SendMessageParameters(
                            senderName:
                                '${profileCubit.user.firstName} ${profileCubit.user.surName}',
                            message: controller.text,
                            image: cubit.imageOfChat,
                            recieverUid: user.uId,
                          ))
                          .then((value) => controller.clear()));
                    },
                    icon: const Icon(
                      Icons.send,
                      color: AppColors.facebookBlue,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
