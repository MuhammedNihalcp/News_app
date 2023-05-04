import 'package:flutter/material.dart';

import '../../../../../core/colors.dart';
import '../../controller/sign_in_controller.dart';

class RememberMeWidgets extends StatelessWidget {
  const RememberMeWidgets({
    super.key,
    required this.signinContoller,
  });

  final SignInContoller signinContoller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: backgroundColor,
          child: Checkbox(
            checkColor: buttoncolor,
            fillColor: MaterialStateProperty.all(colorWhite),
            value: signinContoller.agree,
            onChanged: (values) {
              signinContoller.onChanged(values);
            },
          ),
        ),
        const Text(
          'Remember me',
          style: TextStyle(
            color: colorWhite,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
