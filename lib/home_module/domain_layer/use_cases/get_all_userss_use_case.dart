import '../../../core/utils/exports.dart';

class GetAllUsersUseCase extends BaseUseCase<List<Users>, NoParameters> {
  final BaseHomeRepository baseHomeRepository;

  GetAllUsersUseCase(this.baseHomeRepository);

  @override
  Future<List<Users>> call(NoParameters parameters) async {
    return await baseHomeRepository.getAllUsers();
  }
}
