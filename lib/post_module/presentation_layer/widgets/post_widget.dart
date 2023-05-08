// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../core/utils/exports.dart';
import '../../domain_layer/use_cases/like_post_use_case.dart';
import '../controllers/post_cubit.dart';
import '../screens/comment_screen.dart';
import 'popup_menu.dart';
import 'video_widget.dart';

class PostWidget extends StatelessWidget {
  final Users user;
  final post;
  const PostWidget({
    Key? key,
    required this.user,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<PostCubit>(context);
    return Container(
      color: AppColors.white,
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
      margin: EdgeInsets.symmetric(vertical: 3.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  post['profilePic'],
                ),
                radius: 25.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: post['userName'],
                    size: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text:
                            '${DateFormat.yMMMEd().format(DateTime.parse(post['createdAt']))} ',
                        size: 16.sp,
                        color: AppColors.darkGrey,
                      ),
                      const Icon(
                        Icons.public,
                        size: 15,
                        color: AppColors.darkGrey,
                      )
                    ],
                  ),
                ],
              ),
              const Spacer(),
              PopUpWifget(
                postId: post['postId'],
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          CustomText(
            text: post['title'],
            size: 16.sp,
            lines: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          post['postImage'] != null
              ? SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: CachedNetworkImage(
                    imageUrl: post['postImage'],
                    fit: BoxFit.cover,
                  ),
                )
              : post['video'] != null
                  ? SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: NowPlayingVideoWidget(
                          url: post['video'],
                          height: MediaQuery.of(context).size.height * 0.3),
                    )
                  : SizedBox(
                      height: 0.h,
                    ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextIcon(
                icon: FontAwesomeIcons.thumbsUp,
                text: post['likes'] == null
                    ? '0'
                    : '${post['likes'].length}', // postLikes.toString(),
                size: 16.sp,
                iconSize: 20.sp,
                iconColor: AppColors.facebookBlue,
                onPressed: () {},
                color: AppColors.darkGrey,
              ),
              /*  CustomText(
                text: '0 ${AppConstants.comments}',
                size: 12.sp,
                color: AppColors.darkGrey,
              ), */
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            decoration: BoxDecoration(
                border: BorderDirectional(
              top: BorderSide(color: AppColors.darkGrey, width: 0.5.r),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextIcon(
                  icon: FontAwesomeIcons.thumbsUp,
                  text: AppConstants.like,
                  size: 12.sp,
                  iconColor: post['likes'] != null
                      ? post['likes'].contains(user.uId)
                          ? AppColors.facebookBlue
                          : AppColors.darkGrey
                      : AppColors.darkGrey,
                  onPressed: () {
                    cubit.likePost(
                      LikePostParameters(
                          userId: user.uId,
                          postId: post['postId'],
                          likes: post['likes']),
                    );
                  },
                  color: post['likes'] != null
                      ? post['likes']!.contains(user.uId)
                          ? AppColors.facebookBlue
                          : AppColors.darkGrey
                      : AppColors.darkGrey,
                ),
                CustomTextIcon(
                  icon: FontAwesomeIcons.comment,
                  text: AppConstants.comment,
                  size: 16.sp,
                  iconColor: AppColors.darkGrey,
                  onPressed: () {
                    cubit.getcomments(post['postId']).then(
                          (value) => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => CommentScreen(
                                post: post,
                              ),
                            ),
                          ),
                        );
                  },
                  color: AppColors.darkGrey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
