import '../../../core/utils/exports.dart';

class NotificationModel extends Notifications {
  const NotificationModel({required super.name,required super.profilePic,required super.uId,
  required super.body,required super.title,
  required super.createdAt});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      name: json['name'],
      profilePic: json['profilePic'],
      uId: json['uId'],
      body: json['body'],
      title: json['title'],
      createdAt:json['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profilePic':profilePic,
      'uId':uId,
      'body':body,
      'title':title,
      'createdAt':createdAt
    };
  }
}
