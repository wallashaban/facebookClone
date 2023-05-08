// ignore_for_file: prefer_typing_uninitialized_variables

import '../../../core/utils/exports.dart';
import '../../data_layer/models/post_model.dart';
import '../../domain_layer/entities/comment.dart';
import '../../domain_layer/entities/post.dart';
import '../../domain_layer/use_cases/add_comment_use_case.dart';
import '../../domain_layer/use_cases/create_post_use_case.dart';
import '../../domain_layer/use_cases/delete_post_use_case.dart';
import '../../domain_layer/use_cases/get_all_posts_use_case.dart';
import '../../domain_layer/use_cases/get_comments_use_case.dart';
import '../../domain_layer/use_cases/get_user_posts_use_case.dart';
import '../../domain_layer/use_cases/like_post_use_case.dart';
import '../../domain_layer/use_cases/upload_post_image_use_case.dart';
import '../../domain_layer/use_cases/upload_post_video_use_case.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final CreatePostUseCase createPostUseCase;
  final UploadPostImageUseCase uploadPostImageUseCase;
  final UploadPostVideoUseCase uploadPostvideoUseCase;
  final GetUserPostsUseCase getUserPostsUseCase;
  final LikePostUseCase likePostUseCase;
  final GetAllPostsUseCase getAllPostsUseCase;
  final AddCommentUseCase addCommentUseCase;
  final GetCommentsUseCase getCommentsUseCase;
  final DeletePostUseCase deletePostUseCase;
  PostCubit(
    this.createPostUseCase,
    this.uploadPostImageUseCase,
    this.getUserPostsUseCase,
    this.likePostUseCase,
    this.getAllPostsUseCase,
    this.addCommentUseCase,
    this.getCommentsUseCase,
    this.deletePostUseCase,
    this.uploadPostvideoUseCase,
  ) : super(PostInitial());

  List<Comment> comments = [];
  List<Post> userPosts = [];
  List<Post> allPosts = [];
  Post post = const PostModel(
    uId: 'uId',
    postId: 'postId',
    createdAt: 'createdAt',
    userName: '',
    profilePic: '',
    video: '',
  );
  File? postImage;
  String? imageOfPost;
  String? video;
  File? pickVideo;
  Future pickVideoFile() async {
    final picker = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (picker != null) {
      pickVideo = File(picker.path);
    }
    emit(Doneee());
  }

  Future createPost(CreatePostParameters parameters) async {
    emit(CreatePostLoadingState());
    createPostUseCase(parameters).then((value) {
      emit(CreatePostSuccessState());
      getAllPosts();
    }).catchError((error) {
      debugPrint(error.toString());
      emit(
        CreatePostErrorState(
          error: error.toString(),
        ),
      );
    });
    // });
  }

  Future uploadPostVideo() async {
    emit(UploadPostVideoLoadingState());
    await uploadPostvideoUseCase(pickVideo as File).then((value) async {
      video = await value.ref.getDownloadURL();
      emit(UploadPostVideoSuccessState());
      pickVideo = null;
    }).catchError((error) {
      debugPrint(error.toString());
      emit(
        UploadPostVideoErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  final picker = ImagePicker();
  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
    }
    emit(PickPostImageSuccessState());
    emit(Doneee());
  }

  Future uploadPostImage() async {
    emit(UploadPostImageLoadingState());
    await uploadPostImageUseCase(postImage!).then((value) async {
      imageOfPost = await value.ref.getDownloadURL();
      emit(UploadPostImageSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(
        UploadPostImageErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  likePost(LikePostParameters parameters) async {
    emit(LikePostLoadingState());
    likePostUseCase(
      parameters,
    ).then((value) {
      emit(LikePostSuccessState());
      // getAllPosts();
    }).catchError((error) {
      debugPrint('like error ${error.toString()}');
      emit(
        LikePostErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  Future addComment(AddCommentParameters parameters) async {
    emit(AddCommentLoadingState());
    await addCommentUseCase(parameters).then((value) {
      emit(AddCommentSuccessState());
      getcomments(parameters.postId);
    }).catchError((error) {
      emit(
        AddCommentErrorState(error: error.toString()),
      );
    });
  }

  Future getcomments(String postId) async {
    emit(GetCommentLoadingState());
    await getCommentsUseCase(postId).then(
      (comments) {
        this.comments = comments;
        // debugPrint('commnet ${this.comments[0].comment}');

        //debugPrint('likes posts ${allPostsLikes.length}');
        emit(GetCommentSuccessState());
      },
    ).catchError((error) {
      debugPrint('error posts${error.toString()}');
      emit(GetCommentErrorState(error: error.toString()));
    });
  }

  Future deletePost(String postId) async {
    emit(DeletePostLoadingState());
    await deletePostUseCase(postId).then(
      (value) {
        emit(DeletetPostSuccessState());
        getAllPosts();
      },
    ).catchError((error) {
      debugPrint('error posts${error.toString()}');
      emit(DeletePostErrorState(error: error.toString()));
    });
  }

  getAllPosts() async {
    emit(GetAllPostsLoadingState());
    await getAllPostsUseCase(const NoParameters()).then(
      (allPosts) {
        this.allPosts = allPosts;
        debugPrint('post ${this.allPosts[0].likes}');

        emit(GetAllPostsSuccessState());
        pickVideo = null;
        postImage = null;
        imageOfPost = null;
        video = null;
      },
    ).catchError((error) {
      debugPrint('error posts${error.toString()}');
      emit(GetAllPostsErrorState(error: error.toString()));
    });
  }
}
