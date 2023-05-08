
import '../../../core/utils/exports.dart';
import '../../domain_layer/use_cases/edit_bio_use_case.dart';
import '../../domain_layer/use_cases/edit_current_home_use_case.dart';
import '../../domain_layer/use_cases/edit_home_town_use_case.dart';
import '../../domain_layer/use_cases/edit_relation_use_case.dart';
import '../../domain_layer/use_cases/edit_school_use_case.dart';
import '../../domain_layer/use_cases/edit_university_use_case.dart';
import '../../domain_layer/use_cases/edit_workplace_use_case.dart';
import '../../domain_layer/use_cases/get_user_data_use_case.dart';
import '../../domain_layer/use_cases/update_cover_image_use_case.dart';
import '../../domain_layer/use_cases/update_profile_image_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final GetUserDataUSeCase getUserDataUSeCase;
  final UpdateCoverImageUseCase updateCoverImageUseCase;
  final UpdateProfileImageUseCase updateProfileImageUseCase;
  final EditBioUseCase editBioUseCase;
  final EditBUniversityUseCase editBUniversityUseCase;
  final EditSchoolUseCase editSchoolUseCase;
  final EditCurrentTownUseCase editCurrentTownUseCase;
  final EditHomeTownUseCase editHomeTownUseCase;
  final EditRelationshipUseCase editRelationshipUseCase;
  final EditWorkplaceUseCase editWorkplaceUseCase;
  ProfileCubit(
    this.getUserDataUSeCase,
    this.updateCoverImageUseCase,
    this.updateProfileImageUseCase,
    this.editBioUseCase,
    this.editBUniversityUseCase,
    this.editSchoolUseCase,
    this.editCurrentTownUseCase,
    this.editHomeTownUseCase,
    this.editRelationshipUseCase,
    this.editWorkplaceUseCase,
  ) : super(ProfileInitial());

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
  File? profileImage;
  File? coverImage;

  getUserData() {
    emit(GetUserDataLoadingState());
    getUserDataUSeCase(const NoParameters()).then((user) {
      this.user = user;
      debugPrint('user${this.user}');
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      debugPrint('error ${error.toString()}');
      emit(GetUserDataErrorState(error: error.toString()));
    });
  }

  final picker = ImagePicker();
  Future pickImage({
    bool isCover = false,
    isProfile = false,
  }) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      isCover
          ? coverImage = File(pickedFile.path)
          : profileImage = File(pickedFile.path);
    }
    emit(PickProfileImageSuccessState());
    emit(Donee());
  }

  updateCoverImage() async {
    await pickImage(isCover: true).then((value) {
      if (coverImage != null) {
        FirebaseStorage.instance
            .ref()
            .child(
                'profileUser/${Uri.file(coverImage!.path).pathSegments.last}')
            .putFile(coverImage!)
            .then((value) async {
          updateCoverImageUseCase(
            await value.ref.getDownloadURL(),
          ).then((value) {
            emit(UpdateCoverImageSuccessState());
            getUserData();
          });
        }).catchError((error) {
          debugPrint(error.toString());
          emit(
            UpdateCoverImageErrorState(error: error.toString()),
          );
        });
      }
    });
  }

  updateProfileImage() async {
    await pickImage(isProfile: true).then((value) {
      if (profileImage != null) {
        FirebaseStorage.instance
            .ref()
            .child(
                'profileUser/${Uri.file(profileImage!.path).pathSegments.last}')
            .putFile(profileImage!)
            .then((value) async {
          updateProfileImageUseCase(
            await value.ref.getDownloadURL(),
          ).then((value) {
            getUserData();
            emit(UpdateProfileImageSuccessState());
          });
        }).catchError((error) {
          debugPrint(error.toString());
          emit(
            UpdateProfileImageErrorState(error: error.toString()),
          );
        });
      }
    });
  }

  Future editBio(String bio) async {
    emit(EditBioLoadingState());
    await editBioUseCase(bio).then((value) {
      emit(EditBioSuccessState());
      getUserData();
    }).catchError((error) {
      debugPrint('error$error');
      emit(
        EditBioErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  Future editUniversity(String university) async {
    emit(EditUniversityLoadingState());
    await editBUniversityUseCase(university).then((value) {
      emit(EditUniversitySuccessState());
      getUserData();
    }).catchError((error) {
      debugPrint('error$error');
      emit(
        EditUniversityErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  Future editSchool(String school) async {
    emit(EditSchoolLoadingState());
    await editSchoolUseCase(school).then((value) {
      emit(EditSchoolSuccessState());
      getUserData();
    }).catchError((error) {
      debugPrint('error$error');
      emit(
        EditSchoolErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  Future editCurrnteCity(String currentCity) async {
    emit(EditCurrentTownLoadingState());
    await editCurrentTownUseCase(currentCity).then((value) {
      emit(EditCurrentTownSuccessState());
      getUserData();
    }).catchError((error) {
      debugPrint('error$error');
      emit(
        EditCurrentTownErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  Future editHomeTown(String homeTown) async {
    emit(EditHomeTownLoadingState());
    await editHomeTownUseCase(homeTown).then((value) {
      emit(EditHomeTownSuccessState());
      getUserData();
    }).catchError((error) {
      debugPrint('error$error');
      emit(
        EditHomeTownErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  Future editRelationship(String relationship) async {
    emit(EditRelationshipLoadingState());
    await editRelationshipUseCase(relationship).then((value) {
      emit(EditRelationshipSuccessState());
      getUserData();
    }).catchError((error) {
      debugPrint('error$error');
      emit(
        EditRelationshipErrorState(
          error: error.toString(),
        ),
      );
    });
  }

  Future editWorkplace(String workplace) async {
    emit(EditWorkplaceLoadingState());
    await editWorkplaceUseCase(workplace).then((value) {
      getUserData();
      emit(EditWorkplaceSuccessState());
    }).catchError((error) {
      debugPrint('error$error');
      emit(
        EditWorkplaceErrorState(
          error: error.toString(),
        ),
      );
    });
  }
}
