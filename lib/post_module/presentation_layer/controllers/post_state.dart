part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PickPostImageSuccessState extends PostState{}
class Doneee extends PostState{}

class GetUserPostsSuccessState extends PostState {}

class GetUserPostsLoadingState extends PostState {}

class GetUserPostsErrorState extends PostState {
  final String error;
  const GetUserPostsErrorState({
    required this.error,
  });
}

class LikedPost extends PostState {}

class UnLikedPost extends PostState {}

class GetAllPostsSuccessState extends PostState {}

class GetAllPostsLoadingState extends PostState {}

class GetAllPostsErrorState extends PostState {
  final String error;
  const GetAllPostsErrorState({
    required this.error,
  });
}

class LikePostLoadingState extends PostState {}

class LikePostSuccessState extends PostState {}

class LikePostErrorState extends PostState {
  final String error;
  const LikePostErrorState({
    required this.error,
  });
}

class AddCommentLoadingState extends PostState {}

class AddCommentSuccessState extends PostState {}

class AddCommentErrorState extends PostState {
  final String error;
  const AddCommentErrorState({
    required this.error,
  });
}

class GetCommentLoadingState extends PostState {}

class GetCommentSuccessState extends PostState {}

class GetCommentErrorState extends PostState {
  final String error;
  const GetCommentErrorState({
    required this.error,
  });
}

class DeletePostLoadingState extends PostState {}

class DeletetPostSuccessState extends PostState {}

class DeletePostErrorState extends PostState {
  final String error;
  const DeletePostErrorState({
    required this.error,
  });
}

class PickVideoSuccessState extends PostState {}

class PlayVideoSuccessState extends PostState {}

class PlayAndPauseVideoState extends PostState {}


class CreatePostLoadingState extends PostState {}

class CreatePostSuccessState extends PostState {}

class CreatePostErrorState extends PostState {
  final String error;
  const CreatePostErrorState({
    required this.error,
  });
}

class UploadPostImageLoadingState extends PostState {}

class UploadPostImageSuccessState extends PostState {}

class UploadPostImageErrorState extends PostState {
  final String error;
  const UploadPostImageErrorState({
    required this.error,
  });
}

class UploadPostVideoLoadingState extends PostState {}

class UploadPostVideoSuccessState extends PostState {}

class UploadPostVideoErrorState extends PostState {
  final String error;
  const UploadPostVideoErrorState({
    required this.error,
  });
}
