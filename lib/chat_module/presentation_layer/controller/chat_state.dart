part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChangeChatNavbarState extends ChatState {}

class ChatDone extends ChatState {}

class SendMessageSuccessState extends ChatState {}

class SendMessageErrorState extends ChatState {
  final String error;
  const SendMessageErrorState({required this.error});
}

class StartRecordState extends ChatState{}

class StopRecordState extends ChatState{}

class RecordPermissionState extends ChatState{}

class InitRecordState extends ChatState{}

class PickImageSuccessState extends ChatState{}

class UploadChatImageLoadingState extends ChatState {}

class UploadChatImageSuccessState extends ChatState {}

class UploadChatImageErrorState extends ChatState {
  final String error;
  const UploadChatImageErrorState({
    required this.error,
  });
}
//class ChatDone extends ChatState{}
