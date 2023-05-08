import '../../../core/utils/exports.dart';

class Story extends Equatable {
  final String name;
  final String profilePic;
  final String uId;
  final String? token;
  final String? storyPic;
  final String storyId;
  final String createdAt;
  const Story({
    required this.name,
    required this.profilePic,
    required this.uId,
    required this.token,
    required this.storyPic,
    required this.createdAt,
    required this.storyId,
  });

  @override
  List<Object?> get props => [
        name,
        profilePic,
        uId,
        token,
        storyPic,
        createdAt,
        storyId,
      ];
}
