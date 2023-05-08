import '../../../core/utils/exports.dart';

class CreateStoryUseCase implements BaseUseCase<void, CreateStoryParameters> {
  final BaseHomeRepository baseHomeRepository;

  CreateStoryUseCase(this.baseHomeRepository);

  @override
  Future<void> call(CreateStoryParameters parameters) async {
    await baseHomeRepository.createStory(parameters);
  }
}
