import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/colors.dart';
import '../../../sign_in/view/sign_in_view.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: 'Already have an account?',
            style: const TextStyle(
                color: colorWhite, fontWeight: FontWeight.w500, fontSize: 16),
            children: <TextSpan>[
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Get.to(() => ScreenSignIn()),
                text: '   Sign in',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: buttoncolor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
