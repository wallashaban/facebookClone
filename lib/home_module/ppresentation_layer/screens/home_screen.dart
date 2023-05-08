import '../../../core/srvices/service_locator.dart';
import '../widgets/story_widegt.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';
import '../../../profile_module/presentation_layer/controllers/profile_cubit.dart';
import 'package:flutter/material.dart';

import '../../../post_module/presentation_layer/controllers/post_cubit.dart';
import '../widgets/user_story_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //var postcubiit = BlocProvider.of<PostCubit>(context);
    return Scaffold(
      backgroundColor: AppColors.lightGray,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // const  Divider(color: AppColors.black,thickness: 0.5,height: 1,),
              BlocProvider(
                create: (context) => sl<ProfileCubit>()..getUserData(),
                child: BlocConsumer<ProfileCubit, ProfileState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    var profileCubit = BlocProvider.of<ProfileCubit>(context);
                    debugPrint('profile${profileCubit.user}');
                    return CreatePostContainer(
                      currentUser: profileCubit.user,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('stories')
                      .orderBy(
                        'createdAt',
                        descending: true,
                      )
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container(
                        color: AppColors.white,
                        padding: const EdgeInsets.all(10),
                        height: 170.h,
                        child: Row(
                          children: [
                            const UserStoryWidget(),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                // shrinkWrap: true,
                                itemBuilder: (context, index) => StoryWidet(
                                  story: snapshot.data!.docs[index],
                                ),
                                itemCount: snapshot.data!.docs.length,
                                separatorBuilder: (context, index) => SizedBox(
                                  width: 5.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox();
                  }),
              SizedBox(
                height: 5.h,
              ),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('allPosts')
                      .orderBy(
                        'createdAt',
                        descending: true,
                      )
                      .snapshots(),
                  builder: (context, snapshot) {
                    var cubit = BlocProvider.of<HomeCubit>(context);

                    if (snapshot.hasData) {
                      var posts = snapshot.data!.docs;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => PostWidget(
                          user: cubit.user,
                          post: posts[index],
                        ),
                        itemCount: posts.length,
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
