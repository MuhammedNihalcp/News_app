import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/colors.dart';
import '../../../../../core/styles.dart';
import '../../../../../util/circular_indicator_widget/circular_indicator_widget.dart';
import '../../controller/sign_up_controller.dart';

class SignInBotton extends StatelessWidget {
  const SignInBotton({
    super.key,
    required this.width,
    required this.height,
    required this.formKey,
    required this.signupController,
  });

  final double width;
  final double height;
  final GlobalKey<FormState> formKey;
  final SignUpContoller signupController;

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
          signupController.agree
              ? signupController.addUser()
              : Get.snackbar(
                  '',
                  'Please Agree the privacy and policy',
                  colorText: colorBlack,
                  backgroundColor: colorWhite,
                );
        }
      },
      child: signupController.isLoading == true
          ? const CircularIndicatorWidget()
          : const Text(
              'Sign Up',
              style: authButtonTextStyle,
            ),
    );
  }
}
