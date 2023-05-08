import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/chat_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../domain_layer/repository/chat_base_repository.dart';

abstract class BaseChatRemoteDataSource {
  Future<void> sendMessage(SendMessageParameters parameters);
  Future<TaskSnapshot> uploadChatImage(File image);
}

class ChatRemoteDataSource implements BaseChatRemoteDataSource {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  @override
  Future<void> sendMessage(SendMessageParameters parameters) async {
    try {
      final addMessage = firebaseFirestore
          .collection('user')
          .doc(auth.currentUser!.uid)
          .collection('chat')
          .doc();
      ChatModel message = ChatModel(
        uId: auth.currentUser!.uid,
        senderName: parameters.senderName,
        message: parameters.message,
        createdAt: DateTime.now().toString(),
        image: parameters.image,
        recieverUid: parameters.recieverUid,
      );
      await addMessage.set(message.toJson());
     await firebaseFirestore
          .collection('user')
          .doc(parameters.recieverUid)
          .collection('chat')
          .doc(addMessage.id)
          .set(message.toJson());
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<TaskSnapshot> uploadChatImage(File image) async {
    try {
      return await firebaseStorage
          .ref()
          .child('chatImages/${Uri.file(image.path).pathSegments.last}')
          .putFile(image);
    } catch (error) {
      throw Exception(error);
    }
  }
}
