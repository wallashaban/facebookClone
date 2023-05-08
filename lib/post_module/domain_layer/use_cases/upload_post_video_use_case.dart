import '../../../core/utils/exports.dart';
import '../repository/base_post_repo.dart';


class UploadPostVideoUseCase implements BaseUseCase<TaskSnapshot, File> {
  final BasePostRepository basePostRepository;

  UploadPostVideoUseCase(this.basePostRepository);

  @override
  Future<TaskSnapshot> call(File postVideo) async {
   return await basePostRepository.uploadPostVideo(
      postVideo,
    );
  }
}
