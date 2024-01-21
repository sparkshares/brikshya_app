// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/resources/components/custom_button.dart';
import 'package:project_app/resources/routes/routes_name.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(36, 36, 36, 1),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: const Text(
                    "Lets plant, 1 more tree",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 196, 184, 184)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 38),
                child: Image.asset("assets/images/onboarding.webp",
                    height: 420, width: 420),
              ),
              CustomButton(
                text: "Get Started",
                onPressed: () {
                  Get.toNamed(RouteName.loginScreen);
                },
              ),
            ],
          ),
        ));
  }
}
