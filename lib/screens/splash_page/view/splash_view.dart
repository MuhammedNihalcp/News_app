import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/screens/splash_page/controller/splash_controller.dart';

// ignore: must_be_immutable
class ScreenSplash extends StatelessWidget {
  ScreenSplash({super.key});

  SplashController splashController = Get.put(SplashController());
  double height = Get.height;
  double width = Get.width;

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
          ),
          child: Center(
            child: Image(
              width: width * 0.5,
              image: const AssetImage('assets/images/news_app_Icon.png'),
            ),
          ),
        ),
      ),
    );
  }
}
