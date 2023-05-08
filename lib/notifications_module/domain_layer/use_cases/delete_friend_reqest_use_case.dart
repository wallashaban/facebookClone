import '../../../core/utils/exports.dart';
import '../repository/base_notification_repository.dart';

class DeleteFriendRequestUseCase implements BaseUseCase<void, String> {
  final BaseNotificationsRepository baseNotificationsRepository;

  DeleteFriendRequestUseCase(this.baseNotificationsRepository);

  @override
  Future<void> call(String id) async {
    await baseNotificationsRepository.deleteFriendRequest(id);
  }
}
