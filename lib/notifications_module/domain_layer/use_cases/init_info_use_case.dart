
import '../../../core/utils/exports.dart';
import '../repository/base_notification_repository.dart';

class InitInfoUseCase implements BaseUseCase<void, BuildContext> {
  final BaseNotificationsRepository baseNotificationsRepository;

  InitInfoUseCase(this.baseNotificationsRepository);

  @override
  Future<void> call(BuildContext context) async {
    await baseNotificationsRepository.initInfo(context);
  }
}
