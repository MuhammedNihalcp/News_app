import 'package:flutter/material.dart';

import '../../../../../core/colors.dart';
import '../../controller/sign_up_controller.dart';

class PolicyAgreeWidgets extends StatelessWidget {
  const PolicyAgreeWidgets({
    super.key,
    required this.signupController,
  });

  final SignUpContoller signupController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: backgroundColor,
          child: Checkbox(
            checkColor: buttoncolor,
            fillColor: MaterialStateProperty.all(colorWhite),
            value: signupController.agree,
            onChanged: (values) {
              signupController.onChanged(values);
            },
          ),
        ),
        RichText(
          text: const TextSpan(
            text: 'I have Agree with ',
            style: TextStyle(
                color: colorWhite, fontWeight: FontWeight.w500, fontSize: 16),
            children: <TextSpan>[
              TextSpan(
                text: 'privacy',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: buttoncolor,
                ),
              ),
              TextSpan(text: ' and '),
              TextSpan(
                text: 'policy',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: buttoncolor,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
