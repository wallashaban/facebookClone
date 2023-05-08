import '../../../core/utils/exports.dart';
import '../repository/base_post_repo.dart';

class CreatePostUseCase implements BaseUseCase<void, CreatePostParameters> {
  final BasePostRepository basePostRepository;

  CreatePostUseCase(this.basePostRepository);

  @override
  Future<void> call(CreatePostParameters parameters) async {
    await basePostRepository.createPost(
      parameters,
    );
  }
}

class CreatePostParameters {
  String uId;
  String userName;
  String profilePic;
  String? title;
  String? postImage;
  String createdAt;
  String? video;
  CreatePostParameters({
    this.title,
    this.postImage,
    required this.createdAt,
    required this.uId,
    required this.userName,
    required this.profilePic,
    required this.video,
  });
}
