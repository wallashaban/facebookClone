import '../../../core/utils/exports.dart';
import '../repository/profile_base_repository.dart';

class EditCurrentTownUseCase implements BaseUseCase<void, String> {
  final BaseProfileRepository baseProfileRepository;

  EditCurrentTownUseCase(this.baseProfileRepository);

  @override
  Future<void> call(String currentTown) async {
    await baseProfileRepository.editCurrentTwon(currentTown);
  }
}
