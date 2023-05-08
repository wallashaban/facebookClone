// ignore_for_file: must_be_immutable

import 'package:facebook_app/home_module/ppresentation_layer/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();
  bool isShowUsers = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(15.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: CustomTextFormField(
                  hintText: 'Search',
                  controller: searchController,
                  vaildator: (val) {},
                  raduis: 30.r,
                  onChanged: (value) {
                    setState(() {
                      isShowUsers = true;
                    });
                  },
                ),
              ),
              isShowUsers
                  ? FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('user')
                          .where('firstName',
                              isGreaterThanOrEqualTo: searchController.text)
                          .get(),
                      //initialData: InitialData,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Expanded(
                            child: ListView.builder(
                              itemCount: (snapshot.data as dynamic).docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    BlocProvider.of<HomeCubit>(context)
                                        .getUserProfile(
                                            (snapshot.data as dynamic)
                                                .docs[index]['uId']
                                                .toString())
                                        .then((value) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => BlocBuilder<
                                                    HomeCubit, HomeState>(
                                                  builder: (context, state) {
                                                    return UserProfileScreen(
                                                      userProfile: BlocProvider
                                                              .of<HomeCubit>(
                                                                  context)
                                                          .userProfile,
                                                    );
                                                  },
                                                )),
                                      );
                                    });
                                  },
                                  child: Container(
                                    padding:  EdgeInsets.symmetric(
                                        horizontal: 15.w, vertical: 10.h),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              (snapshot.data as dynamic)
                                                  .docs[index]['image']),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        CustomText(
                                            text:
                                                "${(snapshot.data as dynamic).docs[index]['firstName']}  ${(snapshot.data as dynamic).docs[index]['surName']}",
                                            size: 20.sp),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
