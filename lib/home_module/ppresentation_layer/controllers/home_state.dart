part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class ChangeNavbarState extends HomeState {}

class Donee extends HomeState{}

class GetUserProfileSuccessState extends HomeState {}

class GetUserProfileLoadingState extends HomeState {}

class GetUserProfileErrorState extends HomeState {
  final String error;
  const GetUserProfileErrorState({
    required this.error,
  });
}

class GetAllUsersSuccessState extends HomeState {}

class GetAllUsersLoadingState extends HomeState {}

class GetAllUsersErrorState extends HomeState {
  final String error;
  const GetAllUsersErrorState({
    required this.error,
  });
}

class GetAllStoriesSuccessState extends HomeState {}

class GetAllStoriesLoadingState extends HomeState {}

class GetAllStoriesErrorState extends HomeState {
  final String error;
  const GetAllStoriesErrorState({
    required this.error,
  });
}

class DeleteStorySuccessState extends HomeState {}

class DeleteStoryLoadingState extends HomeState {}

class DeleteStoryErrorState extends HomeState {
  final String error;
  const DeleteStoryErrorState({
    required this.error,
  });
}

class CreateStorySuccessState extends HomeState {}

class CreateStoryLoadingState extends HomeState {}

class CreateStoryErrorState extends HomeState {
  final String error;
  const CreateStoryErrorState({
    required this.error,
  });
}

class UploadStoryImageLoadingState extends HomeState {}

class UploadStoryImageSuccessState extends HomeState {}

class UploadStoryImageErrorState extends HomeState {
  final String error;
  const UploadStoryImageErrorState({
    required this.error,
  });
}

class PickImageState extends HomeState{}

class PickVideoState extends HomeState{}
class ProcessDone extends HomeState{}
class UploadStoryVideoLoadingState extends HomeState {}

class UploadStoryVideoSuccessState extends HomeState {}

class UploadStoryVideoErrorState extends HomeState {
  final String error;
  const UploadStoryVideoErrorState({
    required this.error,
  });
}


