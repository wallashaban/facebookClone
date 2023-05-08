// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';
import '../screens/story_screen.dart';

class StoryWidet extends StatelessWidget {
  final  story;
  const StoryWidet({
    super.key,
    required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => StoryScreen(story: story),
          ),
        );
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: AppColors.black,
          ),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                  imageUrl:  story['storyPic'],
                    height: double.infinity,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  )),
              Positioned(
                top: 5,
                left: 5,
                child: CircleAvatar(
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: AppColors.gray,
                    backgroundImage: NetworkImage(story['profilePic']),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
