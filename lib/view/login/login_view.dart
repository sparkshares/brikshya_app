import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/resources/assets/images_assets.dart';
import 'package:project_app/resources/colors/app_color.dart';
import 'package:project_app/resources/routes/routes_name.dart';
import 'package:project_app/view/login/widgets/image_widget.dart';
import 'package:project_app/view/login/widgets/input_email_widget.dart';
import 'package:project_app/view/login/widgets/input_password_widget.dart';
import 'package:project_app/view/login/widgets/login_button_widget.dart';
import 'package:project_app/view_model/controller/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            centerTitle: true,
            title: Text("Login".tr, style: TextStyle(color: Colors.black)),
            automaticallyImplyLeading: false,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            ImageView(),
                            // Text("APP",
                            //     style: TextStyle(
                            //         fontSize: 58, color: AppColor.optColor)),
                            SizedBox(height: 5),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteName.registerScreen);
                              },
                              child: Text("New Here? Register ",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 17)),
                            ),
                            SizedBox(height: 20),
                            InputEmailWidget(),
                            SizedBox(
                              height: 20,
                            ),
                            InputPasswordWidget(),
                          ],
                        )),
                    SizedBox(
                      height: 40,
                    ),
                    LoginButtonWidget(formKey: _formKey),
                  ]),
            ),
          ),
        ));
  }
}
