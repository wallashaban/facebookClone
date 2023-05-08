// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

import '../../../core/utils/exports.dart';
import '../models/friend_info_model.dart';

abstract class BaseNotificationsRemoteDataSource{
    Future<List<NotificationModel>> getNotifications();
  Future<List<FriendInfoModel>> getFriendRequests();
  Future<void> friendRequest(FriendInfoParamerters paramerters);
  Future<void> addUserFriends(FriendInfoParamerters paramerters);
  Future<List<FriendInfoModel>> getFriends();
  Future<void> deleteFriendRequest(String id);
  Future<void> requesPermission();
  Future<void> initInfo(BuildContext context);
  Future<void> sendPushNotificationToASpecificUser(
      PushNotificationParameters parameters);
  Future<void> sendPushNotificationToAllUsers(
      PushNotificationParameters parameters);
}

class NotificationsRemoteDataSource implements BaseNotificationsRemoteDataSource{
   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;


   @override
  Future<void> initInfo(BuildContext context) async {
    try {
      var androidInitialize =
          const AndroidInitializationSettings('@mipmap/ic_launcher');
      var initializationSettings =
          InitializationSettings(android: androidInitialize);
      FlutterLocalNotificationsPlugin().initialize(
        initializationSettings,
       /*  onSelectNotification: (payload) async {
          try {
            if (payload != null && payload.isNotEmpty) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const NotificationScreen(),
                ),
              );
            } else {}
          } catch (error) {
            debugPrint('error${error.toString()}');
          }
        }, */
      );

      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        debugPrint('============onMessaging===============');
        debugPrint(
            'onMessage ${message.notification!.title!} ${message.notification!.body}');
        await FirebaseFirestore.instance
            .collection('notifications')
            .doc(auth.currentUser!.uid)
            .set({
          'title': message.notification!.title,
          'body': message.notification!.body,
          'uId': auth.currentUser!.uid,
        });
        BigTextStyleInformation bigTextStyleInformation =
            BigTextStyleInformation(
          message.notification!.body.toString(),
          htmlFormatBigText: true,
          contentTitle: message.notification!.title.toString(),
          htmlFormatContentTitle: true,
        );

        AndroidNotificationDetails androidPlatformChannels =
            AndroidNotificationDetails(
          'facebook',
          'facebook',
         // '',
          importance: Importance.high,
          styleInformation: bigTextStyleInformation,
          priority: Priority.max,
          playSound: true,
        );

        NotificationDetails notificationDetails = NotificationDetails(
          android: androidPlatformChannels,
        );
        await FlutterLocalNotificationsPlugin().show(
          0,
          message.notification!.title,
          message.notification!.body,
          notificationDetails,
          payload: message.data['body'],
        );
      });
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> requesPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      debugPrint('User granted provisional permission');
    } else {
      debugPrint('User declined or has not accepted permission');
    }
  }

  @override
  Future<void> sendPushNotificationToASpecificUser(
      PushNotificationParameters parameters) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-type': 'application/json',
          'Authorization':
              'key=AAAATZ5vqX8:APA91bHIVaRZK43oSXbt67PSzzFZFQIqRPKDqqWBPeKjS7XZVykIJY6GiopnwP1um9HF6V0GAHaffUyBtM4QWoo5jH5ve-gtAR10BNYSVnlztG2HQ9-AUYtL0-i-10ehD-nfJnVjUlfK',
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': parameters.body,
              'title': parameters.title,
            },
            'notification': <String, dynamic>{
              'body': parameters.body,
              'title': parameters.title,
              'android_channel_id': 'facebook',
            },
            'to': parameters.token,
          },
        ),
      );
    } catch (error) {
      debugPrint('error ${error.toString()}');
    }
   
  }

  @override
  Future<void> sendPushNotificationToAllUsers(
      PushNotificationParameters parameters) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-type': 'application/json',
          'Authorization':
              'key=AAAATZ5vqX8:APA91bHIVaRZK43oSXbt67PSzzFZFQIqRPKDqqWBPeKjS7XZVykIJY6GiopnwP1um9HF6V0GAHaffUyBtM4QWoo5jH5ve-gtAR10BNYSVnlztG2HQ9-AUYtL0-i-10ehD-nfJnVjUlfK',
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': parameters.body,
              'title': parameters.title,
            },
            'notification': <String, dynamic>{
              'body': parameters.body,
              'title': parameters.title,
              'android_channel_id': 'facebook',
            },
            'to': '/topics/TPITO', // token,
          },
        ),
      );
    } catch (error) {
      debugPrint('error ${error.toString()}');
    }
   
  }


  @override
  Future<List<FriendInfoModel>> getFriendRequests() async {
    try {
      List<FriendInfoModel> friendRequests = [];
      await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .collection('friendRequests')
          .get()
          .then((friendRequest) {
        friendRequest.docs.forEach((friendRequest) {
          friendRequests.add(FriendInfoModel.fromJson(friendRequest.data()));
        });
      });
      debugPrint('all friend request $friendRequests');
      return friendRequests;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      List<NotificationModel> notifications = [];
      await firebaseFirestore
          .collection('notifications')
          .get()
          .then((notification) {
        notification.docs.forEach((notification) {
          notifications.add(NotificationModel.fromJson(notification.data()));
        });
      });
      debugPrint('all ntofications $notifications');
      return notifications;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> friendRequest(FriendInfoParamerters paramerters) async {
    try {
      final data = firebaseFirestore
          .collection('user')
          .doc(paramerters.uId)
          .collection('friendRequests')
          .doc();
      FriendInfoModel friendInfoModel = FriendInfoModel(
        name: paramerters.name,
        profilePic: paramerters.profilePic,
        uId: auth.currentUser!.uid,
        id: data.id,
      );
      await data.set(friendInfoModel.toJson());
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> addUserFriends(FriendInfoParamerters paramerters) async {
    try {
      final data = firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .collection('friends')
          .doc();
      FriendInfoModel friendInfoModel = FriendInfoModel(
        name: paramerters.name,
        profilePic: paramerters.profilePic,
        uId: paramerters.uId,
        id: data.id,
      );
      await data.set(friendInfoModel.toJson());
      await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .collection('friendRequests')
          .doc(paramerters.id)
          .delete();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<FriendInfoModel>> getFriends() async {
    try {
      List<FriendInfoModel> friends = [];
      await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .collection('friends')
          .get()
          .then((friend) {
        friend.docs.forEach((friendRequest) {
          friends.add(FriendInfoModel.fromJson(friendRequest.data()));
        });
      });
      debugPrint('all friends $friends');
      return friends;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> deleteFriendRequest(String id) async {
    try {
      await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .collection('friendRequests')
          .doc(id)
          .delete();
    } catch (error) {
      throw Exception(error);
    }
  }
}