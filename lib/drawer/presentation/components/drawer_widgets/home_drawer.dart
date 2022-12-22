import '../../../../home/presentation/screens/home_page.dart';
import '../../../../shared/global/app_colors.dart';
import '../../../../shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../screens/about_us_screen.dart';
import '../../screens/complaints_screen.dart';
import '../../screens/contact_us_screen.dart';
import '../../screens/pharmacy_user_profile_screen.dart';
import 'menu_item.dart';
import 'menu_screen.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  MyMenuItem currentItem = MenuItems.homepage;

  getScreen(MyMenuItem currentItem) {
    switch (currentItem) {
      case MenuItems.homepage:
        return const AllOrders();
      case MenuItems.profile:
        return const PharmacyUserProfileScreen();
      case MenuItems.contactUs:
        return const ContactUsScreen();
      case MenuItems.complaints:
        return const ComplaintsScreen();
      case MenuItems.aboutUs:
        return const AboutUsScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuBackgroundColor: AppColors.primary,
      isRtl: true,
      menuScreen: Builder(
        builder: (context) => Stack(
          children: [
            MenuScreen(
              currentItem: currentItem,
              onSelectedItem: (item) {
                setState(() => currentItem = item);
                ZoomDrawer.of(context)!.close();
              },
            ),
          ],
        ),
      ),
      mainScreenTapClose: true,
      mainScreen: getScreen(currentItem),
      style: DrawerStyle.defaultStyle,
      borderRadius: AppSize.s100,
      angle: AppSize.s0,
      slideWidth: mediaQueryWidth(context) * AppSize.s0_7,
    );
  }
}
