import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/home/controller/home_news_controller.dart';

import '../../../../core/colors.dart';
import '../../../../core/styles.dart';

class LogoutDialog {
  double width = Get.width;
  double height = Get.height;

  Future<dynamic> logoutDialog(HomeNewsController homeNewsController) {
    return Get.defaultDialog(
      title: 'Tips',
      middleText: 'Conform to logout',
      backgroundColor: buttoncolor,
      titleStyle: const TextStyle(color: colorWhite),
      middleTextStyle: const TextStyle(color: colorBlack),
      confirm: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          fixedSize: MaterialStateProperty.all(
            Size(width * 0.4, height * 0.05),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: () {
          homeNewsController.signout();
        },
        child: const Text(
          'Conform',
          style: buttonStyle,
        ),
      ),
      cancel: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          fixedSize: MaterialStateProperty.all(
            Size(width * 0.4, height * 0.05),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              side: const BorderSide(color: backgroundColor, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: () {
          Get.back();
        },
        child: const Text(
          'Cancel',
          style: buttonStyle,
        ),
      ),
    );
  }
}
