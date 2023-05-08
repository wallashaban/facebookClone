import '../../../core/utils/exports.dart';
import '../repository/base_notification_repository.dart';

class PushNotificationToAspecificUserUseCae
    implements BaseUseCase<void, PushNotificationParameters> {
  final BaseNotificationsRepository baseNotificationsRepository;

  PushNotificationToAspecificUserUseCae(this.baseNotificationsRepository);

  @override
  Future<void> call(PushNotificationParameters parameters) async {
    await baseNotificationsRepository.sendPushNotificationToASpecificUser(parameters);
  }
}
