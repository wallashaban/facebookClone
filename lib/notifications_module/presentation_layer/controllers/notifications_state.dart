part of 'notifications_cubit.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

class NotificationsInitial extends NotificationsState {}

class RequestPermissionSuccessState extends NotificationsState {}

class RequestPermissionLoadingState extends NotificationsState {}

class RequestPermissionErrorState extends NotificationsState {
  final String error;
  const RequestPermissionErrorState({
    required this.error,
  });
}

class InitinfoSuccessState extends NotificationsState {}

class InitinfoLoadingState extends NotificationsState {}

class InitinfoErrorState extends NotificationsState {
  final String error;
  const InitinfoErrorState({
    required this.error,
  });
}

class SendPushNotificationToASpecificUserSuccessState extends NotificationsState {}

class SendPushNotificationToASpecificUserLoadingState extends NotificationsState {}

class SendPushNotificationToASpecificUserErrorState extends NotificationsState {
  final String error;
  const SendPushNotificationToASpecificUserErrorState({
    required this.error,
  });
}

class SendPushNotificationToAllUsersSuccessState extends NotificationsState {}

class SendPushNotificationToAllUsersLoadingState extends NotificationsState {}

class SendPushNotificationToAllUsersErrorState extends NotificationsState {
  final String error;
  const SendPushNotificationToAllUsersErrorState({
    required this.error,
  });
}



class GetNotificationsSuccessState extends NotificationsState {}

class GetNotificationsLoadingState extends NotificationsState {}

class GetNotificationsErrorState extends NotificationsState {
  final String error;
  const GetNotificationsErrorState({
    required this.error,
  });
}

class GetFriendRequestsSuccessState extends NotificationsState {}

class GetFriendRequestsLoadingState extends NotificationsState {}

class GetFriendRequestsErrorState extends NotificationsState {
  final String error;
  const GetFriendRequestsErrorState({
    required this.error,
  });
}

class GetFriendFriendsSuccessState extends NotificationsState {}

class GetFriendFriendsLoadingState extends NotificationsState {}

class GetFriendFriendsErrorState extends NotificationsState {
  final String error;
  const GetFriendFriendsErrorState({
    required this.error,
  });
}

class FriendRequestSuccessState extends NotificationsState {}

class FriendRequestLoadingState extends NotificationsState {}

class FriendRequestErrorState extends NotificationsState {
  final String error;
  const FriendRequestErrorState({
    required this.error,
  });
}

class AddUserFriendSuccessState extends NotificationsState {}

class AddUserFriendLoadingState extends NotificationsState {}

class AddUserFriendErrorState extends NotificationsState {
  final String error;
  const AddUserFriendErrorState({
    required this.error,
  });
}

class DeleteFriendRequestSuccessState extends NotificationsState {}

class DeleteFriendRequestLoadingState extends NotificationsState {}

class DeleteFriendRequestErrorState extends NotificationsState {
  final String error;
  const DeleteFriendRequestErrorState({
    required this.error,
  });
}
