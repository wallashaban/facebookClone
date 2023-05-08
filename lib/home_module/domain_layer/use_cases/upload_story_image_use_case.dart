import '../../../core/utils/exports.dart';

class UploadStoryImageUseCase implements BaseUseCase<TaskSnapshot, File> {
  final BaseHomeRepository baseHomeRepository;

  UploadStoryImageUseCase(this.baseHomeRepository);

  @override
  Future<TaskSnapshot> call(File image) async {
   return  await baseHomeRepository.uploadStoryImage(image);
  }
}
