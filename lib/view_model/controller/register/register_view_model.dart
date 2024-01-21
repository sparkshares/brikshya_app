import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/data/response/status.dart';

import 'package:project_app/models/auth/auth_model.dart';
import 'package:project_app/models/profile/profile_model.dart';
import 'package:project_app/repository/profile_repository/profile_repository.dart';
import 'package:project_app/repository/register_repository/register_repository.dart';
import 'package:project_app/resources/routes/routes_name.dart';
import 'package:project_app/utils/utils.dart';
import 'package:project_app/view_model/controller/user_preferences/user_preferences_view_model.dart';

class RegisterViewModel extends GetxController {
  final _api = RegisterRepository();
  final _profileRepo = ProfileRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final password2Controller = TextEditingController().obs;
  final usernameController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final password2FocusNode = FocusNode().obs;
  final usernameFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void registerApi() {
    loading.value = true;

    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text,
      "password2": password2Controller.value.text,
      "name": usernameController.value.text
    };

    _api.registerApi(data).then((value) async {
      loading.value = false;

      if (value.data != null) {
        AuthModel authModel = AuthModel.fromJson(value.data);

        try {
          await userPreference.saveUser(authModel);
          Utils.snackBar("Success", "Your registration has been completed");
          Get.toNamed(RouteName.loginScreen);
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
