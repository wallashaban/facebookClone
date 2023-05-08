// ignore_for_file: avoid_function_literals_in_foreach_calls


import '../../../core/utils/exports.dart';
import '../../domain_layer/use_cases/add_comment_use_case.dart';
import '../../domain_layer/use_cases/create_post_use_case.dart';
import '../../domain_layer/use_cases/like_post_use_case.dart';
import '../models/comment_model.dart';
import '../models/post_model.dart';

abstract class BasePostRemoteDataSource{
  Future<void> createPost(CreatePostParameters parameters);
  Future<TaskSnapshot> uploadPostImage(File postImage);
  Future<List<PostModel>> getUserPosts();
  Future<void> likePost(LikePostParameters parameters);
  Future<List<PostModel>> getAllPosts();
 
  Future<void> addComment(AddCommentParameters parameters);
  Future<List<CommentModel>> getComments(String postId);
  Future<void> deletePost(String postId);
    Future<TaskSnapshot> uploadPostVideo(File postVideo);

}

class PostRemoteDataSource implements BasePostRemoteDataSource{

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

   @override
  Future<void> createPost(CreatePostParameters parameters) async {
    try {
      final addPost = firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .collection('posts')
          .doc();
      PostModel postModel = PostModel(
        uId: parameters.uId,
        createdAt: parameters.createdAt,
        postId: addPost.id,
        title: parameters.title,
        postImage: parameters.postImage,
        userName: parameters.userName,
        profilePic: parameters.profilePic,
        video: parameters.video,
      );
      final post = postModel.toDocument();
      await firebaseFirestore.collection('allPosts').doc(addPost.id).set(
            post,
          );
      await addPost.set(post);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<TaskSnapshot> uploadPostImage(File postImage) async {
    try {
      return await firebaseStorage
          .ref()
          .child('postsImages/${Uri.file(postImage.path).pathSegments.last}')
          .putFile(postImage);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<PostModel>> getUserPosts() async {
    try {
      List<PostModel> posts = [];
      await firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .collection('posts').orderBy(
            'createdAt',
            descending: true,
          )
          .get()
          .then((post) {
        post.docs.forEach((post) {
          posts.add(PostModel.fromSnapShot(post.data()));
        });
      });

      return posts;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> likePost(LikePostParameters parameters) async {
    try {
      if (parameters.likes.contains(parameters.userId)) {
        debugPrint('like ${parameters.likes.length}');
        await firebaseFirestore
            .collection('allPosts')
            .doc(parameters.postId)
            .update({
          'likes': FieldValue.arrayRemove([parameters.userId]),
        });
      } else {
        debugPrint('unlike${parameters.likes.length}');
        await firebaseFirestore
            .collection('allPosts')
            .doc(parameters.postId)
            .update({
          'likes': FieldValue.arrayUnion([parameters.userId]),
        });
      }
    } catch (error) {
      throw Exception(error);
    }
  }



  @override
  Future<List<PostModel>> getAllPosts() async {
    try {
      List<PostModel> allPosts = [];
      await firebaseFirestore.collection('allPosts').orderBy(
            'createdAt',
            descending: true,
          ).get().then((post) {
        post.docs.forEach((post) {
          allPosts.add(PostModel.fromSnapShot(post.data()));
        });
      });
      //debugPrint('all Posts ${allPosts}');
      return allPosts;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> addComment(AddCommentParameters parameters) async {
    try {
      CommentModel comment = CommentModel(
        comment: parameters.comment,
        uId: parameters.uId,
        profilePic: parameters.profilePic,
        postId: parameters.postId,
        name: parameters.name,
        createdAt: parameters.createdAt,
      );
      await firebaseFirestore
          .collection('allPosts')
          .doc(parameters.postId)
          .collection('comments')
          .doc()
          .set(comment.toDocument());
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<CommentModel>> getComments(String postId) async {
    try {
      List<CommentModel> comments = [];
      await firebaseFirestore
          .collection('allPosts')
          .doc(postId)
          .collection('comments')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .get()
          .then((comment) async {
        //            debugPrint('comment ${comment}');
        comment.docs.forEach((comment) {
          debugPrint('comment data source $comment');
          comments.add(CommentModel.fromSnapShot(comment.data()));
        });
      });
      //debugPrint('all Posts ${allPosts}');
      return comments;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> deletePost(String postId) async {
    try {
      await firebaseFirestore.collection('allPosts').doc(postId).delete();
    } catch (error) {
      throw Exception(error);
    }
  }


  @override
  Future<TaskSnapshot> uploadPostVideo(File postVideo) async {
    try {
      return await firebaseStorage
          .ref()
          .child('postsVideos/${Uri.file(postVideo.path).pathSegments.last}')
          .putFile(postVideo);
    } catch (error) {
      throw Exception(error);
    }
  }

 
}