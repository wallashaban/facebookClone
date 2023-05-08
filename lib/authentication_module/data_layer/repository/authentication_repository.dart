
import '../../../core/utils/exports.dart';

class AuthenticationRepository implements BaseAuthenticationRepository {
  final BaseRemoteAuthenticationDataSource baseRemoteAuthenticationDataSource;

  AuthenticationRepository(this.baseRemoteAuthenticationDataSource);

  @override
  Future<Users> createUserWithEmailAndPassword(
      {required String fristName,
      required String surName,
      required String email,
      required String password,
      required String birthDate,
      required String gender,
          required String token,

      required bool isEmailVerified}) async {
    try {
      final user = await baseRemoteAuthenticationDataSource
          .createUserWithEmailAndPassword(
        fristName: fristName,
        surName: surName,
        email: email,
        password: password,
        birthDate: birthDate,
        gender: gender,
        token: token,
        isEmailVerified: isEmailVerified,
      );
      return user;
      //return right(user as Users);
    } on ServerException catch (failure) {
      throw Exception(failure);
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
    try {
       await baseRemoteAuthenticationDataSource.resetPassword(
        email: email,
      );
     // return user;
    } on ServerException catch (failure) {
      throw Exception(failure);
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
          await baseRemoteAuthenticationDataSource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      //return user;
    } on ServerException catch (failure) {
      throw Exception(failure);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await baseRemoteAuthenticationDataSource.signOut();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> verifyEmail({required String email}) async {
    try {
      await baseRemoteAuthenticationDataSource.verifyEmail(
        email: email,
      );
     // return user;
    } on ServerException catch (failure) {
      throw Exception(failure);
    }
  }
}
