// ignore_for_file: avoid_renaming_method_parameters


import 'package:facebook_app/core/utils/exports.dart';

class ResetPasswordUseCase extends BaseUseCase<void, String> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  ResetPasswordUseCase(this.baseAuthenticationRepository);

  @override
  Future< void> call(String email) async {
     await baseAuthenticationRepository.resetPassword(
      email: email,
    );
  }
}
