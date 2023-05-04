import 'package:flutter/material.dart';

import '../../../../../core/styles.dart';
import '../../../../../util/text_form_field_widget/text_form_field_widget.dart';
import '../../controller/sign_up_controller.dart';

class TextFromFieldWidgets extends StatelessWidget {
  const TextFromFieldWidgets({
    super.key,
    required this.signupController,
  });

  final SignUpContoller signupController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormFieldWidget(
          controller: signupController.usernameController,
          validator: (name) {
            return signupController.usernameValidation(name);
          },
          labelText: 'UserName',
          keyboardType: TextInputType.name,
        ),
        kheight20,
        TextFormFieldWidget(
          labelText: 'Email',
          keyboardType: TextInputType.emailAddress,
          controller: signupController.emailcontroller,
          validator: (email) {
            return signupController.emailValdation(email);
          },
        ),
        kheight20,
        TextFormFieldWidget(
          labelText: 'Password',
          keyboardType: TextInputType.name,
          controller: signupController.passwordcontroller,
          obscureText: signupController.obscureText,
          onPressed: () {
            signupController.visibility();
          },
          icon: signupController.icon,
          validator: (password) {
            return signupController.passwordValdation(password);
          },
        ),
        kheight20,
        TextFormFieldWidget(
          labelText: 'Conform Password',
          keyboardType: TextInputType.name,
          controller: signupController.conformpasswordcontroller,
          obscureText: signupController.obscureText,
          validator: (conformpassword) {
            return signupController.confirmpasswordValdation(conformpassword);
          },
        ),
      ],
    );
  }
}
