import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';
import '../../../post_module/presentation_layer/controllers/post_cubit.dart';
import '../../../profile_module/presentation_layer/widgets/edit_details_widget.dart';
class UserProfileScreen extends StatelessWidget {
  final Users userProfile;
  const UserProfileScreen({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
   // var postcubiit = BlocProvider.of<PostCubit>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                      child: 
                         CachedNetworkImage(
                      imageUrl:  userProfile.cover!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 25.0.w),
                    child: CircleAvatar(
                      radius: 75.r,
                      child: CircleAvatar(
                        radius: 70.r,
                        //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        backgroundImage: NetworkImage(userProfile.image!),
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
                  width: double.infinity,
                  padding:
                       EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: '${userProfile.firstName} ${userProfile.surName}',
                        size: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      CustomText(text: userProfile.bio!, size: 20),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    color: AppColors.white,
                    child: EditDetails(user: userProfile,isProfile: true,isUserProfile: true,)),
                // const  DividerWidget(),
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
                                        posts[index]['uId'] == userProfile.uId
                                            ? PostWidget(
                                                user: cubit.userProfile,
                                                post: posts[index],
                                                //postLikes: cubit.allPostsLikes[index],
                                              )
                                            : const SizedBox(height: 0,),
                                  );
                                } else {
                                  return const Center(child: CircularProgressIndicator());
                                }
                              }),
                 ),
             /*    ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: postcubiit.allPosts.length,
                  itemBuilder: (context, index) => postcubiit.allPosts[index].uId==userProfile.uId?
                  PostWidget(
                    user: cubit.userProfile,
                    post: postcubiit.allPosts[index],
                    //postLikes: cubit.allPostsLikes[index],
                  ):const SizedBox(height: 0,),
                  separatorBuilder: (context, index) => SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                )
           */    ],
            )
          ],
        ),
      ),
    );
  }
}
