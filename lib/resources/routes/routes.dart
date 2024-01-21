import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/resources/routes/routes_name.dart';
import 'package:project_app/view/donors/d_money/donate.dart';
import 'package:project_app/view/farmers/f_approved_list/approve_list.dart';
import 'package:project_app/view/home/home_view.dart';
import 'package:project_app/view/login/login_view.dart';
import 'package:project_app/view/register/register_view.dart';
import 'package:project_app/view/screen/screen.dart';
import 'package:project_app/view/splash_screen/intro.dart';
import 'package:project_app/view/donors/d_home/donor_home.dart';
import 'package:project_app/view/farmers/f_home/f_home.dart';

class AppRoutes {
  static appRoutes() => {
        GetPage(
            name: RouteName.donorHome,
            page: () => DonorHome(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.farmerAllDonation,
            page: () => ApprovedList(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.farmerHome,
            page: () => FarmerHome(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.introScreen,
            page: () => IntroScreen(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.approvedList,
            page: () => ApprovedList(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.donateMoney,
            page: () => DonateMoneyPage(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.screenView,
            page: () => ScreenView(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: "/login",
            page: () => LoginView(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
            name: RouteName.registerScreen,
            page: () => RegisterView(),
            transitionDuration: Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
      };
}
