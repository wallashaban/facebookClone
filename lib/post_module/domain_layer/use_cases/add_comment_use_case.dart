import '../../../core/utils/exports.dart';

import '../repository/base_post_repo.dart';

class AddCommentUseCase implements BaseUseCase<void, AddCommentParameters> {
  final BasePostRepository basePostRepository;

  AddCommentUseCase(this.basePostRepository);

  @override
  Future<void> call(AddCommentParameters parameters) async {
    await basePostRepository.addComment(parameters);
  }
}

class AddCommentParameters {
  String comment;
  String uId;
  String profilePic;
  String postId;
  String name;
  String createdAt;
  AddCommentParameters({
    required this.comment,
    required this.uId,
    required this.profilePic,
    required this.postId,
    required this.name,
    required this.createdAt,
  });
}
