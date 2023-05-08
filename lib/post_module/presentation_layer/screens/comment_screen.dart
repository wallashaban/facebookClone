// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:facebook_app/post_module/presentation_layer/controllers/post_cubit.dart';
import 'package:facebook_app/profile_module/presentation_layer/controllers/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/srvices/service_locator.dart';
import '../../../core/utils/exports.dart';
import '../../domain_layer/use_cases/add_comment_use_case.dart';
import '../widgets/comment_card.dart';

class CommentScreen extends StatelessWidget {
  final post;
  CommentScreen({super.key, required this.post});
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var profileCubit = BlocProvider.of<ProfileCubit>(context);
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
          text: AppConstants.comments,
          color: AppColors.black,
          size: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 5).h,
          child: BlocBuilder<PostCubit, PostState>(
            builder: (context, state) {
              var cubit = BlocProvider.of<PostCubit>(context);
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: cubit.comments.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10.h,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return CommentCard(
                          comment: cubit.comments[index],
                        );
                      },
                    ),
                  ),
                  Container(
                    //margin:  EdgeInsets.only(left: 4.w, right: 4.w, top: 8.h),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BlocProvider(
                          create: (context) => sl<ProfileCubit>()..getUserData(),
                          child: BlocConsumer<ProfileCubit, ProfileState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              return CustomTextFormField(
                                controller: controller,
                                hintText: AppConstants.writeAComment,
                                vaildator: (value) {},
                                raduis: 25.r,
                                width: MediaQuery.of(context).size.width * 0.75,
                              );
                            },
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              cubit
                                  .addComment(
                                    AddCommentParameters(
                                      comment: controller.text,
                                      createdAt: DateTime.now().toString(),
                                      name:
                                          '${profileCubit.user.firstName} ${profileCubit.user.surName}',
                                      postId: post['postId'],
                                      profilePic: profileCubit.user.image!,
                                      uId: profileCubit.user.uId,
                                    ),
                                  )
                                  .then((value) => controller.clear());
                            },
                            icon: const Icon(
                              Icons.send,
                              color: AppColors.facebookBlue,
                            )),
                      ],
                    ),
                  )
                ],
              );
            },
          )),
    );
  }
}
