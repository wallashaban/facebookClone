// ignore_for_file: must_be_immutable

import 'package:facebook_app/core/utils/exports.dart';

class SharePost extends Equatable {
  String userName;
  String uId;
  String profilePicture;
  String createdAt;
  String? title;
  List? likes;
  String postId;
  SharePost({
    required this.userName,
    required this.uId,
    required this.profilePicture,
    required this.createdAt,
     this.title,
    this.likes,
    required this.postId,
  });
  @override
  List<Object?> get props => [
    uId,
    userName,
    profilePicture,
    createdAt,
    title,
    likes,
    postId,
  ];
}
