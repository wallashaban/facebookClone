// ignore_for_file: avoid_function_literals_in_foreach_calls, prefer_typing_uninitialized_variables

import 'package:facebook_app/core/utils/exports.dart';
import 'package:facebook_app/home_module/domain_layer/use_cases/create_story_use_case.dart';
import 'package:facebook_app/home_module/domain_layer/use_cases/delete_story_use_case.dart';
import 'package:facebook_app/home_module/domain_layer/use_cases/get_all_stories_use_case.dart';
import 'package:facebook_app/home_module/domain_layer/use_cases/upload_story_image_use_case.dart';
import 'package:facebook_app/home_module/domain_layer/use_cases/upload_story_video_use_case.dart';
import 'package:facebook_app/notifications_module/presentation_layer/screens/friends_screen.dart';

import '../../../notifications_module/presentation_layer/screens/notification_screen.dart';
import '../../../profile_module/presentation_layer/screens/profile_screen.dart';
import '../../domain_layer/entities/story.dart';
import '../../domain_layer/use_cases/get_all_userss_use_case.dart';
import '../../domain_layer/use_cases/get_user_profile_use_case.dart';
import '../screens/settings_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetUserProfileUSeCase getUserProfileUseCase;

  final GetAllUsersUseCase getAllUsersUseCase;

  final GetAllStoriesUseCase getAllStoriesUseCase;

  final CreateStoryUseCase createStoryUseCase;

  final DeleteStoryUseCase deleteStoryUseCase;

  final UploadStoryImageUseCase uploadStoryImageUseCase;
  final UploadStoryVideoUseCase uploadStoryVideoUseCase;

  HomeCubit(
    this.getUserProfileUseCase,
    this.getAllUsersUseCase,
    this.getAllStoriesUseCase,
    this.createStoryUseCase,
    this.deleteStoryUseCase,
    this.uploadStoryImageUseCase,
    this.uploadStoryVideoUseCase,
  ) : super(HomeInitial());

  List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const NotificationScreen(),
    //FriendScreen(),
    const SettingsScreen()
  ];
  int? tabBarndex;
  changeTabbar(int tabBarndex) {
    this.tabBarndex = tabBarndex;
    emit(ChangeNavbarState());
    emit(Donee());
  }
  int index = 0;
  changeNavbar(int index) {
    this.index = index;
    emit(ChangeNavbarState());
    emit(Donee());
  }

  Users user = const UserModel(
    uId: 'uId',
    firstName: 'firstName',
    surName: 'surName',
    email: 'email',
    birthDate: 'birthDate',
    gender: 'gender',
    isEmailVerified: false,
    token: '',
  );

  Users userProfile = const UserModel(
    uId: 'uId',
    firstName: 'firstName',
    surName: 'surName',
    email: 'email',
    birthDate: 'birthDate',
    gender: 'gender',
    isEmailVerified: false,
    token: '',
  );

  List<Story> stories = [];

  Future getUserProfile(String userId) async {
    emit(GetUserProfileLoadingState());
    getUserProfileUseCase(userId).then((userProfile) {
      this.userProfile = userProfile;
      debugPrint('userProfile${this.userProfile}');
      emit(GetUserProfileSuccessState());
    }).catchError((error) {
      debugPrint('error${error.toString()}');
      emit(GetUserProfileErrorState(error: error.toString()));
    });
  }

  List<Users> users = [];
  Future getAllUsers() async {
    emit(GetAllUsersLoadingState());
    getAllUsersUseCase(const NoParameters()).then((users) {
      this.users = users;
      emit(GetAllUsersSuccessState());
    }).catchError((error) {
      debugPrint('error ${error.toString()}');
      emit(GetAllUsersErrorState(error: error.toString()));
    });
  }

  //story
  File? image;
  final picker = ImagePicker();
  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    emit(PickImageState());
    emit(ProcessDone());
  }

  File? pickVideo;
  Future pickVideoFile() async {
    final picker = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (picker != null) {
      pickVideo = File(picker.path);
    }
    emit(PickVideoState());
    emit(ProcessDone());
  }

  Future createStory(CreateStoryParameters parameters) async {
    emit(CreateStoryLoadingState());
    createStoryUseCase(parameters).then((_) {
      emit(CreateStorySuccessState());
      getAllStories();
      image = null;
      pickVideo = null;
    }).catchError((error) {
      debugPrint('error ${error.toString()}');
      emit(CreateStoryErrorState(error: error.toString()));
    });
  }

  Future deleteStory(String storyId) async {
    emit(DeleteStoryLoadingState());
    deleteStoryUseCase(storyId).then((_) {
      emit(DeleteStorySuccessState());
      getAllStories();
    }).catchError((error) {
      debugPrint('error ${error.toString()}');
      emit(DeleteStoryErrorState(error: error.toString()));
    });
  }

  Future getAllStories() async {
    emit(GetAllStoriesLoadingState());
    getAllStoriesUseCase(const NoParameters()).then((stories) {
      this.stories = stories;
      emit(GetAllStoriesSuccessState());
    }).catchError((error) {
      debugPrint('error ${error.toString()}');
      emit(GetAllStoriesErrorState(error: error.toString()));
    });
  }

  String? storyImage;
  Future uploadStoryImage() async {
    emit(UploadStoryImageLoadingState());
    await uploadStoryImageUseCase(image!).then((value) async {
      storyImage = await value.ref.getDownloadURL();
      emit(UploadStoryImageSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(
        UploadStoryImageErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  String? storyVideo;
  Future uploadStoryVideo() async {
    emit(UploadStoryVideoLoadingState());
    await uploadStoryVideoUseCase(pickVideo!).then((value) async {
      storyVideo = await value.ref.getDownloadURL();
      emit(UploadStoryVideoSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(
        UploadStoryVideoErrorState(
          error: error.toString(),
        ),
      );
    });
  }
}
