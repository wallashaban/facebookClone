import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';
import '../../../profile_module/presentation_layer/controllers/profile_cubit.dart';
import '../../domain_layer/entities/friend_info.dart';
import '../controllers/notifications_cubit.dart';

class FriendsWidget extends StatelessWidget {
  final  user;
  final  friendInfo;
  final bool isFriendRequest;
  const FriendsWidget({
    super.key,
    this.user,
    this.friendInfo,
    required this.isFriendRequest,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NotificationsCubit>(context);
    var profileCubit = BlocProvider.of<ProfileCubit>(context);
    return Row(
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundImage: NetworkImage(isFriendRequest ? friendInfo['profilePic'] : user['image']),
         
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: isFriendRequest
                  ? friendInfo['name']
                  : '${user['firstName']} ${user['surName']}',
              size: 18.sp,
            ),
             SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  onPressed: () {
                    if (isFriendRequest) {
                      cubit.addFriendUserFriend(
                        FriendInfoParamerters(
                          name: friendInfo ['name'],
                          profilePic: friendInfo['profilePic'],
                          uId: friendInfo['uId'],
                          id: friendInfo['id'],
                        ),
                      );
                    } else {
                      cubit.friendRequest(
                        FriendInfoParamerters(
                            name:
                                '${profileCubit.user.firstName} ${profileCubit.user.surName}',
                            profilePic:
                                profileCubit.user.image!,
                            uId: user['uId'],
                            id: ''),
                      );
                     cubit
                          .sendPushNotificationToASpecificUser(
                        PushNotificationParameters(
                          body:
                              '${profileCubit.user.firstName} ${profileCubit.user.surName} sent you a friend request',
                          title: 'facebook',
                          token: user['token'], name: '${profileCubit.user.firstName} ${profileCubit.user.surName}',
                          profilePic: profileCubit.user.image!,
                          uId: profileCubit.user.uId,
                        ),
                      );
                    }
                  },
                  text: isFriendRequest
                      ? AppConstants.confirm
                      : AppConstants.addFriend,
                  size: 16.sp,
                  width:isFriendRequest? MediaQuery.of(context).size.width * 0.3:MediaQuery.of(context).size.width * 0.6,
                  height: 35.h,
                  radius: 10.r,
                ),
                 SizedBox(
                  width: 15.h,
                ),
             if(isFriendRequest)   CustomButton(
                    onPressed: () {
                      cubit
                          .deleteFriendRequest(friendInfo['id']);
                    },
                    text: isFriendRequest
                        ? AppConstants.delete
                        : AppConstants.remove,
                    size: 16.sp,
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: 35.h,
                    radius: 10.r,
                    color: AppColors.darkGrey,
                    textColor: AppColors.black),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
