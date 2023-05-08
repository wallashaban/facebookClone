import '../../../core/utils/exports.dart';

import '../repository/base_notification_repository.dart';

class GetNotificationsUsersUseCase extends BaseUseCase<List<Notifications>, NoParameters> {
  final BaseNotificationsRepository baseNotificationsRepository;

  GetNotificationsUsersUseCase(this.baseNotificationsRepository);

  @override
  Future<List<Notifications>> call(NoParameters parameters) async {
    return await baseNotificationsRepository.getNotifications();
  }
}
