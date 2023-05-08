import '../../../core/utils/exports.dart';

import '../repository/profile_base_repository.dart';


class UpdateProfileImageUseCase implements BaseUseCase<void, String> {
  final BaseProfileRepository baseProfileRepository;

  UpdateProfileImageUseCase(this.baseProfileRepository);

  @override
  Future<void> call(String profileImage) async {
    await baseProfileRepository.upDateProfileImage(profileImage);
  }
}
