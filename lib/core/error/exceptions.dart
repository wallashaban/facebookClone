
import '../utils/exports.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  ServerException({
    required this.errorMessageModel,
  });
}
