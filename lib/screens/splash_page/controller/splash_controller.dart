import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/auth/sign_in/view/sign_in_view.dart';
import 'package:news_app/screens/home/view/home_view.dart';

class SplashController extends GetxController {
  void splashTimer() {
    Timer(const Duration(seconds: 3), () async {
      if (FirebaseAuth.instance.currentUser != null) {
        Get.offAll(() => ScreenHome());
      } else {
        Get.offAll(() => ScreenSignIn()); 
      }
    });
  }
}
