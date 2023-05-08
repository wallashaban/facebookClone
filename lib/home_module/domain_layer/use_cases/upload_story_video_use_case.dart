import '../../../core/utils/exports.dart';

class UploadStoryVideoUseCase implements BaseUseCase<TaskSnapshot, File> {
  final BaseHomeRepository baseHomeRepository;

  UploadStoryVideoUseCase(this.baseHomeRepository);

  @override
  Future<TaskSnapshot> call(File video) async {
   return  await baseHomeRepository.uploadStoryVideo(video);
  }
}
