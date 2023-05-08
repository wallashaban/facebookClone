import 'package:firebase_storage/firebase_storage.dart';

import 'dart:io';

import '../data_source/chat_remote_data_source.dart';

import '../../../core/error/exceptions.dart';
import '../../domain_layer/repository/chat_base_repository.dart';

class ChatRepository implements ChatBaseRepository {
  final BaseChatRemoteDataSource baseChatRemoteDataSource;

  ChatRepository(this.baseChatRemoteDataSource);
  @override


  @override
  Future<void> sendMessage(SendMessageParameters parameters) async {
    try {
      return await baseChatRemoteDataSource.sendMessage(parameters);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<TaskSnapshot> uploadChatImage(File image)async {
    try {
      return await baseChatRemoteDataSource.uploadChatImage(image);
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }
}
