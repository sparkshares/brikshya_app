import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/view_model/controller/user_preferences/user_preferences_view_model.dart';
import 'package:project_app/view_model/controller/screen_controller/screen_controller.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';

class ScreenView extends StatefulWidget {
  const ScreenView({super.key});

  @override
  State<ScreenView> createState() => _ScreenViewState();
}

class _ScreenViewState extends State<ScreenView> {
  final NavController navController = Get.put(NavController());
  final UserPreference userPreference = UserPreference();

  @override
  void initState() {
    super.initState();
    setUserRole();
    ever(navController.userRole, handleUserRoleChange);
  }

  void handleUserRoleChange(int role) {
    navController.setUserRole(role);
  }

  Future<void> setUserRole() async {
    String? role = await userPreference.getRole();
    int roleValue = role != null ? int.tryParse(role) ?? 0 : 0;
    navController.setUserRole(roleValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: navController.currentScreen.value,
          )),
      bottomNavigationBar: Obx(() => FluidNavBar(
            icons: navController.getNavBarItems(),
            onChange: navController.changeScreen,
          )),
    );
  }
}
