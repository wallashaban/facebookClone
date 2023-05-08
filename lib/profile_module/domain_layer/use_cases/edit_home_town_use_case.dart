import '../../../core/utils/exports.dart';
import '../repository/profile_base_repository.dart';

class EditHomeTownUseCase implements BaseUseCase<void, String> {
  final BaseProfileRepository baseProfileRepository;

  EditHomeTownUseCase(this.baseProfileRepository);

  @override
  Future<void> call(String homeTown) async {
    await baseProfileRepository.editHomeTown(homeTown);
  }
}
