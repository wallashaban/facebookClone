import '../../../core/utils/exports.dart';
import '../../domain_layer/entities/story.dart';

class StoryModel extends Story {
  const StoryModel({
    required super.name,
    required super.profilePic,
    required super.uId,
    required super.token,
    required super.storyPic,
    required super.createdAt,
    required super.storyId,
  });

  factory StoryModel.fromJson(QueryDocumentSnapshot< Map<String, dynamic>> snapshot) {
    return StoryModel(
      name: snapshot['name'],
      profilePic: snapshot['profilePic'],
      uId: snapshot['uId'],
      token: snapshot['token'],
      storyPic: snapshot['storyPic'],
      createdAt: snapshot['createdAt'],
      storyId: snapshot['storyId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'profilePic': profilePic,
      'uId': uId,
      'token': token,
      'storyId': storyId,
      'storyPic': storyPic,
      'createdAt': createdAt,
    };
  }
}
