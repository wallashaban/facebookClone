// ignore_for_file: must_be_immutable

import 'package:facebook_app/profile_module/presentation_layer/controllers/profile_cubit.dart';

import '../../../core/srvices/service_locator.dart';
import '../../../core/utils/exports.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/chat_widget.dart';
import '../widgets/search_widget.dart';

class MainChatScreen extends StatelessWidget {
  MainChatScreen({super.key});
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchWidget(searchController: searchController),
            SizedBox(
              height: 10.h,
            ),
            BlocProvider(
              create: (context) => sl<ProfileCubit>()..getUserData(),
              child: BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.users.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (cubit.users[index].uId ==
                          BlocProvider.of<ProfileCubit>(context).user.uId) {
                        return const SizedBox(
                          height: 0,
                        );
                      }
                      return ChatWidget(user: cubit.users[index]);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
