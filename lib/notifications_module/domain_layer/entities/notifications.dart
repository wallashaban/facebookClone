import '../../../core/utils/exports.dart';

class Notifications extends Equatable {
  final String name;
  final String profilePic;
  final String uId;
  final String title;
  final String body;
  final String createdAt;
  const Notifications({
    required this.name,
    required this.profilePic,
    required this.uId,
    required this.body,
    required this.title,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        name,
        profilePic,
        uId,
        createdAt,
        body,
        title,
      ];
}
