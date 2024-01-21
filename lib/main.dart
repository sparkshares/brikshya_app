// M= MODEL V= VIEWS VM = VIEWMODEL

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:project_app/firebase_options.dart';
import 'package:project_app/resources/localization/languages.dart';
import 'package:project_app/resources/routes/routes.dart';
import 'package:project_app/test.dart';
import 'package:project_app/view/login/login_view.dart';
import 'package:project_app/view/register/register_view.dart';
import 'package:project_app/view/splash_screen/intro.dart';
import 'package:project_app/view/splash_screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Project',
      translations: Langauges(),
      locale: Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      getPages: AppRoutes.appRoutes().toList(),
    );
  }
}
