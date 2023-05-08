import '../../../core/utils/exports.dart';

class Chat extends Equatable {
  final String? message;
  final String uId;
  final String senderName;
  final String createdAt;
  final String? image;
  final String recieverUid;
  const Chat({
    required this.message,
    required this.uId,
    required this.senderName,
    required this.createdAt,
    required this.image,
    required this.recieverUid,
  });

  @override
  List<Object?> get props => [
        uId,
        message,
        senderName,
        createdAt,
        image,
        recieverUid,
      ];
}
