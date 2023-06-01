import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/core/colors.dart';
import 'package:news_app/core/styles.dart';
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
          child: Column(
            children: [
              SizedBox(
                height: height * 0.4,
              ),
              Image(
                width: width * 0.5,
                image: const AssetImage('assets/images/news_app_Icon.png'),
              ),
              const Spacer(),
              const Text(
                'From',
                style: TextStyle(color: colorWhite,fontSize: 15),
              ),
              const Text(
                'MN',
                style: TextStyle(
                  color: colorWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kheight10
            ],
          ),
        ),
      ),
    );
  }
}
