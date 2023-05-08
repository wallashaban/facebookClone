import '../../../core/utils/exports.dart';
import '../repository/base_post_repo.dart';


class UploadPostImageUseCase implements BaseUseCase<TaskSnapshot, File> {
  final BasePostRepository basePostRepository;

  UploadPostImageUseCase(this.basePostRepository);

  @override
  Future<TaskSnapshot> call(File postImage) async {
   return await basePostRepository.uploadPostImage(
      postImage,
    );
  }
}
