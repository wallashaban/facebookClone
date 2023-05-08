import '../../../core/utils/exports.dart';

class CreateUserWithEmailAndPasswordUseCase
    implements BaseUseCase<Users, CreateUserWithEmailAndPasswordParameters> {
  final BaseAuthenticationRepository baseAuthenticationRepository;

  CreateUserWithEmailAndPasswordUseCase(this.baseAuthenticationRepository);

  @override
  Future<Users> call(
      CreateUserWithEmailAndPasswordParameters parameters) async {
    return await baseAuthenticationRepository.createUserWithEmailAndPassword(
      fristName: parameters.fristName,
      surName: parameters.surName,
      email: parameters.email,
      password: parameters.password,
      birthDate: parameters.birthDate,
      gender: parameters.gender,
      token: parameters.token,
      isEmailVerified: parameters.isEmailVerified,
    );
  }
}

class CreateUserWithEmailAndPasswordParameters extends Equatable {
  final String fristName;
  final String surName;
  final String email;
  final String password;
  final String birthDate;
  final String gender;
  final String token;

  final bool isEmailVerified;
  const CreateUserWithEmailAndPasswordParameters({
    required this.fristName,
    required this.surName,
    required this.email,
    required this.password,
    required this.birthDate,
    required this.gender,
    required this.isEmailVerified,
    required this.token
  });

  @override
  List<Object?> get props => [
        fristName,
        surName,
        email,
        password,
        birthDate,
        gender,
        isEmailVerified,
        token,
      ];
}
