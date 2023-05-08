
import '../../../core/utils/exports.dart';


abstract class BaseRemoteAuthenticationDataSource {
  Future<Users> createUserWithEmailAndPassword({
    required String fristName,
    required String surName,
    required String email,
    required String password,
    required String birthDate,
    required String gender,
        required String token,
    required bool isEmailVerified,
  });

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> resetPassword({
    required String email,
  });

  Future<void> signOut();
  Future<void> verifyEmail({
    required String email,
  });
}

class RemoteAuthenticationDataSource
    implements BaseRemoteAuthenticationDataSource {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<Users> createUserWithEmailAndPassword({
    required String fristName,
    required String surName,
    required String email,
    required String password,
    required String birthDate,
    required String gender,
    required String token,
    required bool isEmailVerified,
  }) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userCredential.user!.uid;
      final docUser =
          firebaseFirestore.collection('user').doc(userCredential.user!.uid);
      final user = UserModel(
        uId: userCredential.user!.uid,
        firstName: fristName,
        surName: surName,
        email: email,
        token: token,
        birthDate: birthDate,
        gender: gender,
        isEmailVerified: false,
      );

      final json = user.toDocument();
      await docUser.set(json);
      final getUser =
          await firebaseFirestore.collection('user').doc(docUser.id).get();
      return UserModel.fromSnapShot(getUser);
    } catch (error) {
      throw (Exception(error));
      // return left(ServerFailure(message: error.toString()));
    }
  }

  @override
  Future<void> resetPassword({required String email}) async {
   
    try {
     await firebaseAuth.sendPasswordResetEmail(
      email: email,
    );
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      debugPrint('cred ${userCredential.user!.uid}');
   /*    final user = await firebaseFirestore
          .collection('user')
          .doc(userCredential.user!.uid)
          .get();
      return UserModel.fromSnapShot(user); */
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<void> verifyEmail({required String email}) async {
    try {
      await firebaseAuth.currentUser!.sendEmailVerification();

      await firebaseFirestore
          .collection('user')
          .doc(firebaseAuth.currentUser!.uid)
          .update({
            'isEmailVerified':true,
          });
    } catch (error) {
      throw Exception(error);
    }
  }
}
