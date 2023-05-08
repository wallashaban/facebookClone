import '../../../core/utils/exports.dart';

class FriendInfo extends Equatable {
  final String name;
  final String profilePic;
  final String uId;
  final String id;
  const FriendInfo({
    required this.name,
    required this.profilePic,
    required this.uId,
    required this.id,
  });

  @override
  List<Object?> get props => [
        name,
        profilePic,
        uId,
        id,
      ];
}
