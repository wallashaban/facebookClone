import '../../../core/utils/exports.dart';
import '../repository/profile_base_repository.dart';

class EditRelationshipUseCase implements BaseUseCase<void, String> {
  final BaseProfileRepository baseProfileRepository;

  EditRelationshipUseCase(this.baseProfileRepository);

  @override
  Future<void> call(String relationship) async {
    await baseProfileRepository.editRelation(relationship);
  }
}
