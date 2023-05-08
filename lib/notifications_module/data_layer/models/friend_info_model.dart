import '../../domain_layer/entities/friend_info.dart';

class FriendInfoModel extends FriendInfo {
  const FriendInfoModel({
    required super.name,
    required super.profilePic,
    required super.uId,
    required super.id,
  });
  factory FriendInfoModel.fromJson(Map<String, dynamic> json) {
    return FriendInfoModel(
      name: json['name'],
      profilePic: json['profilePic'],
      uId: json['uId'],
      id:json['id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profilePic': profilePic,
      'uId': uId,
      'id':id,
    };
  }
}
