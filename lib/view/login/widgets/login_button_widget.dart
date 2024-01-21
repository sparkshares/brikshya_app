import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/resources/components/round_button.dart';
import 'package:project_app/view_model/controller/login/login_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;

  const LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final loginVM = Get.put(LoginViewModel());
    return Obx(() {
      return RoundButton(
          title: "Login".tr,
          width: 200,
          loading: loginVM.loading.value,
          onPress: () {
            if (formKey.currentState!.validate()) {
              loginVM.loginApi();

              loginVM.emailController.value.clear();
              loginVM.passwordController.value.clear();
            }
          });
    });
  }
}
