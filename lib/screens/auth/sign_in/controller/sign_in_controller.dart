import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../core/colors.dart';
import '../../../home/view/home_view.dart';
import '../model/sign_in_model.dart';

class SignInContoller extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordContorller = TextEditingController();

  bool agree = false;

  bool isLoading = false;
  final auth = FirebaseAuth.instance;

  void onChanged(bool? value) {
    agree = value ?? false;
    update();
  }

  void loginUser() async {
    isLoading = true;
    update();
    SignInModel model = SignInModel(
      email: emailController.text.trim(),
      password: passwordContorller.text.trim(),
    );
    try {
      log('try keri');
      await auth.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      log('login cheythu');
      isLoading = false;
      update();
      Get.offAll(() => ScreenHome());
      disposeText();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message.toString(),
        backgroundColor: colorWhite,
        colorText: colorRed,
      );
      isLoading = false;
      update();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: colorWhite,
        colorText: colorRed,
      );
      isLoading = false;
      update();
    }
  }

  void disposeText() {
    emailController.clear();
    passwordContorller.clear();
  }

  String? usernameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else if (value.length < 2) {
      return 'Too short username';
    } else {
      return null;
    }
  }

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value.length > 10) {
      return 'Password exceeds 8 character';
    }
    return null;
  }

  bool obscureText = true;
  Icon icon = const Icon(
    Icons.visibility_off,
    color: colorWhite,
  );

  void visibility() {
    if (obscureText == false) {
      icon = const Icon(
        Icons.visibility_off,
        color: colorWhite,
      );
      obscureText = true;
      update();
    } else {
      icon = const Icon(
        Icons.visibility,
        color: colorWhite,
      );
      obscureText = false;
      update();
    }
  }
}
