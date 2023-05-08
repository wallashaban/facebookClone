import 'package:flutter/material.dart';

import '../../post_module/presentation_layer/controllers/post_cubit.dart';
import '../../profile_module/presentation_layer/controllers/profile_cubit.dart';
import 'exports.dart';

class AppConstants {
  static const String baseUrl = 'https://fcm.googleapis.com/';
  static const String fcm = 'fcm/send';
  static const String facebook = 'facebook';
  static const String createAnAcount = 'Create an acount';
  static const facebookSignUpTitle = 'It\'s free and it always will be';
  static const firstName = 'First Name';
  static const surname = 'Surname';
  static const email = 'Email';
  static const password = 'New Password';
  static const birthday = 'Birthday';
  static const gender = 'Gender';
  static const female = 'Female';
  static const male = 'Male';
  static const logOut = 'Log out';

  static const createStory = 'Create story';
  static const policies =
      '''By clicking create an acount, you are agree to our terms and that you have read our data polcy,Including out Cookie USe''';
  static const login = 'Log In';
  static const loginTitle = 'Log into Facebook';
  static const forgetacoount = 'Forget password?';
  static const verify = 'Verify';
  static const cansel = 'Cansel';
  static const verifyContent =
      'Please check your gmail to verify your email to log into your acount';
  static const String resetTitle = 'Enter your email to reset your password';
  static const String reset = 'Reset Password';
  static const String send = 'Send';
  static const String passwordMessage = 'Please enter your password';
  static const String firstNameMessage = 'Please enter your first name';
  static const String surNameMessage = 'Please enter your surname';
  static const String emailMessage = 'Please enter your email';
  static const String emailCheck = 'Check your gmail';
  static const String adtToStory = 'Add to story';
  static const String editProfile = 'Edit profile';
  static const String like = 'Like';
  static const String comment = 'Comment';
  static const String share = 'Share';
  static const String createPost = 'Create Post';
  static const String addPostText = 'What\'s on your mind?';
  static const String post = 'Post';
  static const String addPhoto = 'add photo';
  static const String addVideo = 'add video';

  static const String profilePicture = 'Profile Picture';
  static const String edit = 'Edit';
  static const String coverPhoto = 'Cover photo';
  static const String bio = 'Bio';
  static const String details = 'Details';
  static const String addUniversity = 'Add University';
  static const String addSchool = 'Add School';
  static const String editCurrentTwon = 'Edit Current town/city';
  static const String editHomeTown = 'Edit Home town';
  static const String relationship = 'Edit Relationship';
  static const String save = 'Save';
  static const String editBio = 'Edit bio';
  static const String addWorkplace = 'Add workplace';
  static const String editDetails = 'Edit Details';
  static const String customise = 'Customise your intro';
  static const String detailsCondition = 'Details you select will be public';
  static const String work = 'Work';
  static const String education = 'Education';
  static const String currentTwon = 'Current town/city';
  static const String homeTown = 'Home town';
  static const String addWork = 'Add work';
  static const String addSecSchool = ' Add secondry school';
  static const String adduniversity = 'Add university';
  static const String addCurrentTown = 'Add current town';
  static const String addHomeTown = 'Add home town';
  static const String addRelationship = 'Add relationship';
  static const String workplaceName = 'Workplace name';
  static const String universityName = 'University name';
  static const String schoolName = 'School name';
  static const String workplace = 'workplace';
  static const String school = 'Shcool';
  static const String relationshipStatus = 'Relationship status';
  static const String university = 'University';
  static const String comments = 'Comments';
  static const String writeAComment = 'Write a comment...';
  static const String addFriend = 'Add friend';
  static const String remove = 'Remove';
  static const String confirm = 'Confirm';
  static const String delete = 'Delete';
  static const String friendRequests = 'Friend requests';
  static const String people = 'People you may know';

  static String? token;

  static void showSnackbar(
      {required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
    ));
  }

  Widget circularProgress() => const Center(
        child: CircularProgressIndicator(),
      );

  /* static void showToast({required String message}) =>
    Fluttertoast.showToast(msg: message,
    fontSize: 18); */
  static void navigateTo(context, String routeName,[var arguments]) {
    Navigator.pushNamed(context, routeName,arguments: arguments);
  }

  static void navigateReplacement(context, String routeName) =>
      Navigator.pushReplacementNamed(context, routeName);

  static final picker = ImagePicker();

  static Future pickImage(
      {bool isCover = false, isProfile = false, required context}) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      isCover
          ? BlocProvider.of<ProfileCubit>(context).coverImage =
              File(pickedFile.path)
          : isProfile
              ? BlocProvider.of<ProfileCubit>(context).profileImage =
                  File(pickedFile.path)
              : BlocProvider.of<PostCubit>(context).postImage =
                  File(pickedFile.path);
    }
    /*  emit(PickProfileImageSuccessState());
    emit(Donee()); */
  }

  static Future verifyDialog(
    context,
    String content,
    String leftText,
    String rightText,
  ) =>
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => Center(
                child: Container(
                  width: double.infinity,
                  //padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AlertDialog(
                        elevation: 0.0,
                        content: CustomText(
                          text: content,
                          size: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  text: leftText,
                                  onPressed: (() {
                                    debugPrint(
                                        'email verified ${BlocProvider.of<AuthenticationCubit>(context).isEmailVerified}');
                                    BlocProvider.of<AuthenticationCubit>(
                                                context)
                                            .isEmailVerified()
                                        ? AppConstants.navigateTo(
                                            context,
                                            AppRoutes.homePage,
                                          )
                                        : showSnackbar(
                                            context: context,
                                            content: 'Not verified');
                                  }),
                                  size: 18,
                                  fontWeight: FontWeight.normal,
                                  width: 100,
                                  height: 40,
                                ),
                                CustomButton(
                                  text: rightText,
                                  size: 18,
                                  onPressed: (() {
                                    Navigator.pop(context);
                                  }),
                                  fontWeight: FontWeight.normal,
                                  width: 100,
                                  height: 40,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
}
