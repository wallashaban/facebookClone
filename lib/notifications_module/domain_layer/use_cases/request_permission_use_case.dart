
import '../../../core/utils/exports.dart';
import '../repository/base_notification_repository.dart';

class RequestPermissionUseCase implements BaseUseCase<void, NoParameters> {
  final BaseNotificationsRepository baseNotificationsRepository;

  RequestPermissionUseCase(this.baseNotificationsRepository);

  @override
  Future<void> call(NoParameters parameters) async {
    await baseNotificationsRepository.requesPermission();
  }
}
