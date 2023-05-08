import 'package:facebook_app/chat_module/domain_layer/repository/chat_base_repository.dart';

import '../../../core/utils/exports.dart';


class UploadChatImageUseCase implements BaseUseCase<TaskSnapshot, File> {
  final ChatBaseRepository chatBaseRepository;

  UploadChatImageUseCase(this.chatBaseRepository);

  @override
  Future<TaskSnapshot> call(File image) async {
   return await chatBaseRepository.uploadChatImage(
      image,
    );
  }
}
