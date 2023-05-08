
import '../../../core/utils/exports.dart';
import '../repository/profile_base_repository.dart';

class UpdateCoverImageUseCase implements BaseUseCase<void, String> {
  final BaseProfileRepository baseProfileRepository;

  UpdateCoverImageUseCase(this.baseProfileRepository);

  @override
  Future<void> call(String coverImage) async {
    await baseProfileRepository.upDateCoverImage(coverImage);
  }
}
