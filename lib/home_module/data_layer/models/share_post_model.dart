// ignore_for_file: must_be_immutable

import '../../domain_layer/entities/share_post.dart';

class SharePostModel extends SharePost {
  SharePostModel({
    required super.userName,
    required super.uId,
    required super.profilePicture,
    required super.createdAt,
    super.title,
    required super.postId,
    super.likes,
  });
  factory SharePostModel.fromsnap(Map<String, dynamic> snapshot) {
    return SharePostModel(
      userName: snapshot['userName'],
      uId: snapshot['uId'],
      profilePicture: snapshot['profilePicture'],
      createdAt: snapshot['createdAt'],
      title: snapshot['title'],
      postId: snapshot['post'],
      likes: snapshot['likes'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'uId':uId,
      'userName':userName,
      'profilePicture':profilePicture,
      'postId':postId,
      'createdAt':createdAt,
      'title':title,
      'likes':likes,
    };
  }
}
