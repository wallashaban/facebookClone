
import '../../../core/utils/exports.dart';
import '../../domain_layer/entities/comment.dart';
import '../../domain_layer/entities/post.dart';
import '../../domain_layer/repository/base_post_repo.dart';
import '../../domain_layer/use_cases/add_comment_use_case.dart';
import '../../domain_layer/use_cases/create_post_use_case.dart';
import '../../domain_layer/use_cases/like_post_use_case.dart';
import '../data_source/post_remote_data_source.dart';

class PostRepository implements BasePostRepository {
  final BasePostRemoteDataSource basePostRemoteDataSource;

  PostRepository(this.basePostRemoteDataSource);

    @override
  Future<void> createPost(CreatePostParameters parameters) async {
    try {
      await basePostRemoteDataSource.createPost(parameters);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<TaskSnapshot> uploadPostImage(File postImage) async {
    try {
      return await basePostRemoteDataSource.uploadPostImage(postImage);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<Post>> getUserPosts() async {
    try {
      return await basePostRemoteDataSource.getUserPosts();
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> likePost(LikePostParameters parameters) async {
    await basePostRemoteDataSource.likePost(
      parameters,
    );
  }




  @override
  Future<List<Post>> getAllPosts() async {
    try {
      return await basePostRemoteDataSource.getAllPosts();
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

 

  @override
  Future<void> addComment(AddCommentParameters parameters) async {
    try {
      await basePostRemoteDataSource.addComment(parameters);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<Comment>> getComments(String postId) async {
    try {
      return await basePostRemoteDataSource.getComments(postId);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> deletePost(String postId) async {
    try {
      await basePostRemoteDataSource.deletePost(postId);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<TaskSnapshot> uploadPostVideo(File postVideo) async {
    try {
      return await basePostRemoteDataSource.uploadPostVideo(postVideo);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }
}
