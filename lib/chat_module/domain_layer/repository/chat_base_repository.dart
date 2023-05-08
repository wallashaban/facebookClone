import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

abstract class ChatBaseRepository {
  Future<void> sendMessage(SendMessageParameters parameters);
  Future<TaskSnapshot> uploadChatImage(File postImage);
}

class SendMessageParameters {
  final String? message;
  final String senderName;
  final String? image;
  final String recieverUid;
  const SendMessageParameters({
    this.message,
    required this.senderName,
    this.image,
    required this.recieverUid,
  });
}
