import '../../../core/utils/exports.dart';

class Comment extends Equatable {
  final String comment;
  final String uId;
  final String profilePic;
  final String postId;
  final String name;
  final String createdAt;
  const Comment({
    required this.comment,
    required this.uId,
    required this.profilePic,
    required this.postId,
    required this.name,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [comment, uId, profilePic, postId, name];
}
