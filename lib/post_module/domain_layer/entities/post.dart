import '../../../core/utils/exports.dart';

class Post extends Equatable {
  final String userName;
  final String profilePic;
  final String uId;
  final String postId;
  final String createdAt;
  final String? title;
  final String? postImage;
  final String? video;
  final List? likes;
  final int share;
  const Post({
    required this.userName,
    required this.profilePic,
    required this.uId,
    required this.postId,
    required this.createdAt,
    required this.video,
    this.title,
    this.postImage,
    this.likes = const [],
    this.share = 0,
  });

  @override
  List<Object?> get props => [
        uId,
        postId,
        createdAt,
        title,
        postImage,
        likes,
        share,
        userName,
        profilePic,
        video,
      ];
}
