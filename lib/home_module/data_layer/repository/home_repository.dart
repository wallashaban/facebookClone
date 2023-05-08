import '../../../core/utils/exports.dart';
import '../../domain_layer/entities/story.dart';

class HomeRepository implements BaseHomeRepository {
  final BaseHomeemoteDataSource baseHomeemoteDataSource;

  HomeRepository(this.baseHomeemoteDataSource);
  


  @override
  Future<Users> getUserProfile(String userId) async {
    try {
      return await baseHomeemoteDataSource.getUserProfile(userId);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }
  @override
  Future<List<Users>> getAllUsers()async {
    try {
      return await baseHomeemoteDataSource.getAllUsers();
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> sharePost() {
    throw UnimplementedError();
  }

  @override
  Future<void> createStory(CreateStoryParameters parameters)async {
    try {
      return await baseHomeemoteDataSource.createStory(parameters);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> deleteStory(String storyId)async {
   try {
      return await baseHomeemoteDataSource.deleteStory(storyId);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<Story>> getAllStories()async {
    try {
      return await baseHomeemoteDataSource.getAllStories();
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }
  
  @override
  Future<TaskSnapshot> uploadStoryImage(File image)async {
 try {
      return await baseHomeemoteDataSource.uploadStoryImage(image);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }
  
  @override
  Future<TaskSnapshot> uploadStoryVideo(File video)async {
     try {
      return await baseHomeemoteDataSource.uploadStoryVideo(video);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }



 
}
