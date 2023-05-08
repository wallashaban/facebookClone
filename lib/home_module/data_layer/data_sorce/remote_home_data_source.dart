// ignore_for_file: avoid_function_literals_in_foreach_calls
import 'package:facebook_app/core/utils/exports.dart';

import '../models/story_model.dart';

abstract class BaseHomeemoteDataSource {
  Future<List<UserModel>> getAllUsers();
  Future<Users> getUserProfile(String userId);
  Future<void> createStory(CreateStoryParameters parameters);
  Future<List<StoryModel>> getAllStories();
  Future<void> deleteStory(String storyId);
  Future<TaskSnapshot> uploadStoryImage(File image);
  Future<TaskSnapshot> uploadStoryVideo(File video);
}

class HomeRemotrDataSource implements BaseHomeemoteDataSource {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

   @override
  Future<TaskSnapshot> uploadStoryImage(File image) async {
    try {
      return await firebaseStorage
          .ref()
          .child('storyImages/${Uri.file(image.path).pathSegments.last}')
          .putFile(image);
    } catch (error) {
      throw Exception(error);
    }
  }
  @override
  Future<TaskSnapshot> uploadStoryVideo(File video) async {
    try {
      return await firebaseStorage
          .ref()
          .child('storyVideos/${Uri.file(video.path).pathSegments.last}')
          .putFile(video);
    } catch (error) {
      throw Exception(error);
    }
  }


  @override
  Future<Users> getUserProfile(String userId) async {
    try {
      final user = await firebaseFirestore.collection('user').doc(userId).get();
      return UserModel.fromSnapShot(user);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<UserModel>> getAllUsers() async {
    try {
      List<UserModel> users = [];
      await firebaseFirestore.collection('user').get().then((user) {
        user.docs.forEach((userr) {
          users.add(UserModel.fromSnapShot(userr));
        });
      });
      debugPrint('all users $users');
      return users;
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> createStory(CreateStoryParameters parameters) async {
    try {
      final addStory = firebaseFirestore.collection('stories').doc();
      StoryModel story = StoryModel(
        name: parameters.name,
        profilePic: parameters.profilePic,
        uId: parameters.uId,
        token: parameters.token,
        storyPic: parameters.storyPic,
        createdAt: parameters.createdAt,
        storyId: addStory.id,
      );
      await addStory.set(story.toJson());
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> deleteStory(String storyId) async{
   try {
      await firebaseFirestore.collection('stories').doc(storyId).delete();
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<List<StoryModel>> getAllStories() async {
    try {
      List<StoryModel> stories = [];
      await firebaseFirestore.collection('stories').get().then((story) {
        story.docs.forEach((stoory) {
          stories.add(StoryModel.fromJson(stoory));
        });
      });
      debugPrint('all stories $stories');
      return stories;
    } catch (error) {
      throw Exception(error);
    }
  }
}
