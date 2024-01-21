import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/utils/utils.dart';
import 'package:project_app/view_model/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  const InputPasswordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final loginVM = Get.put(LoginViewModel());

    // First step = Itiliaize view model , 2nd step, using reactive varible

    return TextFormField(
      controller: loginVM.passwordController.value,
      focusNode: loginVM.passwordFocusNode.value,
      obscureText: true,
      obscuringCharacter: "*",
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar("password".tr, "empty_password".tr);
        }
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, loginVM.emailFocusNode.value,
            loginVM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
          hintText: "password_hint".tr,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10), // This makes the border rounded
          )),
    );
  }
}
