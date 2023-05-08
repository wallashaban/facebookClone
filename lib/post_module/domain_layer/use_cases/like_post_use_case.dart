// ignore_for_file: avoid_renaming_method_parameters

import 'package:facebook_app/core/utils/exports.dart';

import '../repository/base_post_repo.dart';

class LikePostUseCase extends BaseUseCase<void, LikePostParameters> {
  final BasePostRepository basePostRepository;

  LikePostUseCase(this.basePostRepository);

  @override
  Future<void> call(LikePostParameters parameters) async {
    return await basePostRepository.likePost(
      parameters,
    );
  }
}

class LikePostParameters {
  final String userId;
  final String postId;
  final List likes;
  const LikePostParameters({
    required this.userId,
    required this.postId,
    required this.likes,
  });
}
