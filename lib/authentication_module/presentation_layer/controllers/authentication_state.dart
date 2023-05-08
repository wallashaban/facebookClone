part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}
class GetTokenSuccessState extends AuthenticationState{}
class AuthenticationInitial extends AuthenticationState {}

class CreateUserEithEmailAndPasswordLoadingState extends AuthenticationState {}

class CreateUserEithEmailAndPasswordSuccessState extends AuthenticationState {}

class CreateUserEithEmailAndPasswordErrorState extends AuthenticationState {
  final String error;
 const CreateUserEithEmailAndPasswordErrorState({
    required this.error,
  });
}


class SignInUserEithEmailAndPasswordLoadingState extends AuthenticationState {}

class SignInUserEithEmailAndPasswordSuccessState extends AuthenticationState {}

class SignInUserEithEmailAndPasswordErrorState extends AuthenticationState {
  final String error;
 const SignInUserEithEmailAndPasswordErrorState({
    required this.error,
  });
}

class ResetPasswordLoadingState extends AuthenticationState {}

class ResetPasswordSuccessState extends AuthenticationState {}

class ResetPasswordErrorState extends AuthenticationState {
  final String error;
 const ResetPasswordErrorState({
    required this.error,
  });
}

class VerifyEmailLoadingState extends AuthenticationState {}

class VerifyEmailSuccessState extends AuthenticationState {}

class VerifyEmailErrorState extends AuthenticationState {
  final String error;
 const VerifyEmailErrorState({
    required this.error,
  });
}

class SignOutLoadingState extends AuthenticationState {}

class SignOutSuccessState extends AuthenticationState {}

class SignOutErrorState extends AuthenticationState {
  final String error;
 const SignOutErrorState({
    required this.error,
  });
}
class GenderState extends AuthenticationState{}
class Done extends AuthenticationState{}