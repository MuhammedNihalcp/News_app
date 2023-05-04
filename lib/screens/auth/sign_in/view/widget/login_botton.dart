import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/colors.dart';

import '../../../../../core/styles.dart';
import '../../../../../util/circular_indicator_widget/circular_indicator_widget.dart';
import '../../controller/sign_in_controller.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.width,
    required this.height,
    required this.formKey,
    required this.signinContoller,
  });

  final double width;
  final double height;
  final GlobalKey<FormState> formKey;
  final SignInContoller signinContoller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(buttoncolor),
        fixedSize: MaterialStateProperty.all(
          Size(width * 0.8, height * 0.08),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          signinContoller.agree
              ? signinContoller.loginUser()
              : Get.snackbar(
                  '',
                  'Pleas Agree Remember me',
                  colorText: colorBlack,
                  backgroundColor: colorWhite,
                );
        }
      },
      child: signinContoller.isLoading == true
          ? const CircularIndicatorWidget()
          : const Text(
              'Login',
              style: authButtonTextStyle,
            ),
    );
  }
}
