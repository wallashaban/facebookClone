import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';
import '../../../profile_module/presentation_layer/controllers/profile_cubit.dart';
import '../controllers/notifications_cubit.dart';
import '../widgets/friends_widget.dart';

class FriendScreen extends StatelessWidget {
  FriendScreen({super.key});
  var friends = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var profileCubit = BlocProvider.of<ProfileCubit>(context);
        var cubit = BlocProvider.of<NotificationsCubit>(context);
        var homeCubit = BlocProvider.of<HomeCubit>(context);
        var notificationCubit = BlocProvider.of<NotificationsCubit>(context);
        return Container(
          padding: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (cubit.friendRequests.isNotEmpty)
                CustomText(
                  text: AppConstants.friendRequests,
                  size: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              if (cubit.friendRequests.isNotEmpty)
                const SizedBox(
                  height: 20,
                ),
              if (cubit.friendRequests.isNotEmpty)
                Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('user')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection('friendRequests')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var friendRequests = snapshot.data!.docs;

                          for (var friend in friendRequests) {
                            friends.add(friend['uId']);
                          }
                          return ListView.separated(
                            itemCount: friendRequests.length,
                            itemBuilder: (BuildContext context, int index) {
                              return FriendsWidget(
                                friendInfo: friendRequests[index],
                                isFriendRequest: true,
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: 15.h,
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ),
              CustomText(
                text: AppConstants.people,
                size: 18.sp,
                fontWeight: FontWeight.bold,
              ),
              Expanded(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('user')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var users = snapshot.data!.docs;
                        return ListView.separated(
                          itemCount: users.length,
                          itemBuilder: (BuildContext context, int index) {
                            return profileCubit.user.uId ==
                                        homeCubit.users[index].uId ||
                                    friends
                                        .contains(users[index]['uId'])
                                ? const SizedBox(
                                    height: 0,
                                  )
                                : FriendsWidget(
                                    user: users[index],
                                    isFriendRequest: false,
                                  );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: 15.sp,
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
