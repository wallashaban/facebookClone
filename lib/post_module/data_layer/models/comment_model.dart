import '../../domain_layer/entities/comment.dart';

class CommentModel extends Comment {
 const CommentModel({
    required super.comment,
    required super.uId,
    required super.profilePic,
    required super.postId,
    required super.name,
    required super.createdAt,
  });

   factory CommentModel.fromSnapShot(Map<String ,dynamic> snapshot) {
    return CommentModel(
      uId: snapshot['uId'],
      postId: snapshot['postId'],
      createdAt: snapshot['createdAt'],
      comment: snapshot['comment'],
      profilePic: snapshot['profilePic'],
      name: snapshot['name'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'uId': uId,
      'postId': postId,
      'createdAt': createdAt,
      'comment': comment,
      'profilePic': profilePic,
      'name':name,
    };
  }
}
