import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/gallery-page/gallery_page_view.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_view.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_view.dart';
import 'package:fun_education_app/app/pages/profile-page/profile_page_view.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_view.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavbarMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    List<Widget> _buildScreens() {
      return [
        HomePageView(),
        LaporanPageView(),
        SavingPageView(),
        GalleryPageView(),
        ProfilePageView(),
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home_filled),
          title: ("Home"),
          textStyle: tsLabelLargeMedium(greyColor),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.all_inbox_rounded),
          title: ("Laporan"),
          textStyle: tsLabelLargeMedium(greyColor),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.wallet),
          title: ("Tabungan"),
          textStyle: tsLabelLargeMedium(greyColor),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.widgets_rounded),
          title: ("Galeri"),
          textStyle: tsLabelLargeMedium(greyColor),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person_rounded),
          title: ("Profile"),
          textStyle: tsLabelLargeMedium(greyColor),
          activeColorPrimary: primaryColor,
          inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }

    return PersistentTabView(
      context,
      padding: NavBarPadding.only(top: 15),
      margin: EdgeInsets.symmetric(vertical: 10),
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
      navBarHeight: 65.0,
    );
  }
}
