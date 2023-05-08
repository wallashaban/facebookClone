// ignore_for_file: must_be_immutable

import 'package:facebook_app/core/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title:  CustomText(
          text: AppConstants.facebook,
          size: 35.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: -2,
        ),
        //centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding:  EdgeInsets.all(20.0.r),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                 CustomText(
                  text: AppConstants.loginTitle,
                  size: 30.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                CustomTextFormField(
                  vaildator: (email) {
                    if (email.isEmpty) {
                      return AppConstants.emailMessage;
                    }
                  },
                  controller: emailController,
                  hintText: AppConstants.email,
                  size: 20.sp,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                CustomTextFormField(
                  vaildator: (password) {
                    if (password.isEmpty) {
                      return AppConstants.passwordMessage;
                    }
                  },
                  controller: passwordController,
                  hintText: AppConstants.password,
                  size: 20.sp,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                BlocConsumer<AuthenticationCubit, AuthenticationState>(
                  listener: (context, state) {
                    if (state is SignInUserEithEmailAndPasswordSuccessState) {
                     AppConstants. navigateReplacement(
                        context,
                        AppRoutes.navbarScreen,
                      );
                    } else if (state
                        is SignInUserEithEmailAndPasswordErrorState) {
                      AppConstants.showSnackbar(
                          context: context, content: state.error.toString());
                    }
                  },
                  builder: (context, state) {
                    var cubit = BlocProvider.of<AuthenticationCubit>(context);
                    return CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.signInUserwithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        }
                      },
                      text: AppConstants.login,
                      size: 25.sp,
                    );
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const CustomText(
                    text: '_________________  or  _________________', size: 18),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.signUp,
                    );
                  },
                  text: AppConstants.createAnAcount,
                  size: 20.sp,
                  color: AppColors.green,
                  width: MediaQuery.of(context).size.width * 0.6,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextButton(
                    onPressed: () {
                    AppConstants.  navigateTo(context, AppRoutes.forgetPassword);
                    },
                    child:  CustomText(
                        text: AppConstants.forgetacoount, size: 20.sp))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
