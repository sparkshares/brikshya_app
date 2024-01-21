import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_app/resources/routes/routes_name.dart';
import 'package:project_app/view_model/controller/user_preferences/user_preferences_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  UserPreference userPreference = UserPreference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("home_text".tr),
        actions: [
          IconButton(
              onPressed: () {
                userPreference.removeUser().then(
                  (value) {
                    Get.toNamed(RouteName.loginScreen);
                  },
                );
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
