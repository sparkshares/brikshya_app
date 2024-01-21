import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project_app/utils/utils.dart';
import 'package:project_app/view_model/controller/register/register_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  const InputEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final registerVM = Get.put(RegisterViewModel());
    return TextFormField(
      controller: registerVM.emailController.value,
      focusNode: registerVM.emailFocusNode.value,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is required';
        }
        return null;
      },
      onFieldSubmitted: (value) {
        Utils.fieldFocusChange(context, registerVM.emailFocusNode.value,
            registerVM.passwordFocusNode.value);
      },
      decoration: InputDecoration(
          hintText: "email_hint".tr,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10), // This makes the border rounded
          )),
    );
  }
}
