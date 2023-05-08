import '../../../core/utils/exports.dart';

import '../../domain_layer/entities/chat.dart';

class ChatModel extends Chat {
  const ChatModel({
     super.message,
    required super.uId,
    required super.senderName,
    required super.createdAt,
     super.image,
     required super.recieverUid,
  });

  factory ChatModel.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return ChatModel(
      message: json['message'],
      uId: json['uId'],
      senderName: json['senderName'],
      createdAt: json['createdAt'],
      image: json['image'],
      recieverUid: json['recieverUid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'message': message,
      'senderName': senderName,
      'createdAt':createdAt,
      'image':image,
      'recieverUid':recieverUid,
    };
  }
}
