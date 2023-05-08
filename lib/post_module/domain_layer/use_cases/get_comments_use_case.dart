import '../../../core/utils/exports.dart';
import '../entities/comment.dart';
import '../repository/base_post_repo.dart';

class GetCommentsUseCase implements BaseUseCase<List<Comment>, String> {
  final BasePostRepository basePostRepository;

  GetCommentsUseCase(this.basePostRepository);
  @override
  Future<List<Comment>> call(String postId) async {
    return await basePostRepository.getComments(postId);
  }
}
