part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class Donee extends ProfileState {}

class EditBioSuccessState extends ProfileState {}

class EditBioLoadingState extends ProfileState {}

class EditBioErrorState extends ProfileState {
  final String error;
  const EditBioErrorState({
    required this.error,
  });
}

class EditUniversitySuccessState extends ProfileState {}

class EditUniversityLoadingState extends ProfileState {}

class EditUniversityErrorState extends ProfileState {
  final String error;
  const EditUniversityErrorState({
    required this.error,
  });
}

class EditSchoolSuccessState extends ProfileState {}

class EditSchoolLoadingState extends ProfileState {}

class EditSchoolErrorState extends ProfileState {
  final String error;
  const EditSchoolErrorState({
    required this.error,
  });
}

class EditCurrentTownSuccessState extends ProfileState {}

class EditCurrentTownLoadingState extends ProfileState {}

class EditCurrentTownErrorState extends ProfileState {
  final String error;
  const EditCurrentTownErrorState({
    required this.error,
  });
}

class EditHomeTownSuccessState extends ProfileState {}

class EditHomeTownLoadingState extends ProfileState {}

class EditHomeTownErrorState extends ProfileState {
  final String error;
  const EditHomeTownErrorState({
    required this.error,
  });
}

class EditWorkplaceSuccessState extends ProfileState {}

class EditWorkplaceLoadingState extends ProfileState {}

class EditWorkplaceErrorState extends ProfileState {
  final String error;
  const EditWorkplaceErrorState({
    required this.error,
  });
}

class EditRelationshipSuccessState extends ProfileState {}

class EditRelationshipLoadingState extends ProfileState {}

class EditRelationshipErrorState extends ProfileState {
  final String error;
  const EditRelationshipErrorState({
    required this.error,
  });
}
class PickProfileImageSuccessState extends ProfileState {}

class PickCoverImageSuccessState extends ProfileState {}

class UpdateCoverImageSuccessState extends ProfileState {}

class UpdateCoverImageErrorState extends ProfileState {
  final String error;
  const UpdateCoverImageErrorState({
    required this.error,
  });
}

class UpdateProfileImageSuccessState extends ProfileState {}

class UpdateProfileImageErrorState extends ProfileState {
  final String error;
  const UpdateProfileImageErrorState({
    required this.error,
  });
}

class GetUserDataSuccessState extends ProfileState {}

class GetUserDataLoadingState extends ProfileState {}

class GetUserDataErrorState extends ProfileState {
  final String error;
  const GetUserDataErrorState({
    required this.error,
  });
}
