import '../../../core/utils/exports.dart';
import '../../../notifications_module/data_layer/models/friend_info_model.dart';
import '../../../notifications_module/domain_layer/entities/friend_info.dart';

abstract class BaseNotificationsRepository {

  Future<List<NotificationModel>> getNotifications();
  Future<List<FriendInfo>> getFriendRequests();
  Future<void> requesPermission();
  Future<void> initInfo(BuildContext context);
  Future<void> sendPushNotificationToASpecificUser(
      PushNotificationParameters parameters);
  Future<void> sendPushNotificationToAllUsers(
      PushNotificationParameters parameters);
  Future<void> friendRequest(FriendInfoParamerters paramerters);
  Future<void> addUserFriends(FriendInfoParamerters paramerters);
  Future<List<FriendInfoModel>> getFriends();
  Future<void> deleteFriendRequest(String id);
}

