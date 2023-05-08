import '../../../core/utils/exports.dart';
import '../repository/base_post_repo.dart';

class DeletePostUseCase implements BaseUseCase<void, String> {
  final BasePostRepository basePostRepository;

  DeletePostUseCase(this.basePostRepository);

  @override
  Future<void> call(String postId) async {
    await basePostRepository.deletePost(postId);
  }
}
