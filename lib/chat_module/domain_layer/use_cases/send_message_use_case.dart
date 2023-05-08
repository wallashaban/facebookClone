import '../repository/chat_base_repository.dart';
import '../../../core/utils/exports.dart';

class SendMessageUseCase implements BaseUseCase<void, SendMessageParameters> {
   final ChatBaseRepository chatBaseRepository;

  SendMessageUseCase(this.chatBaseRepository);

  @override
  Future<void> call(SendMessageParameters parameters) async {
    await chatBaseRepository.sendMessage(parameters);
  }
}
