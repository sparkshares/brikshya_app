import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/models/auth/auth_model.dart';
import 'package:project_app/models/profile/profile_model.dart';
import 'package:project_app/repository/login_repository/login_repository.dart';
import 'package:project_app/repository/profile_repository/profile_repository.dart';
import 'package:project_app/resources/routes/routes_name.dart';
import 'package:project_app/utils/utils.dart';
import 'package:project_app/view_model/controller/user_preferences/user_preferences_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  final _profileRepo = ProfileRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;

    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text,
    };

    _api.loginApi(data).then((value) async {
      loading.value = false;

      if (value.data != null) {
        AuthModel authModel = AuthModel.fromJson(value.data);

        try {
          await userPreference.saveUser(authModel);
          ProfileModel profileValue = await _profileRepo.profileApi();
          await userPreference.saveRole(profileValue);
          print("profile value is " + profileValue.email.toString());
          Get.toNamed(RouteName.screenView);
        } catch (error, stackTrace) {
          Utils.snackBar("Error", "Failed to login");
        }
      } else {
        Utils.snackBar("Error", "Failed to login");
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", "Failed to login");
    });
  }
}
