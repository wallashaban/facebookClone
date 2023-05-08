import 'package:facebook_app/home_module/ppresentation_layer/screens/search_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../chat_module/presentation_layer/screens/chat_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/exports.dart';

class BottomNavBarScreen extends StatefulWidget {
  BottomNavBarScreen({super.key, this.index});
  var index;
  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen>
    with TickerProviderStateMixin {
  // var tabBarController =
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    if (widget.index != null) {
      setState(() {
        tabController.index = widget.index;
      });
    }
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);
        return DefaultTabController(
            length: cubit.screens.length,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.white,
                elevation: 0.0,
                title: const CustomText(
                  text: AppConstants.facebook,
                  size: 28,
                  color: AppColors.facebookBlue,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2,
                ),
                actions: [
                  CustomIconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const SearchScreen()));
                    },
                    icon: Icons.search,
                    color: AppColors.black,
                  ),
                  CustomIconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const ChatBottomNavbarScreen()),
                      );
                    },
                    icon: MdiIcons.facebookMessenger,
                    color: AppColors.black,
                  ),
                ],
                bottom: TabBar(
                    controller: tabController,
                    onTap: (index) {
                      if (widget.index != null) {
                        debugPrint('index ${widget.index}');

                        cubit.changeNavbar(
                          1,
                        );
                        setState(() {
                          widget.index = null;
                        });
                      }
                      cubit.changeNavbar(
                        index,
                      );
                    },
                    tabs: const [
                      Tab(
                        icon: Icon(
                          Icons.home,
                          color: AppColors.facebookBlue,
                        ),
                        text: '',
                      ),
                      Tab(
                        icon: Icon(
                          Icons.account_circle,
                          color: AppColors.facebookBlue,
                        ),
                        text: '',
                      ),
                      Tab(
                        icon: Icon(
                          Icons.notifications_none_outlined,
                          color: AppColors.facebookBlue,
                        ),
                        text: '',
                      ),
                      /* Tab(
                        icon: Icon(
                          FontAwesomeIcons.peopleGroup,
                          color: AppColors.facebookBlue,
                        ),
                        text: '',
                      ), */
                      Tab(
                        icon: Icon(
                          Icons.menu,
                          color: AppColors.facebookBlue,
                        ),
                        text: '',
                      ),
                    ]),
              ),
              body: TabBarView(
        controller: tabController,
        children: cubit.screens,
        ),
              /*     bottomNavigationBar: BottomNavigationBar(
                  selectedItemColor: AppColors.facebookBlue,
                  unselectedItemColor: AppColors.darkGrey,
                  currentIndex: cubit.index,
                  onTap: (index) {
                    cubit.changeNavbar(index);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.account_circle,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.notifications_none_outlined,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.menu,
                      ),
                      label: '',
                    ),
                  ]),
            */
            ));
      },
    );
  }
}
