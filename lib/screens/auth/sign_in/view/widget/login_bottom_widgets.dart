import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/colors.dart';
import '../../../sign_up/view/sign_up.dart';

class LoginBottomWidgets extends StatelessWidget {
  const LoginBottomWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Don't have an account?",
        style: const TextStyle(
            color: colorWhite, fontWeight: FontWeight.w500, fontSize: 16),
        children: <TextSpan>[
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () => Get.to(() => ScreenSignUp()),
            text: '   Sign Up',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: buttoncolor,
            ),
          ),
        ],
      ),
    );
  }
}
