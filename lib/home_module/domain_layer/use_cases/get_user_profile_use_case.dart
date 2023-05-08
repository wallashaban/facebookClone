
import '../../../core/utils/exports.dart';

class GetUserProfileUSeCase implements BaseUseCase<Users, String> {
  final BaseHomeRepository baseHomeRepository;
  GetUserProfileUSeCase(
    this.baseHomeRepository,
  );

  @override
  Future<Users> call(String userId) async {
    return await baseHomeRepository.getUserProfile(userId);
  }
}
