import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:facebook_app/chat_module/domain_layer/use_cases/upload_chat_image_use_case.dart';

import '../../../core/utils/exports.dart';
import '../../../home_module/ppresentation_layer/screens/settings_screen.dart';
import '../../../notifications_module/presentation_layer/screens/friends_screen.dart';
import '../../../notifications_module/presentation_layer/screens/notification_screen.dart';
import '../../../profile_module/presentation_layer/screens/profile_screen.dart';
import '../../domain_layer/repository/chat_base_repository.dart';
import '../../domain_layer/use_cases/send_message_use_case.dart';
import '../screens/main_chat_screen.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final SendMessageUseCase sendMessageUseCase;
  final UploadChatImageUseCase uploadChatImageUseCase;
  ChatCubit(
    this.sendMessageUseCase,
    this.uploadChatImageUseCase,
  ) : super(ChatInitial());

  List<Widget> screens = [
    MainChatScreen(),
    const ProfileScreen(),
    const NotificationScreen(),
    FriendScreen(),
    const SettingsScreen()
  ];
  final recorder = FlutterSoundRecorder();
  final audioPlayer = AssetsAudioPlayer();
  String? filePath;
  bool isRecordeing = false;
  String recordText = '00:00:00';
  int index = 0;
  void startIt() async {
    filePath = '/sdcard/Download/temp.wav';

    /*  await recorder.openAudioSession(
        focus: AudioFocus.requestFocusAndStopOthers,
        category: SessionCategory.playAndRecord,
        mode: SessionMode.modeDefault,
        device: AudioDevice.speaker); */
    await recorder.setSubscriptionDuration(const Duration(milliseconds: 10));
    // await initializeDateFormatting();

    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  changeNavbar(int index) {
    this.index = index;
    emit(ChangeChatNavbarState());
    emit(ChatDone());
  }

  Future sendMessage(SendMessageParameters parameters) async {
    await sendMessageUseCase(parameters).then((value) {
      emit(SendMessageSuccessState());
      imageOfChat = null;
      image = null;
    }).catchError((error) {
      emit(SendMessageErrorState(error: error.toString()));
    });
  }

  Future startRecord() async {
    if (!isRecordReady) return;
    await recorder.startRecorder(toFile: 'audio');
    emit(StartRecordState());
  }

  Future stopRecord() async {
    if (!isRecordReady) return;
    final path = await recorder.stopRecorder();
    debugPrint('path $path');
    final audioFile = File(path!);
    debugPrint('audioFile $audioFile');
    emit(StopRecordState());
  }

  bool isRecordReady = false;
  Future initRecord() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      debugPrint('micrphone permission is not granted');
    }
    await recorder.openRecorder();
    isRecordReady = true;
    recorder.setSubscriptionDuration(const Duration(milliseconds: 500));
    emit(InitRecordState());
  }

  Future stop() async {
    if (!isRecordReady) return;
    final path = await recorder.stopRecorder();
    final audioFile = File(path!);
    debugPrint('audioFile $audioFile');
    emit(StopRecordState());
  }

  File? image;
  final picker = ImagePicker();
  Future pickImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    emit(PickImageSuccessState());
    emit(ChatDone());
  }

  File? imageCamera;
  Future pickImageCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    emit(PickImageSuccessState());
    emit(ChatDone());
  }

  String? imageOfChat;

  Future uploadChatImage() async {
    emit(UploadChatImageLoadingState());

    if (image != null) {
      await uploadChatImageUseCase(image!).then((value) async {
        imageOfChat = await value.ref.getDownloadURL();
        emit(UploadChatImageSuccessState());
      }).catchError((error) {
        debugPrint(error.toString());

        emit(
          UploadChatImageErrorState(
            error: error.toString(),
          ),
        );
      });
    }
  }
}
