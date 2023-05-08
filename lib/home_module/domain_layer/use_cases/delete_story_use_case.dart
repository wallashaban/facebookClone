import '../../../core/utils/exports.dart';

class DeleteStoryUseCase implements BaseUseCase<void, String> {
  final BaseHomeRepository baseHomeRepository;

  DeleteStoryUseCase(this.baseHomeRepository);

  @override
  Future<void> call(String storyId) async {
    await baseHomeRepository.deleteStory(storyId);
  }
}
