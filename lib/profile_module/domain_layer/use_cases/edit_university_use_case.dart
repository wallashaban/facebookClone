import '../../../core/utils/exports.dart';
import '../repository/profile_base_repository.dart';

class EditBUniversityUseCase implements BaseUseCase<void, String> {
  final BaseProfileRepository baseProfileRepository;

  EditBUniversityUseCase(this.baseProfileRepository);

  @override
  Future<void> call(String university) async {
    await baseProfileRepository.editUniversity(university);
  }
}
