import '../../home_module/ppresentation_layer/screens/add_story_screen.dart';

import '../../home_module/ppresentation_layer/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'exports.dart';

import '../../profile_module/presentation_layer/screens/add_work_screen.dart';
import '../../profile_module/presentation_layer/screens/edit_details_screen.dart';
import '../../profile_module/presentation_layer/screens/edit_profile_screen.dart';
import '../../profile_module/presentation_layer/screens/profile_screen.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case AppRoutes.signUp:
      return MaterialPageRoute(builder: (_) => SignUpScreen());
    case AppRoutes.homePage:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case AppRoutes.forgetPassword:
      return MaterialPageRoute(builder: (_) => ForgetPassword());
    case AppRoutes.createPost:
      return MaterialPageRoute(builder: (_) => CreatePostScreen());
    case AppRoutes.profileScreen:
      return MaterialPageRoute(builder: (_) => const ProfileScreen());
    case AppRoutes.searchScreen:
      return MaterialPageRoute(builder: (_) => const SearchScreen());
    case AppRoutes.editProfile:
      return MaterialPageRoute(
          builder: (_) => const EditProfileScreen());
    case AppRoutes.editDetails:
      return MaterialPageRoute(
          builder: (_) =>  const EditDetailsScreen());
    case AppRoutes.addWork:
      return MaterialPageRoute(
          builder: (context) => AddWorkScreen());
    case AppRoutes.createStory:
      return MaterialPageRoute(
          builder: (context) => AddStoryScreen());
    case AppRoutes.navbarScreen:

      return MaterialPageRoute(
        
          builder: (context) => 
           BottomNavBarScreen(index: settings.arguments,));      
    default:
      return MaterialPageRoute(builder: (_) => LoginScreen());
  }
}
