import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home_module/ppresentation_layer/widgets/divider_widget.dart';
import '../../../post_module/presentation_layer/controllers/post_cubit.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/exports.dart';
import '../../../core/srvices/service_locator.dart';
import '../controllers/profile_cubit.dart';
import '../widgets/edit_details_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileCubit>()..getUserData(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BlocProvider.of<ProfileCubit>(context);
          if (state is GetUserDataLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.facebookBlue,
            ));
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.white,
                    height: MediaQuery.of(context).size.height * 0.34,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: /* cubit.profileImage!=null?
                              Image.file(cubit.profileImage!): */
                                CachedNetworkImage(
                              imageUrl: cubit.user.cover!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.24,
                          left: MediaQuery.of(context).size.width * 0.85,
                          //alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            backgroundColor: AppColors.gray,
                            child: IconButton(
                              onPressed: () {
                                cubit.updateCoverImage();
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: CircleAvatar(
                            radius: 75.r,
                            backgroundColor: AppColors.white,
                            child: CircleAvatar(
                              radius: 70.r,
                              //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              backgroundImage: NetworkImage(cubit.user.image!),
                              child: Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.gray,
                                  child: IconButton(
                                    onPressed: () {
                                      cubit.updateProfileImage();
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: AppColors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text:
                                  '${cubit.user.firstName} ${cubit.user.surName}',
                              size: 25,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            CustomText(text: cubit.user.bio!, size: 20),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButtonWithIcon(
                                  onPressed: () {
                                    AppConstants.navigateTo(
                                      context,
                                      AppRoutes.createStory,
                                    );
                                  },
                                  icon: Icons.add_circle,
                                  text: AppConstants.adtToStory,
                                  size: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  height: 40.h,
                                  width:
                                      MediaQuery.of(context).size.width * 0.37,
                                ),
                                CustomButtonWithIcon(
                                  onPressed: () {
                                    AppConstants.navigateTo(
                                      context,
                                      AppRoutes.editProfile,
                                    );
                                  },
                                  icon: Icons.edit,
                                  text: AppConstants.editProfile,
                                  size: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  height: 40.h,
                                  foreGroundColor: AppColors.black,
                                  color: AppColors.gray,
                                  width:
                                      MediaQuery.of(context).size.width * 0.37,
                                ),
                                Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColors.gray,
                                  ),
                                  child: Material(
                                    child: IconButton(
                                        onPressed: () {},
                                        color: AppColors.gray,
                                        icon: const Icon(
                                          Icons.more_horiz,
                                          color: AppColors.black,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      CreatePostContainer(
                        currentUser: cubit.user,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                          padding: const EdgeInsets.all(8),
                          color: AppColors.white,
                          child: EditDetails(
                            user: cubit.user,
                            isProfile: true,
                            isUserProfile: false,
                          )),
                     // const DividerWidget(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                        color: AppColors.lightGray,
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('allPosts')
                                .orderBy(
                                  'createdAt',
                                  descending: true,
                                )
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var posts = snapshot.data!.docs;
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: BlocProvider.of<PostCubit>(context)
                                      .allPosts
                                      .length,
                                  itemBuilder: (context, index) =>
                                      posts[index]['uId'] == cubit.user.uId
                                          ? PostWidget(
                                              user: cubit.user,
                                              post: posts[index],
                                              //postLikes: cubit.allPostsLikes[index],
                                            )
                                          : const SizedBox(height: 0,),
                                );
                              } else {
                                return const Center(child: CircularProgressIndicator());
                              }
                            }),
                      )
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
