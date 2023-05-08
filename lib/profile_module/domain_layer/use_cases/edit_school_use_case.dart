import '../../../core/utils/exports.dart';
import '../repository/profile_base_repository.dart';

class EditSchoolUseCase implements BaseUseCase<void, String> {
  final BaseProfileRepository baseProfileRepository;

  EditSchoolUseCase(this.baseProfileRepository);

  @override
  Future<void> call(String school) async {
    await baseProfileRepository.editSchool(school);
  }
}
