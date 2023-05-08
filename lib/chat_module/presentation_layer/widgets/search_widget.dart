// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/exports.dart';

class SearchWidget extends StatelessWidget {
  final searchController;
  final bool isChat;
  const SearchWidget({super.key, required this.searchController,this.isChat=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.gray,
      ),
      child: TextFormField(
        controller: searchController,
        onChanged: (value){
          
        },
        decoration:  InputDecoration(
            hintText:isChat?'message': 'Search',
            prefixIcon: isChat?null: const Icon(Icons.search),
            border: InputBorder.none),
      ),
    );
  }
}
