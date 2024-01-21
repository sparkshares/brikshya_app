import 'dart:async';

import 'package:get/get.dart';
import 'package:project_app/resources/routes/routes_name.dart';
import 'package:project_app/view_model/controller/user_preferences/user_preferences_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then((value) {
      if (value.token != null && value.token.toString().isNotEmpty) {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteName.screenView));
        //const Duration(seconds: 3),
        //() => Get.toNamed(RouteName.registerView));
      } else {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteName.introScreen));
        //const Duration(seconds: 3),
        //() => Get.toNamed(RouteName.registerView));
      }
    });
  }
}
