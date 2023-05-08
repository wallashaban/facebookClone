import 'package:device_preview/device_preview.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'chat_module/presentation_layer/controller/chat_cubit.dart';
import 'core/srvices/service_locator.dart';
import 'core/utils/bloc_observer.dart';
import 'core/utils/exports.dart';
import 'notifications_module/presentation_layer/controllers/notifications_cubit.dart';
import 'post_module/presentation_layer/controllers/post_cubit.dart';
import 'profile_module/presentation_layer/controllers/profile_cubit.dart';

Future<void> firebaseMessagingBackgroundhandler(RemoteMessage message) async {
  debugPrint('Handeling a background message ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage();
  await FirebaseMessaging.instance.subscribeToTopic('TPITO');
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundhandler);
  Bloc.observer = MyBlocObserver();
  ServiceLocator().init();
  runApp(/*DevicePreview(builder:(context)=>*/ const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<HomeCubit>() /* ..getAllStories() */ ..getAllUsers(),
        ),
        BlocProvider(
          create: (context) => sl<AuthenticationCubit>()..getToken(),
        ),
        BlocProvider(
          create: (context) => sl<ProfileCubit>()..getUserData(),
        ),
        BlocProvider(
          create: (context) => sl<PostCubit>()..getAllPosts(),
        ),
        BlocProvider(
            create: (context) => sl<NotificationsCubit>()
              ..requesPermission()
              ..initInfo(
                  context) //..getFriendRequests()..getFriends()//..getAllNotifications(),
            ),
        BlocProvider(create: (context) => sl<ChatCubit>() //..initRecord(),
            ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          // builder: DevicePreview.appBuilder,
          title: 'Flutter Demo',
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerate,
          home: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.userChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return AppConstants().circularProgress();
                }
                if (snapshot.hasData) {
                  debugPrint(snapshot.hasData.toString());
                  return BottomNavBarScreen();
                }
                return LoginScreen();
              }),
        ),
      ),
    );
  }
}
