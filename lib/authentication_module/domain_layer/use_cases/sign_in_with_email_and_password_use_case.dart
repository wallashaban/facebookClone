
import '../../../core/utils/exports.dart';

class SignInWithEmailAndPasswordUseCase
    extends BaseUseCase<void, SignInParameters> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  SignInWithEmailAndPasswordUseCase(this.baseAuthenticationRepository);

  @override
  Future< void> call(
      SignInParameters parameters) async {
    return await baseAuthenticationRepository.signInWithEmailAndPassword(
      email: parameters.email,
      password: parameters.password,
    );
  }
}

class SignInParameters extends Equatable {
  final String email;
  final String password;
  const SignInParameters({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
