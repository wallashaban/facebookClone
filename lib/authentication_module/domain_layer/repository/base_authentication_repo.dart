import '../../../core/utils/exports.dart';

abstract class BaseAuthenticationRepository {
  Future< Users> createUserWithEmailAndPassword({
    required String fristName,
    required String surName,
    required String email,
    required String password,
    required String birthDate,
    required String gender,
        required String token,
    required bool isEmailVerified,
  });

  Future< void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future< void> resetPassword({
    required String email,
  });

  Future< void> verifyEmail({
    required String email,
  });
  Future<void> signOut();
}
