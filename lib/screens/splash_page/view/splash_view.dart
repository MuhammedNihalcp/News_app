import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/screens/splash_page/controller/splash_controller.dart';

class ScreenSplash extends StatelessWidget {
  ScreenSplash({super.key});

  SplashController splashController = Get.put(SplashController());
  double height = Get.height;

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      splashController.splashTimer();
    });
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: height,
          decoration: const BoxDecoration(
            color: backgroundColor,
            // gradient: LinearGradient(
            //   begin: Alignment.topCenter,
            //   end: Alignment.bottomCenter,
            //   colors: [backgroundColor, buttoncolor],
            // ),
          ),
          child: const Center(
            child: Image(
              image: AssetImage('assets/images/news_app_Icon.png'),
            ),
          ),
        ),
      ),
    );
  }
}
