import '../../../core/utils/exports.dart';

import '../repository/base_notification_repository.dart';

class PushNotificationToallUsersUseCae
    implements BaseUseCase<void, PushNotificationParameters> {
  final BaseNotificationsRepository baseNotificationsRepository;

  PushNotificationToallUsersUseCae(this.baseNotificationsRepository);

  @override
  Future<void> call(PushNotificationParameters parameters) async {
    await baseNotificationsRepository.sendPushNotificationToAllUsers(parameters);
  }
}
