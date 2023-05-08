import '../../../core/utils/exports.dart';
import '../entities/friend_info.dart';
import '../repository/base_notification_repository.dart';

class GetFriendsUseCase implements BaseUseCase<List<FriendInfo>, NoParameters> {
  final BaseNotificationsRepository baseNotificationsRepository;

  GetFriendsUseCase(this.baseNotificationsRepository);

  @override
  Future<List<FriendInfo>> call(NoParameters parameters) async {
   return await baseNotificationsRepository.getFriends();
  }
}
