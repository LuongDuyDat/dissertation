import 'package:flutter/material.dart';
import 'package:learning_intern_support_system/screen/home.dart';
import 'package:learning_intern_support_system/screen/notification.dart';
import 'package:learning_intern_support_system/screen/profile/my_profile.dart';
import 'package:learning_intern_support_system/screen/schedule.dart';
import 'package:learning_intern_support_system/util/strings.dart';
import 'package:learning_intern_support_system/util/theme.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../util/global.dart';

class PersistentNavbar extends StatelessWidget {
  const PersistentNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return PersistentTabView(
      context,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      backgroundColor: backgroundLightColor2,
      resizeToAvoidBottomInset: true,
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const SchedulePage(),
      const NotificationPage(),
      const ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: (homeString),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).scaffoldBackgroundColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calendar_today),
        title: (scheduleString),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).scaffoldBackgroundColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications),
        title: (notificationString),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).scaffoldBackgroundColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: (meString),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).scaffoldBackgroundColor,
      ),
    ];
  }

}