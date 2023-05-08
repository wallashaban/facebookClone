// ignore_for_file: must_be_immutable

import 'package:facebook_app/core/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  var firstNameController = TextEditingController();
  var surNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  CustomText(
          text: AppConstants.facebook,
          size: 30.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: -2,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(20.r),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   CustomText(
                    text: AppConstants.createAnAcount,
                    size: 30.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                   CustomText(
                    text: AppConstants.facebookSignUpTitle,
                    size: 18.sp,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFormField(
                        
                        vaildator: (firstName) {
                          if (firstName.isEmpty) {
                            return AppConstants.firstNameMessage;
                          }
                        },
                        controller: firstNameController,
                        hintText: 'Name',
                        size: 15.sp,
                        width: MediaQuery.of(context).size.width * 0.43,
                      ),
                      CustomTextFormField(
                        vaildator: (surName) {
                          if (surName.isEmpty) {
                            return AppConstants.surNameMessage;
                          }
                        },
                        controller: surNameController,
                        hintText: AppConstants.surname,
                        size: 15.sp,
                        width: MediaQuery.of(context).size.width * 0.45,
                      ),
                    ],
                ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  BlocBuilder<AuthenticationCubit, AuthenticationState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: AppConstants.female,
                                  groupValue:
                                      BlocProvider.of<AuthenticationCubit>(
                                              context)
                                          .gender,
                                  onChanged: (value) {
                                    BlocProvider.of<AuthenticationCubit>(
                                            context)
                                        .chooseGender(
                                      value!,
                                    );
                                  }),
                               CustomText(
                                text: AppConstants.female,
                                size: 20.sp,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.03,
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: AppConstants.male,
                                  groupValue:
                                      BlocProvider.of<AuthenticationCubit>(
                                              context)
                                          .gender,
                                  onChanged: (value) {
                                    BlocProvider.of<AuthenticationCubit>(
                                            context)
                                        .chooseGender(value!);
                                  }),
                               CustomText(
                                text: AppConstants.male,
                                size: 20.sp,
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                   CustomText(
                    text: AppConstants.policies,
                    size: 16.sp,
                    lines: 6,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  BlocConsumer<AuthenticationCubit, AuthenticationState>(
                    listener: (context, state) {
                      if (state is CreateUserEithEmailAndPasswordErrorState) {
                        AppConstants.showSnackbar(
                          context: context,
                          content: state.error.toString(),
                        );
                      } else if (state
                          is CreateUserEithEmailAndPasswordSuccessState) {
                        AppConstants.navigateReplacement(
                          context,
                          AppRoutes.navbarScreen,
                        );
                      }
                    },
                    builder: (context, state) {
                      var cubit = BlocProvider.of<AuthenticationCubit>(context);
                      return CustomButton(
                        onPressed: () {
                          debugPrint(emailController.text);
                          if (formKey.currentState!.validate()) {
                            cubit
                                .createUserwithEmailAndPassword(
                                    fristName: firstNameController.text.trim(),
                                    surName: surNameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                    birthDate: '20-02-2020',
                                    gender: cubit.gender,
                                    isEmailVerified: false,
                                    token: AppConstants.token!);
                          }
                        },
                        text: AppConstants.createAnAcount,
                        size: 25.sp,
                        color: AppColors.green,
                        width: MediaQuery.of(context).size.width * 0.7,
                      );
                    },
                  ),
                 ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
