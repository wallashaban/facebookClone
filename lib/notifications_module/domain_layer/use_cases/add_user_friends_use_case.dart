import '../../../core/utils/exports.dart';
import '../repository/base_notification_repository.dart';

class AddUserFriendUseCase implements BaseUseCase<void, FriendInfoParamerters> {
  final BaseNotificationsRepository baseNotificationsRepository;
  AddUserFriendUseCase(this.baseNotificationsRepository);

  @override
  Future<void> call(FriendInfoParamerters parameters) async {
    await baseNotificationsRepository.addUserFriends(parameters);
  }
}
