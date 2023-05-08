import '../../../core/utils/exports.dart';
import '../entities/post.dart';
import '../repository/base_post_repo.dart';

class GetAllPostsUseCase extends BaseUseCase<List<Post>, NoParameters> {
  final BasePostRepository basePostRepository;

  GetAllPostsUseCase(this.basePostRepository);

  @override
  Future<List<Post>> call(NoParameters parameters) async {
    return await basePostRepository.getAllPosts();
  }
}
