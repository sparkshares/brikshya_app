import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/resources/assets/images_assets.dart';
import 'package:project_app/view/login/widgets/image_widget.dart';
import 'package:project_app/view/register/widgets/input_email_widget.dart';
import 'package:project_app/view/register/widgets/input_password2_widget.dart';
import 'package:project_app/view/register/widgets/input_password_widget.dart';
import 'package:project_app/view/register/widgets/input_username_widget.dart';
import 'package:project_app/view/register/widgets/register_button_widget.dart';
import 'package:project_app/view_model/controller/register/register_view_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final loginVM = Get.put(RegisterViewModel());

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        //automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            SizedBox(height: 40),
            ImageView(),
            // Text("Register", style: TextStyle(fontSize: 58)),
            SizedBox(height: 20),
            Form(
                key: _formKey,
                child: Column(children: [
                  InputEmailWidget(),
                  SizedBox(height: 20),
                  InputUsernameWidget(),
                  SizedBox(height: 20),
                  InputPasswordWidget(),
                  SizedBox(height: 20),
                  InputPassword2Widget(),
                ])),
            SizedBox(height: 40),
            RegisterButtonWidget(formKey: _formKey),
          ]),
        ),
      ),
    );
  }
}
