

import 'package:facebook_app/chat_module/domain_layer/use_cases/upload_chat_image_use_case.dart';

import '../../chat_module/data_layer/data_source/chat_remote_data_source.dart';
import '../../chat_module/data_layer/repository/chat_repository.dart';
import '../../chat_module/domain_layer/repository/chat_base_repository.dart';
import '../../chat_module/domain_layer/use_cases/send_message_use_case.dart';
import '../../home_module/domain_layer/use_cases/upload_story_image_use_case.dart';
import '../../home_module/domain_layer/use_cases/upload_story_video_use_case.dart';

import '../../chat_module/presentation_layer/controller/chat_cubit.dart';
import '../utils/exports.dart';
import '../../home_module/domain_layer/use_cases/create_story_use_case.dart';
import '../../home_module/domain_layer/use_cases/delete_story_use_case.dart';
import '../../notifications_module/data_layer/data_source/notifications_remote_data_source.dart';
import '../../notifications_module/data_layer/repository/notification_repository.dart';
import '../../notifications_module/domain_layer/repository/base_notification_repository.dart';
import '../../notifications_module/presentation_layer/controllers/notifications_cubit.dart';
import '../../post_module/data_layer/data_source/post_remote_data_source.dart';
import '../../post_module/data_layer/repository/post_repository.dart';
import '../../post_module/domain_layer/repository/base_post_repo.dart';
import '../../profile_module/data_layer/data_source/profile_remote_data_source.dart';
import '../../profile_module/domain_layer/repository/profile_base_repository.dart';
import '../../profile_module/presentation_layer/controllers/profile_cubit.dart';

import '../../home_module/domain_layer/use_cases/get_all_stories_use_case.dart';
import '../../home_module/domain_layer/use_cases/get_all_userss_use_case.dart';
import '../../home_module/domain_layer/use_cases/get_user_profile_use_case.dart';
import '../../notifications_module/domain_layer/use_cases/add_user_friends_use_case.dart';
import '../../notifications_module/domain_layer/use_cases/delete_friend_reqest_use_case.dart';
import '../../notifications_module/domain_layer/use_cases/friend_request_use_case.dart';
import '../../notifications_module/domain_layer/use_cases/get_all_friend_requests_use_case.dart';
import '../../notifications_module/domain_layer/use_cases/get_all_notifications_use_case.dart';
import '../../notifications_module/domain_layer/use_cases/get_friends_use_case.dart';
import '../../notifications_module/domain_layer/use_cases/init_info_use_case.dart';
import '../../notifications_module/domain_layer/use_cases/push_notification_to_all_users_use_case.dart';
import '../../notifications_module/domain_layer/use_cases/push_notification_to_aspecific_user_use_case.dart';
import '../../notifications_module/domain_layer/use_cases/request_permission_use_case.dart';
import '../../post_module/domain_layer/use_cases/add_comment_use_case.dart';
import '../../post_module/domain_layer/use_cases/create_post_use_case.dart';
import '../../post_module/domain_layer/use_cases/delete_post_use_case.dart';
import '../../post_module/domain_layer/use_cases/get_all_posts_use_case.dart';
import '../../post_module/domain_layer/use_cases/get_comments_use_case.dart';
import '../../post_module/domain_layer/use_cases/get_user_posts_use_case.dart';
import '../../post_module/domain_layer/use_cases/like_post_use_case.dart';
import '../../post_module/domain_layer/use_cases/upload_post_image_use_case.dart';
import '../../post_module/domain_layer/use_cases/upload_post_video_use_case.dart';
import '../../post_module/presentation_layer/controllers/post_cubit.dart';
import '../../profile_module/data_layer/repository/profile_repository.dart';
import '../../profile_module/domain_layer/use_cases/edit_bio_use_case.dart';
import '../../profile_module/domain_layer/use_cases/edit_current_home_use_case.dart';
import '../../profile_module/domain_layer/use_cases/edit_home_town_use_case.dart';
import '../../profile_module/domain_layer/use_cases/edit_relation_use_case.dart';
import '../../profile_module/domain_layer/use_cases/edit_school_use_case.dart';
import '../../profile_module/domain_layer/use_cases/edit_university_use_case.dart';
import '../../profile_module/domain_layer/use_cases/edit_workplace_use_case.dart';
import '../../profile_module/domain_layer/use_cases/get_user_data_use_case.dart';
import '../../profile_module/domain_layer/use_cases/update_cover_image_use_case.dart';
import '../../profile_module/domain_layer/use_cases/update_profile_image_use_case.dart';

