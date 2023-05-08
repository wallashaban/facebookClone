// ignore_for_file: must_be_immutable

import 'package:facebook_app/core/utils/exports.dart';
import 'package:facebook_app/notifications_module/presentation_layer/controllers/notifications_cubit.dart';
import 'package:facebook_app/post_module/presentation_layer/widgets/video_widget.dart';
import 'package:facebook_app/profile_module/presentation_layer/controllers/profile_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AddStoryScreen extends StatelessWidget {
  AddStoryScreen({super.key});
  var postTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
         if (state is CreateStorySuccessState) {
            Navigator.pop(context);
        }
      },
      builder: (context, state) {
       // var postCubit = BlocProvider.of<PostCubit>(context);
        var homeCubit = BlocProvider.of<HomeCubit>(context);
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
            title:  CustomText(
              text: 'Story',
              color: AppColors.black,
              size: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  if (homeCubit.image != null) {
                    await homeCubit.uploadStoryImage();
                  } else if (homeCubit.pickVideo != null) {
                   await homeCubit.uploadStoryVideo();
                    debugPrint('hi');
                  }
                 // debugPrint('video ${cubit.video}');
                  homeCubit
                      .createStory(
                    CreateStoryParameters(
                      createdAt: DateTime.now().toString(),
                      uId: profileCubit.user.uId,
                      name:
                          '${profileCubit.user.firstName} ${profileCubit.user.surName}',
                      profilePic: profileCubit.user.image!,
                      storyPic: homeCubit.storyImage!,
                    ),
                  )
                      .then((value) async {
                    DocumentSnapshot snapshot = (await FirebaseFirestore
                        .instance
                        .collection('user')
                        .doc(profileCubit.user.uId)
                        .get());
                    debugPrint('token ${snapshot['token']}');
                    notificationsCubit.sendPushNotificationToAllUsers(
                      PushNotificationParameters(
                          body:
                              '${profileCubit.user.firstName} ${profileCubit.user.surName} added a story',
                          title: 'Notifications',
                          name: '${profileCubit.user.firstName} ${profileCubit.user.surName}',
                          profilePic: profileCubit.user.image!,
                          uId: profileCubit.user.uId,
                          ),
                    );
                  });
                  //notificationsCubit.requesPermission();
                },
                child:  CustomText(
                  text: AppConstants.adtToStory,
                  size: 23.sp,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          body: Padding(
            padding:  EdgeInsets.all(
              10.r,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //if(homeCubit.image == null && homeCubit.pickVideo == null)
               Center(child:  CustomText(text: 'Add your story here.....', size: 20.sp,color: AppColors.darkGrey,)),
                 homeCubit.image != null
                      ? Expanded(
                          child: Image.file(
                          homeCubit.image!,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ))
                      : homeCubit.pickVideo!=null?
                      NowPlayingVideoWidget(url: homeCubit.pickVideo!.path, height: MediaQuery.of(context).size.height*0.4,):const SizedBox(),
                   const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextIcon(
                        icon: Icons.image,
                        text: AppConstants.addPhoto,
                        size: 18.sp,
                        onPressed: () {
                          homeCubit.pickImage();
                        },
                        color: AppColors.blue,
                      ),
                     /*  CustomTextIcon(
                        icon: Icons.video_camera_back,
                        text: AppConstants.addVideo,
                        size: 18.sp,
                        onPressed: () {
                          homeCubit.pickVideoFile();
                        },
                        color: AppColors.blue,
                      ), */
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
