import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/utils/utils.dart';
import 'package:project_app/view_model/controller/login/login_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  const InputEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loginVM = Get.put(LoginViewModel());

    return TextFormField(
      controller: loginVM.emailController.value,
      focusNode: loginVM.emailFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar("email".tr, "empty_email".tr);
        }
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, loginVM.emailFocusNode.value,
            loginVM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
        hintText: "email_hint".tr,
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(12), // This makes the border rounded
        ),
      ),
    );
  }
}
