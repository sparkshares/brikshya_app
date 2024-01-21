import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/utils/utils.dart';
import 'package:project_app/view_model/controller/register/register_view_model.dart';

class InputPassword2Widget extends StatelessWidget {
  const InputPassword2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final registerVM = Get.put(RegisterViewModel());

    return TextFormField(
      controller: registerVM.password2Controller.value,
      focusNode: registerVM.password2FocusNode.value,
      obscureText: true,
      obscuringCharacter: "*",
      validator: (value) {
        if (value!.isEmpty) {
          Utils.snackBar("password".tr, "empty_password".tr);
        }
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, registerVM.emailFocusNode.value,
            registerVM.password2FocusNode.value);
      },
      decoration: InputDecoration(
          hintText: "confirm_password".tr,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10), // This makes the border rounded
          )),
    );
  }
}