final sl = GetIt.instance;

class ServiceLocator{
  void init()
  {
      /// Authentication remoteDataSource
    sl.registerLazySingleton<BaseRemoteAuthenticationDataSource>(
      () => RemoteAuthenticationDataSource(),
    );

    /// Authentication Repository
    sl.registerLazySingleton<BaseAuthenticationRepository>(
      () => AuthenticationRepository(sl()),
    );

    /// Authentication UseCase
    sl.registerLazySingleton(
      () => CreateUserWithEmailAndPasswordUseCase(sl()),
    );


    /// Authentication signIn UseCase
    sl.registerLazySingleton(
      () => SignInWithEmailAndPasswordUseCase(sl()),
    );


     /// Authentication resert Password UseCase
    sl.registerLazySingleton(
      () => ResetPasswordUseCase(sl()),
    );


     /// Authentication Verify email UseCase
    sl.registerLazySingleton(
      () => VerifyEmailUseCase(sl()),
    );

     /// Authentication Signout  UseCase
    sl.registerLazySingleton(
      () => SignOutUseCase(sl()),
    );

    /// Authentication cubit
    sl.registerFactory(
      () => AuthenticationCubit(sl(),sl(),sl(),sl(),sl()),
    );

     /// home repo  
    sl.registerLazySingleton<BaseHomeRepository>(
      () => HomeRepository(sl()),
    );
     /// home remote data source  
    sl.registerLazySingleton<BaseHomeemoteDataSource>(
      () => HomeRemotrDataSource(),
    );

    
       /// profile repo  
    sl.registerLazySingleton<BaseProfileRepository>(
      () => ProfileRepository(sl()),
    );
     /// profile remote data source  
    sl.registerLazySingleton<BaseProfileRemoteDataSource>(
      () => ProfileRemoteDataSource(),
    );

     /// home get user data   UseCase
    sl.registerLazySingleton(
      () => GetUserDataUSeCase(sl()),
    );
     

      /// home update profile image   UseCase
    sl.registerLazySingleton(
      () => UpdateProfileImageUseCase(sl()),
    );

     /// home update cover image UseCase
    sl.registerLazySingleton(
      () => UpdateCoverImageUseCase(sl()),
    );

    /// home create post UseCase
    sl.registerLazySingleton(
      () => CreatePostUseCase(sl()),
    );

    /// home upload post image UseCase
    sl.registerLazySingleton(
      () => UploadPostImageUseCase(sl()),
    );

     /// home get user posts UseCase
    sl.registerLazySingleton(
      () => GetUserPostsUseCase(sl()),
    );

    /// home like posts UseCase
    sl.registerLazySingleton(
      () => LikePostUseCase(sl()),
    );

 

   

     /// home get all posts  UseCase
    sl.registerLazySingleton(
      () => GetAllPostsUseCase(sl()),
    );

      /// home edit bio  UseCase
    sl.registerLazySingleton(
      () => EditBioUseCase(sl()),
    );

       /// home edit university  UseCase
    sl.registerLazySingleton(
      () => EditBUniversityUseCase(sl()),
    );

       /// home edit school  UseCase
    sl.registerLazySingleton(
      () => EditSchoolUseCase(sl()),
    );

       /// home edit current town  UseCase
    sl.registerLazySingleton(
      () => EditCurrentTownUseCase(sl()),
    );

       /// home edit home town  UseCase
    sl.registerLazySingleton(
      () => EditHomeTownUseCase(sl()),
    );

       /// home edit relation  UseCase
    sl.registerLazySingleton(
      () => EditRelationshipUseCase(sl()),
    );

       /// home edit workplace  UseCase
    sl.registerLazySingleton(
      () => EditWorkplaceUseCase(sl()),
    );

          /// home add comment  UseCase
    sl.registerLazySingleton(
      () => AddCommentUseCase(sl()),
    );
          /// home get comments   UseCase
    sl.registerLazySingleton(
      () => GetCommentsUseCase(sl()),
    );

           /// home delete post UseCase
    sl.registerLazySingleton(
      () => DeletePostUseCase(sl()),
    );

          /// home get user profile post UseCase
    sl.registerLazySingleton(
      () => GetUserProfileUSeCase(sl()),
    );

       /// home get user profile post UseCase
    sl.registerLazySingleton(
      () => UploadPostVideoUseCase(sl()),
    );

        /// home get user profile post UseCase
    sl.registerLazySingleton(
      () => InitInfoUseCase(sl()),
    );
        /// home get user profile post UseCase
    sl.registerLazySingleton(
      () => RequestPermissionUseCase(sl()),
    );
            /// home get user profile post UseCase
    sl.registerLazySingleton(
      () => PushNotificationToAspecificUserUseCae(sl()),
    );

            /// home get user profile post UseCase
    sl.registerLazySingleton(
      () => PushNotificationToallUsersUseCae(sl()),
    );
            /// home get user profile post UseCase
    sl.registerLazySingleton(
      () => GetAllUsersUseCase(sl()),
    );

    sl.registerLazySingleton(
      () => GetNotificationsUsersUseCase(sl()),
    );

    sl.registerLazySingleton(
      () => GetFriendRequestsUseCase(sl()),
    );

    sl.registerLazySingleton(
      () => FriendRequestUseCase(sl()),
    );

    sl.registerLazySingleton(
      () => GetFriendsUseCase(sl()),
    );

    sl.registerLazySingleton(
      () => AddUserFriendUseCase(sl()),
    );

    sl.registerLazySingleton(
      () => DeleteFriendRequestUseCase(sl()),
    );

    sl.registerLazySingleton<BasePostRepository>(
      () => PostRepository(sl()),
    );

    sl.registerLazySingleton<BasePostRemoteDataSource>(
      () => PostRemoteDataSource(),
    );

     sl.registerLazySingleton<BaseNotificationsRemoteDataSource>(
      () => NotificationsRemoteDataSource(),
    );
    sl.registerLazySingleton<BaseNotificationsRepository>(
      () => NotificationRepository(sl()),
    );


      sl.registerLazySingleton<BaseChatRemoteDataSource>(
      () => ChatRemoteDataSource(),
    );
    sl.registerLazySingleton<ChatBaseRepository>(
      () => ChatRepository(sl()),
    );

    sl.registerLazySingleton(
      () => DeleteStoryUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => CreateStoryUseCase(sl()),
    );sl.registerLazySingleton(
      () => GetAllStoriesUseCase(sl()),
    );
    sl.registerLazySingleton(
      () => UploadStoryImageUseCase(sl()),
    );sl.registerLazySingleton(
      () => UploadStoryVideoUseCase(sl()),
    );

    sl.registerLazySingleton(
      () => SendMessageUseCase(sl()),
    );

     sl.registerLazySingleton(
      () => UploadChatImageUseCase(sl()),
    );

    /// home cubit
    sl.registerFactory(
      () => HomeCubit(sl(),sl(),sl(),sl(),sl(),sl(),sl(),),
    );

     /// profile cubit
    sl.registerFactory(
      () => ProfileCubit(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),),
    );

     /// post cubit
    sl.registerFactory(
      () => PostCubit(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),),
    );
    /// notification cubit
    sl.registerFactory(
      () => NotificationsCubit(sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),sl(),),
    );

    ///chat cubit
    sl.registerFactory(
      () => ChatCubit(sl(),sl(),),
    );
  }
}