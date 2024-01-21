import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/resources/colors/app_color.dart';
import 'package:project_app/view/farmers/f_approved_list/approve_list.dart';
import 'package:project_app/view/farmers/f_profile/farmer_profile.dart';
import 'package:project_app/view/home/home_view.dart';
import 'package:project_app/view/donors/d_home/donor_home.dart';
import 'package:project_app/view/donors/d_profile/donor_profile.dart';
import 'package:project_app/view/farmers/f_home/f_home.dart';

class NavController extends GetxController {
  Rx<Widget> currentScreen = Rx<Widget>(Container());
  RxInt userRole = RxInt(0);

  @override
  void onInit() {
    super.onInit();
  }

  void changeScreen(int index) {
    if (userRole.value == 0) {
      switch (index) {
        case 0:
          currentScreen.value = DonorHome(); // Screen for role 0, item 0
          break;

        case 1:
          currentScreen.value = StudentProfile(); // Screen for role 0, item 2
          break;
      }
    } else if (userRole.value == 1) {
      switch (index) {
        case 0:
          currentScreen.value = FarmerHome(); // Screen for role 1, item 0
          break;
        case 1:
          currentScreen.value = ApprovedList(); // Screen for role 1, item 1
          break;
        case 2:
          currentScreen.value = FarmerProfile(); // Screen for role 1, item 1
          break;
      }
    }
    // Add more conditions for other roles if needed
  }

  void logoutUser() {
    currentScreen.value = Container();
  }

  void setUserRole(int role) {
    userRole.value = role;

    if (role == 0) {
      currentScreen.value = DonorHome();
    } else if (role == 1) {
      currentScreen.value = FarmerHome();
    }
  }

  List<FluidNavBarIcon> getNavBarItems() {
    if (userRole.value == 0) {
      return [
        FluidNavBarIcon(
            icon: Icons.home,
            backgroundColor: Colors.white,
            extras: {"label": "home"}),
        FluidNavBarIcon(
            icon: Icons.person,
            backgroundColor: Colors.white,
            extras: {"label": "profile"}),
      ];
    } else if (userRole.value == 1) {
      return [
        FluidNavBarIcon(
            icon: Icons.home,
            backgroundColor: Colors.white,
            extras: {"label": "home"}),
        FluidNavBarIcon(
            icon: Icons.book,
            // backgroundColor: AppColor.blackColor,
            // selectedForegroundColor: Colors.white,
            // unselectedForegroundColor: Colors.white,
            extras: {"label": "settings"}),
        FluidNavBarIcon(
            icon: Icons.person,
            backgroundColor: Colors.white,
            extras: {"label": "profile"}),
      ];
    } else {
      return [];
    }
  }
}
