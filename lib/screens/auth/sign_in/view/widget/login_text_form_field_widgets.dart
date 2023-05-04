import 'package:flutter/material.dart';

import '../../../../../core/styles.dart';
import '../../../../../util/text_form_field_widget/text_form_field_widget.dart';
import '../../controller/sign_in_controller.dart';

class LoginTextFormFieldWidgets extends StatelessWidget {
  const LoginTextFormFieldWidgets({
    super.key,
    required this.signinContoller,
  });

  final SignInContoller signinContoller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldWidget(
          labelText: 'Email',
          keyboardType: TextInputType.emailAddress,
          controller: signinContoller.emailController,
          validator: (username) {
            return signinContoller.usernameValidation(username);
          },
        ),
        kheight20,
        TextFormFieldWidget(
          labelText: 'Password',
          keyboardType: TextInputType.name,
          controller: signinContoller.passwordContorller,
          obscureText: signinContoller.obscureText,
          onPressed: () {
            signinContoller.visibility();
          },
          icon: signinContoller.icon,
          validator: (password) {
            return signinContoller.passwordValdation(password);
          },
        ),
      ],
    );
  }
}
