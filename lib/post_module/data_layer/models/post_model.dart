
import '../../domain_layer/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required super.userName,
    required super.profilePic,
    required super.uId,
    required super.postId,
    required super.createdAt,
    required super.video,
    super.title,
    super.likes,
    super.postImage,
    super.share,
  });

  factory PostModel.fromSnapShot(Map<String ,dynamic> snapshot) {
    return PostModel(
      uId: snapshot['uId'],
      postId: snapshot['postId'],
      createdAt: snapshot['createdAt'],
      title: snapshot['title'],
      postImage: snapshot['postImage'],
      share: snapshot['share'],
      likes: snapshot['likes'],
      userName:snapshot['userName'],
      profilePic:snapshot['profilePic'],
      video: snapshot['video'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'uId': uId,
      'postId': postId,
      'createdAt': createdAt,
      'title': title,
      'postImage': postImage,
      'share': share,
      'likes':likes,
      'userName':userName,
      'profilePic':profilePic,
      'video':video,
    };
  }
}
