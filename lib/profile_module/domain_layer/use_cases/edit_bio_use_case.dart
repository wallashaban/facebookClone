import '../../../core/utils/exports.dart';

import '../repository/profile_base_repository.dart';

class EditBioUseCase implements BaseUseCase<void, String> {
  final BaseProfileRepository baseProfileRepository;

  EditBioUseCase(this.baseProfileRepository);

  @override
  Future<void> call(String  bio) async {
    await baseProfileRepository.editBio(bio);
  }
}
