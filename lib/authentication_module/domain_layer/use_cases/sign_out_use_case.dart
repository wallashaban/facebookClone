
import '../../../core/utils/exports.dart';

class SignOutUseCase extends BaseUseCase<void, NoParameters> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  SignOutUseCase(this.baseAuthenticationRepository);

  @override
  Future<void> call(NoParameters parameters) async {
    return await baseAuthenticationRepository.signOut();
  }
}
