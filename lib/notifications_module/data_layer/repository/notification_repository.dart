import '../../../core/utils/exports.dart';
import '../../domain_layer/entities/friend_info.dart';
import '../../domain_layer/repository/base_notification_repository.dart';
import '../data_source/notifications_remote_data_source.dart';
import '../models/friend_info_model.dart';

class NotificationRepository implements BaseNotificationsRepository {
  final BaseNotificationsRemoteDataSource baseNotificationsRepository;

  NotificationRepository(this.baseNotificationsRepository);
  @override
  Future<void> initInfo(BuildContext context) async {
    try {
      return await baseNotificationsRepository.initInfo(context);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> requesPermission() async {
    try {
      return await baseNotificationsRepository.requesPermission();
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> sendPushNotificationToASpecificUser(
      PushNotificationParameters parameters) async {
    try {
      return await baseNotificationsRepository
          .sendPushNotificationToASpecificUser(parameters);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> sendPushNotificationToAllUsers(
      PushNotificationParameters parameters) async {
    try {
      return await baseNotificationsRepository
          .sendPushNotificationToAllUsers(parameters);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<FriendInfo>> getFriendRequests() async {
    try {
      return await baseNotificationsRepository.getFriendRequests();
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      return await baseNotificationsRepository.getNotifications();
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> addUserFriends(FriendInfoParamerters paramerters) async {
    try {
      return await baseNotificationsRepository.addUserFriends(paramerters);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> friendRequest(FriendInfoParamerters paramerters) async {
    try {
      return await baseNotificationsRepository.friendRequest(paramerters);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<FriendInfoModel>> getFriends() async {
    try {
      return await baseNotificationsRepository.getFriends();
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> deleteFriendRequest(String id) async {
    try {
      return await baseNotificationsRepository.deleteFriendRequest(id);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }
}
