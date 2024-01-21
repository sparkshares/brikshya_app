import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_app/resources/assets/images_assets.dart';
import 'package:project_app/view_model/services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  SplashServices splashServices = SplashServices();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Duration of animation
      vsync: this,
    )..repeat(reverse: true); // Repeat animation indefinitely

    _animation = Tween<double>(begin: 0.5, end: 2)
        .animate(_controller); // Animate from scale 1 to 2

    splashServices.isLogin();
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Don't forget to dispose the controller when it's no longer needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        body: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.scale(
                scale: _animation.value, // Use the animation value as the scale
                child: child,
              );
            },
            child: Image(
              image: AssetImage(ImageAssets.appLogo),
              height: 100,
            ),
            // child: Text("App",
            //     style: TextStyle(fontSize: 30, color: Colors.white)),
          ),
        ));
  }
}
