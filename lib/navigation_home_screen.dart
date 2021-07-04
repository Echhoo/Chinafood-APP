import 'package:chinafood/app_theme.dart';
import 'package:chinafood/custom_drawer/drawer_user_controller.dart';
import 'package:chinafood/custom_drawer/home_drawer.dart';
import 'package:chinafood/tools/feedback_screen.dart';
// import 'package:chinafood/home_screen.dart';
import 'package:chinafood/tools/invite_friend_screen.dart';
import 'package:chinafood/tools/about_us.dart';
import 'package:chinafood/home_page/home_page_home_screen.dart';
import 'package:flutter/material.dart';

import 'home_page/home_page_home_screen.dart';

class NavigationHomeScreen extends StatefulWidget {
  var phone;
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView =
        // HomePage();
        FitnessAppHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body:
          DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView =
              // HomePage();
              FitnessAppHomeScreen();
        });

      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = FeedbackScreen();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = InviteFriend();
        });
      } else if (drawerIndex == DrawerIndex.About) {
        setState(() {
          screenView = AboutUs();
        });
      }
    }
  }
}
