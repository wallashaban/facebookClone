import '../data_source/profile_remote_data_source.dart';
import '../../domain_layer/repository/profile_base_repository.dart';

import '../../../authentication_module/domain_layer/entities/user.dart';
import '../../../core/error/exceptions.dart';

class ProfileRepository implements BaseProfileRepository {
  final BaseProfileRemoteDataSource baseProfileRemoteDataSource;

  ProfileRepository(this.baseProfileRemoteDataSource);

  @override
  Future<Users> getUserData() async {
    try {
      return await baseProfileRemoteDataSource.getUserData();
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> upDateCoverImage(String coverImage) async {
    try {
      await baseProfileRemoteDataSource.updateCoverImage(coverImage);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> upDateProfileImage(String profileImage) async {
    try {
      await baseProfileRemoteDataSource.updateProfileImage(profileImage);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

   @override
  Future<void> editBio(String bio) async {
    try {
      await baseProfileRemoteDataSource.editBio(bio);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> editCurrentTwon(String currentTown) async {
    try {
      await baseProfileRemoteDataSource.editCurrentTwon(currentTown);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> editHomeTown(String homeTown) async {
    try {
      await baseProfileRemoteDataSource.editHomeTown(homeTown);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> editRelation(String relationship) async {
    try {
      await baseProfileRemoteDataSource.editRelation(relationship);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> editSchool(String school) async {
    try {
      await baseProfileRemoteDataSource.editSchool(school);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> editUniversity(String university) async {
    try {
      await baseProfileRemoteDataSource.editUniversity(university);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> editWorkPlace(String workplace) async {
    try {
      await baseProfileRemoteDataSource.editWorkPlace(workplace);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

}
