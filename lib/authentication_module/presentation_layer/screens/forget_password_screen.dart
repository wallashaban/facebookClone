// ignore_for_file: must_be_immutable

import 'package:facebook_app/core/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title:  CustomText(
          text: AppConstants.reset,
          size: 25.sp,
          fontWeight: FontWeight.bold,
          //letterSpacing: -2,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     CustomText(text: AppConstants.resetTitle, size: 16.sp),
                    SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                    CustomTextFormField(
                        hintText: AppConstants.email,
                        controller: emailController,
                        vaildator: (email) {
                          return AppConstants.emailMessage;
                        }),
                    SizedBox(height: MediaQuery.of(context).size.height*0.03,),    
                    BlocBuilder<AuthenticationCubit, AuthenticationState>(
                      builder: (context, state) {
                        var cubit = BlocProvider.of<AuthenticationCubit>(context);
                        return CustomButton(
                          width: MediaQuery.of(context).size.width*0.4,
                          onPressed: () {
                            cubit
                                .resetPassword(email: emailController.text.trim())
                                .then((value) {
                              AppConstants.showSnackbar(
                                context: context,
                                content: AppConstants.emailCheck,
                              );
                            });
                          },
                          text: AppConstants.send,
                          size: 25.sp,
                        );
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
