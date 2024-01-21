import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/resources/components/round_button.dart';
import 'package:project_app/view_model/controller/register/register_view_model.dart';

class RegisterButtonWidget extends StatelessWidget {
  final formKey;

  const RegisterButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final registerVM = Get.put(RegisterViewModel());
    return Obx(() {
      return RoundButton(
          title: "Register",
          width: 200,
          loading: registerVM.loading.value,
          onPress: () {
            if (formKey.currentState!.validate()) {
              registerVM.registerApi();
              registerVM.emailController.value.clear();
              registerVM.password2Controller.value.clear();
              registerVM.passwordController.value.clear();
              registerVM.usernameController.value.clear();
            }
          });
    });
  }
}
