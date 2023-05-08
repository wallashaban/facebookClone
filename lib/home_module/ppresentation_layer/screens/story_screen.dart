// ignore_for_file: prefer_typing_uninitialized_variables, unused_element

import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_app/core/utils/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../post_module/presentation_layer/widgets/popup_menu.dart';

class StoryScreen extends StatefulWidget {
  final story;
  const StoryScreen({super.key, required this.story});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  void initState() {
    super.initState();
    timer();
    // wait();
  }

  /* void wait() async {
    await Future.delayed(const Duration(seconds: 5))
        .then((value) => Navigator.pop(context));
  } */

  double value = 0.0;

  void timer() {
    Timer.periodic(const Duration(milliseconds: 5), (timer) {
      setState(() {
        value += 0.001;
        if (value > 1) {
          timer.cancel();
          Navigator.pop(context);
        }
       // debugPrint('value $value');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    void deleteStoryAfterOneDay(String storyId) {
      DateTime now = DateTime.now();
      DateTime createdAt = DateTime.parse('formattedString');
      Duration duration = now.difference(createdAt);
      if (duration.inHours >= 24) {
        BlocProvider.of<HomeCubit>(context).deleteStory('storyId');
      }
    }

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            LinearProgressIndicator(
              value: value,
              color: AppColors.darkGrey,
              backgroundColor: AppColors.lightGray,
            ),
            Stack(
              children: [
                CachedNetworkImage(
                 imageUrl: widget.story['storyPic'],
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.9,
                  //fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20.r,
                            backgroundColor: AppColors.gray,
                            backgroundImage:
                                NetworkImage(widget.story['profilePic']),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          CustomText(
                            text: widget.story['name'],
                            size: 18.sp,
                            color: AppColors.white,
                          ),
                        ],
                      ),
                      PopUpWifget(
                        isStory: true,
                        storyId: widget.story['storyId'],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
