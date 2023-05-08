import '../../../authentication_module/domain_layer/entities/user.dart';

abstract class BaseProfileRepository{
    Future<Users> getUserData();
  Future<void> upDateProfileImage(String profileImage);
  Future<void> upDateCoverImage(String coverImage);
  Future<void> editBio(String bio);
  Future<void> editUniversity(String university);
  Future<void> editSchool(String school);
  Future<void> editCurrentTwon(String currentTown);
  Future<void> editHomeTown(String homeTown);
  Future<void> editRelation(String relationship);
  Future<void> editWorkPlace(String workplace);
}