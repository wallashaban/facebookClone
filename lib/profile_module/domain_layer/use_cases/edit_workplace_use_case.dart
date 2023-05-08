import '../../../core/utils/exports.dart';
import '../repository/profile_base_repository.dart';

class EditWorkplaceUseCase implements BaseUseCase<void, String> {
  final BaseProfileRepository baseProfileRepository;

  EditWorkplaceUseCase(this.baseProfileRepository);

  @override
  Future<void> call(String workplace) async {
    await baseProfileRepository.editWorkPlace(workplace);
  }
}
