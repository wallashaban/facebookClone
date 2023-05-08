import '../../../core/utils/exports.dart';
import '../entities/story.dart';

class GetAllStoriesUseCase implements BaseUseCase<List<Story>, NoParameters> {
  final BaseHomeRepository baseHomeRepository;

  GetAllStoriesUseCase(this.baseHomeRepository);

  @override
  Future<List<Story>> call(NoParameters parameters) async {
   return await baseHomeRepository.getAllStories();
  }
}
