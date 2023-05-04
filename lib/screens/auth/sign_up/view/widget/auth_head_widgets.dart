import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/colors.dart';
import '../../../../../core/styles.dart';
import '../../../../../util/auth_head_text/auth_head_text.dart';

class AuthHeadWidgets extends StatelessWidget {
  const AuthHeadWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: colorWhite,
          ),
        ),
        kwidth15,
        const AuthHeadText(
          text: 'Sign Up',
        ),
      ],
    );
  }
}
