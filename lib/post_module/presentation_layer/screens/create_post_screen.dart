// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_app/core/utils/exports.dart';
import 'package:facebook_app/notifications_module/presentation_layer/controllers/notifications_cubit.dart';
import 'package:facebook_app/post_module/presentation_layer/controllers/post_cubit.dart';
import 'package:facebook_app/post_module/presentation_layer/widgets/video_widget.dart';
import 'package:facebook_app/profile_module/presentation_layer/controllers/profile_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain_layer/use_cases/create_post_use_case.dart';

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({super.key});
  var postTitleController = TextEditingController();
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        if (state is CreatePostErrorState) {
          AppConstants.showSnackbar(
            context: context,
            content: state.error.toString(),
          );
        }
        
        if (state is GetAllPostsSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<PostCubit>(context);
        // var homeCubit = BlocProvider.of<HomeCubit>(context);
        var profileCubit = BlocProvider.of<ProfileCubit>(context);
        var notificationsCubit = BlocProvider.of<NotificationsCubit>(context);

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
            title: CustomText(
              text: AppConstants.createPost,
              color: AppColors.black,
              size: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  if (cubit.postImage != null) {
                    await cubit.uploadPostImage();
                  } else if (cubit.pickVideo != null) {
                    await cubit.uploadPostVideo();
                    debugPrint('hi');
                  }
                  debugPrint('video ${cubit.video}');
                  cubit
                      .createPost(
                    CreatePostParameters(
                      createdAt: DateTime.now().toString(),
                      uId: profileCubit.user.uId,
                      title: postTitleController.text,
                      userName:
                          '${profileCubit.user.firstName} ${profileCubit.user.surName}',
                      profilePic: profileCubit.user.image!,
                      postImage: cubit.imageOfPost,
                      video: cubit.video,
                    ),
                  )
                      .then((value) async {
                   
                    notificationsCubit.sendPushNotificationToAllUsers(
                      PushNotificationParameters(
                        body:
                            '${profileCubit.user.firstName} ${profileCubit.user.surName} posted a new post',
                        title: 'Notifications',
                        name:
                            '${profileCubit.user.firstName} ${profileCubit.user.surName}',
                        profilePic: profileCubit.user.surName,
                        uId: profileCubit.user.uId,
                      ),
                    );
                  });
                
                },
                child: CustomText(
                  text: AppConstants.post,
                  size: 23.sp,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(
              10.r,
            ),
            child: SingleChildScrollView(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundImage:
                                NetworkImage(profileCubit.user.image!),
                          ),
                          SizedBox(
                            width: 10.h,
                          ),
                          CustomText(
                            text:
                                '${profileCubit.user.firstName} ${profileCubit.user.surName}',
                            size: 18.sp,
                            //fontWeight: FontWeight.bold,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      CustomTextFormField(
                        hintText: AppConstants.addPostText,
                        controller: postTitleController,
                        vaildator: (value) {},
                        size: 23.sp,
                        noBorder: true,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      cubit.postImage != null
                          ? SizedBox(
                              height: 300.h,
                              child: Image.file(
                                cubit.postImage!,
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ))
                          : cubit.pickVideo != null
                              ? NowPlayingVideoWidget(
                                  url: cubit.pickVideo!.path,
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                )
                              : const SizedBox(),
                      //const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextIcon(
                            icon: Icons.image,
                            text: AppConstants.addPhoto,
                            size: 18.sp,
                            onPressed: () {
                              cubit.pickImage();
                            },
                            color: AppColors.blue,
                          ),
                          CustomTextIcon(
                            icon: Icons.video_camera_back,
                            text: AppConstants.addVideo,
                            size: 18.sp,
                            onPressed: () {
                              cubit.pickVideoFile();
                              // cubit.displayVideo();
                            },
                            color: AppColors.blue,
                          ),
                        ],
                      ),
                    ],
                  ),
                 if (state is CreatePostLoadingState ||
            state is GetAllPostsLoadingState) const CircularProgressIndicator(color: AppColors.facebookBlue,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
