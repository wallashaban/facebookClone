import '../../../core/utils/exports.dart';
import '../repository/base_notification_repository.dart';

class FriendRequestUseCase implements BaseUseCase<void, FriendInfoParamerters> {
  final BaseNotificationsRepository baseNotificationsRepository;

  FriendRequestUseCase(this.baseNotificationsRepository);

  @override
  Future<void> call(FriendInfoParamerters parameters) async {
    await baseNotificationsRepository.friendRequest(parameters);
  }
}
