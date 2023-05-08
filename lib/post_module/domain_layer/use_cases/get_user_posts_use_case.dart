
import '../../../core/utils/exports.dart';

import '../entities/post.dart';
import '../repository/base_post_repo.dart';

class GetUserPostsUseCase extends BaseUseCase<List<Post>, NoParameters> {
  final BasePostRepository basePostRepository;

  GetUserPostsUseCase(this.basePostRepository);

  @override
  Future<List<Post>> call(NoParameters parameters) async {
    return await basePostRepository.getUserPosts();
  }
}
