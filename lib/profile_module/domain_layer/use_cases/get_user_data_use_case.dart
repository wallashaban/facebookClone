
import '../../../core/utils/exports.dart';

import '../repository/profile_base_repository.dart';

class GetUserDataUSeCase implements BaseUseCase<Users, NoParameters> {
  final BaseProfileRepository baseProfileRepository;
  GetUserDataUSeCase(
    this.baseProfileRepository,
  );

  @override
  Future<Users> call(NoParameters noParameters) async {
    return await baseProfileRepository.getUserData();
  }
}
