import '../utils/exports.dart';

class ErrorMessageModel extends Equatable {
  final String message;
  const ErrorMessageModel({
    required this.message,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      message: json['message'],
    );
  }
  @override
  List<Object?> get props => [
    message,
  ];
}
