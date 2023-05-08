import '../../../core/utils/exports.dart';
import '../../domain_layer/entities/friend_info.dart';
import '../../domain_layer/use_cases/add_user_friends_use_case.dart';
import '../../domain_layer/use_cases/delete_friend_reqest_use_case.dart';
import '../../domain_layer/use_cases/friend_request_use_case.dart';
import '../../domain_layer/use_cases/get_all_friend_requests_use_case.dart';
import '../../domain_layer/use_cases/get_all_notifications_use_case.dart';
import '../../domain_layer/use_cases/get_friends_use_case.dart';
import '../../domain_layer/use_cases/init_info_use_case.dart';
import '../../domain_layer/use_cases/push_notification_to_all_users_use_case.dart';
import '../../domain_layer/use_cases/push_notification_to_aspecific_user_use_case.dart';
import '../../domain_layer/use_cases/request_permission_use_case.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final GetNotificationsUsersUseCase getNotificationsUsersUseCase;
  final GetFriendRequestsUseCase getFriendRequestsUseCase;
  final GetFriendsUseCase getFriendsUseCase;
  final AddUserFriendUseCase addUserFriendUseCase;
  final FriendRequestUseCase friendRequestUseCase;
  final DeleteFriendRequestUseCase deleteFriendRequestUseCase;
  final RequestPermissionUseCase requestPermissionUseCase;
  final InitInfoUseCase initInfoUseCase;
  final PushNotificationToAspecificUserUseCae
      pushNotificationToAspecificUserUseCae;
  final PushNotificationToallUsersUseCae pushNotificationToallUsersUseCae;
  NotificationsCubit(
    this.requestPermissionUseCase,
    this.initInfoUseCase,
    this.pushNotificationToAspecificUserUseCae,
    this.pushNotificationToallUsersUseCae,
    this.getNotificationsUsersUseCase,
    this.getFriendRequestsUseCase,
    this.getFriendsUseCase,
    this.addUserFriendUseCase,
    this.friendRequestUseCase,
    this.deleteFriendRequestUseCase,
  ) : super(NotificationsInitial());

  sendPushNotificationToASpecificUser(
      PushNotificationParameters parameters) async {
    emit(SendPushNotificationToASpecificUserLoadingState());
    /*    NotificationModel notificationModel = NotificationModel(
      name: '${user.firstName} ${user.surName}',
      profilePic: user.image!,
      uId: user.uId,
      body: parameters.body,
      title: parameters.title,
      createdAt: DateTime.now().toString(),
    ); */
    await pushNotificationToAspecificUserUseCae(parameters).then((value) async {
      /*  await FirebaseFirestore.instance
          .collection('user')
          .doc(user.uId)
          .collection('friendRequests')
          .doc()
          .set(notificationModel.toJson()); */
      emit(SendPushNotificationToASpecificUserSuccessState());
    }).catchError((error) {
      debugPrint('error ${error.toString()}');
      emit(
        SendPushNotificationToASpecificUserErrorState(error: error.toString()),
      );
    });
  }

  sendPushNotificationToAllUsers(PushNotificationParameters parameters) async {
    emit(SendPushNotificationToAllUsersLoadingState());
    NotificationModel notificationModel = NotificationModel(
      name: parameters.name,
      profilePic:parameters.profilePic,
      uId: parameters .uId,
      body: parameters.body,
      title: parameters.title,
      createdAt: DateTime.now().toString(),
    );
    await pushNotificationToallUsersUseCae(parameters).then((value) async {
      await FirebaseFirestore.instance
          .collection('notifications')
          .doc()
          .set(notificationModel.toJson());
      emit(SendPushNotificationToAllUsersSuccessState());
    }).catchError((error) {
      debugPrint('error ${error.toString()}');
      emit(
        SendPushNotificationToAllUsersErrorState(error: error.toString()),
      );
    });
  }

  Future requesPermission() async {
    emit(RequestPermissionLoadingState());
    requestPermissionUseCase(const NoParameters()).then((value) {
      emit(RequestPermissionSuccessState());
    }).catchError((error) {
      debugPrint('error ${error.toString()}');
      emit(RequestPermissionErrorState(error: error.toString()));
    });
  }

  Future initInfo(context) async {
    emit(InitinfoLoadingState());
    initInfoUseCase(context).then((user) {
      emit(InitinfoSuccessState());
    }).catchError((error) {
      debugPrint('error ${error.toString()}');
      emit(InitinfoErrorState(error: error.toString()));
    });
  }

  List<Notifications> notifications = [];
  Future getAllNotifications() async {
    emit(GetNotificationsLoadingState());
    getNotificationsUsersUseCase(const NoParameters()).then((notifications) {
      this.notifications = notifications;
      emit(GetNotificationsSuccessState());
    }).catchError((error) {
      debugPrint('error ${error.toString()}');
      emit(GetNotificationsErrorState(error: error.toString()));
    });
  }

  List<FriendInfo> friendRequests = [];
  Future getFriendRequests() async {
    emit(GetFriendRequestsLoadingState());
    getFriendRequestsUseCase(const NoParameters()).then((friendRequests) {
      this.friendRequests = friendRequests;
      emit(GetFriendRequestsSuccessState());
    }).catchError((error) {
      debugPrint('error friend request${error.toString()}');
      emit(GetFriendRequestsErrorState(error: error.toString()));
    });
  }

  List<FriendInfo> friends = [];
  Future getFriends() async {
    emit(GetFriendFriendsLoadingState());
    getFriendsUseCase(const NoParameters()).then((friends) {
      this.friends = friends;
      emit(GetFriendFriendsSuccessState());
    }).catchError((error) {
      debugPrint('error ${error.toString()}');
      emit(GetFriendFriendsErrorState(error: error.toString()));
    });
  }

  Future addFriendUserFriend(FriendInfoParamerters paramerters) async {
    emit(AddUserFriendLoadingState());
    addUserFriendUseCase(paramerters).then((value) {
      emit(AddUserFriendSuccessState());
    }).catchError((error) {
      debugPrint('error ${error.toString()}');
      emit(AddUserFriendErrorState(error: error.toString()));
    });
  }

  Future friendRequest(FriendInfoParamerters paramerters) async {
    emit(FriendRequestLoadingState());
    friendRequestUseCase(paramerters).then((value) {
      emit(FriendRequestSuccessState());
    }).catchError((error) {
      debugPrint('error ${error.toString()}');
      emit(FriendRequestErrorState(error: error.toString()));
    });
  }

  Future deleteFriendRequest(String id) async {
    emit(DeleteFriendRequestLoadingState());
    deleteFriendRequestUseCase(id).then((value) {
      emit(DeleteFriendRequestSuccessState());
      getFriendRequests();
    }).catchError((error) {
      debugPrint('error delete friend request${error.toString()}');
      emit(DeleteFriendRequestErrorState(error: error.toString()));
    });
  }
}
