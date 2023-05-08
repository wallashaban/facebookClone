import '../../../core/utils/exports.dart';
import '../entities/story.dart';

abstract class BaseHomeRepository {
  Future<Users> getUserProfile(String userId);
  Future<void> sharePost();
  Future<List<Users>> getAllUsers();
  //story
  Future<void> createStory(CreateStoryParameters parameters);
  Future<List<Story>> getAllStories();
  Future<void> deleteStory(String storyId);
  Future<TaskSnapshot> uploadStoryImage(File image);
  Future<TaskSnapshot> uploadStoryVideo(File video);
}

class CreateStoryParameters {
  final String name;
  final String profilePic;
  final String uId;
  final String? token;
  final String? storyPic;
  final String? storyId;
  final String createdAt;
  const CreateStoryParameters({
    required this.name,
    required this.profilePic,
    required this.uId,
    this.token,
    required this.storyPic,
    required this.createdAt,
    this.storyId,
  });
}

class SharePostParameters {
  String userName;
  String uId;
  String profilePicture;
  String createdAt;
  String? title;
  String postId;
  SharePostParameters({
    required this.userName,
    required this.uId,
    required this.profilePicture,
    required this.createdAt,
    this.title,
    required this.postId,
  });
}
