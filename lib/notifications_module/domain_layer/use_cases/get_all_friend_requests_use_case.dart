import '../../../core/utils/exports.dart';
import '../../../notifications_module/domain_layer/entities/friend_info.dart';
import '../repository/base_notification_repository.dart';

class GetFriendRequestsUseCase extends BaseUseCase<List<FriendInfo>, NoParameters> {
  final BaseNotificationsRepository baseNotificationsRepository;

  GetFriendRequestsUseCase(this.baseNotificationsRepository);

  @override
  Future<List<FriendInfo>> call(NoParameters parameters) async {
    return await baseNotificationsRepository.getFriendRequests();
  }
}
