// ignore_for_file: avoid_renaming_method_parameters

import 'package:facebook_app/core/utils/exports.dart';


class VerifyEmailUseCase extends BaseUseCase<void, String> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  VerifyEmailUseCase(this.baseAuthenticationRepository);

  @override
  Future< void> call(String email) async {
    return await baseAuthenticationRepository.verifyEmail(
      email: email,
    );
  }
}
