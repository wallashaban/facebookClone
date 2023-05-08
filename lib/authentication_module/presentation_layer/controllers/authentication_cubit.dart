import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../core/utils/exports.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final CreateUserWithEmailAndPasswordUseCase
      createUserWithEmailAndPasswordUseCase;
  final SignInWithEmailAndPasswordUseCase signInWithEmailAndPasswordUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final VerifyEmailUseCase verifyEmailUseCase;
  final SignOutUseCase signOutUseCase;
  AuthenticationCubit(
      this.createUserWithEmailAndPasswordUseCase,
      this.signInWithEmailAndPasswordUseCase,
      this.resetPasswordUseCase,
      this.verifyEmailUseCase,
      this.signOutUseCase)
      : super(AuthenticationInitial());

  Users user = const UserModel(
    uId: 'uId',
    firstName: 'firstName',
    surName: 'surName',
    email: 'email',
   // password: 'password',
    birthDate: 'birthDate',
    gender: 'gender',
    isEmailVerified: false,
    token: '',
  );
  Failure serverFailure = const ServerFailure(
    message: 'message',
  );
  String gender = 'Male';
  chooseGender(String gender) {
    this.gender = gender;
    emit(GenderState());
    emit(Done());
  }

  bool isVerified = false;
  isEmailVerified() async {
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    emit(Done());
    emit(SignInUserEithEmailAndPasswordSuccessState());
    debugPrint(isVerified.toString());
  }

   void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      AppConstants.token = token;
      emit(GetTokenSuccessState());
      debugPrint('token ${AppConstants.token}');
    });
  }

  Future createUserwithEmailAndPassword({
    required String fristName,
    required String surName,
    required String email,
    required String password,
    required String birthDate,
    required String gender,
        required String token,

    required bool isEmailVerified,
  }) async {
    emit(CreateUserEithEmailAndPasswordLoadingState());
    await createUserWithEmailAndPasswordUseCase(
        CreateUserWithEmailAndPasswordParameters(
      birthDate: birthDate,
      email: email,
      password: password,
      gender: gender,
      fristName: fristName,
      surName: surName,
      token: token,
      isEmailVerified: isEmailVerified,
    )).then(
      (value) {
        user = value;
        debugPrint('sign up  ${user.firstName}');
        emit(CreateUserEithEmailAndPasswordSuccessState());
        verifyEmail(
          email: email,
        );
      },
    ).catchError((error) {
      debugPrint('error ${error.toString()}');
      emit(CreateUserEithEmailAndPasswordErrorState(error: error.toString()));
    });
  }

  Future signInUserwithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInUserEithEmailAndPasswordLoadingState());
    await signInWithEmailAndPasswordUseCase(SignInParameters(
      email: email,
      password: password,
    )).then((value) {
      debugPrint('sign in  ${user.uId}');
      emit(SignInUserEithEmailAndPasswordSuccessState());
    }).catchError((error) {
      debugPrint('error $error');
      emit(SignInUserEithEmailAndPasswordErrorState(error: error.toString()));
    });
  }

  Future resetPassword({
    required String email,
  }) async {
    emit(ResetPasswordLoadingState());
    await resetPasswordUseCase(
      email,
    ).then((value) {
     // debugPrint('reset password in  ${user.password}');
      emit(ResetPasswordSuccessState());
    }).catchError((error) {
      debugPrint('erreo $error');
      emit(ResetPasswordErrorState(
        error: error,
      ));
    });
  }

  verifyEmail({
    required String email,
  }) async {
    emit(VerifyEmailLoadingState());
    await verifyEmailUseCase(
      email,
    ).then((value) {
      debugPrint('verify in  ${user.isEmailVerified}');
      emit(VerifyEmailSuccessState());
    }).catchError((error) {
      debugPrint('error$error');
      emit(VerifyEmailErrorState(error: error.toString()));
    });
  }

 Future signOut() async {
    emit(SignOutLoadingState());
    await signOutUseCase(const NoParameters()).then((value) {
      emit(SignOutSuccessState());
    }).catchError((error) {
      debugPrint('error${error.toString()}');
      emit(SignOutErrorState(error: error.toString()));
    });
  }
}
