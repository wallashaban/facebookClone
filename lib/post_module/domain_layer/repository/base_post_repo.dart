
import '../../../core/utils/exports.dart';
import '../entities/comment.dart';
import '../entities/post.dart';
import '../use_cases/add_comment_use_case.dart';
import '../use_cases/create_post_use_case.dart';
import '../use_cases/like_post_use_case.dart';
abstract class BasePostRepository{
    Future<TaskSnapshot> uploadPostImage(File postImage);
  Future<TaskSnapshot> uploadPostVideo(File postImage);
  Future<void> createPost(CreatePostParameters parameters);
  Future<List<Post>> getUserPosts();
  Future<void> likePost(LikePostParameters parameters);
  Future<List<Post>> getAllPosts();
  Future<void> addComment(AddCommentParameters parameters);
  Future<List<Comment>> getComments(String postId);
  Future<void> deletePost(String postId);
}