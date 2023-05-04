import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/auth/sign_in/view/widget/login_bottom_widgets.dart';
import 'package:news_app/screens/auth/sign_in/view/widget/login_botton.dart';
import 'package:news_app/screens/auth/sign_in/view/widget/login_text_form_field_widgets.dart';
import 'package:news_app/screens/auth/sign_in/view/widget/rememberme_widgets.dart';

import '../../../../core/colors.dart';

import '../../../../core/styles.dart';
import '../../../../util/auth_head_text/auth_head_text.dart';

import '../controller/sign_in_controller.dart';

// ignore: must_be_immutable
class ScreenSignIn extends StatelessWidget {
  ScreenSignIn({super.key});
  final formKey = GlobalKey<FormState>();
  double height = Get.height;
  double width = Get.width;
  final signinContoller = Get.put(SignInContoller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: GetBuilder(
            init: signinContoller,
            builder: (controller) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.1,
                        ),
                        const AuthHeadText(
                          text: 'Login',
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                        LoginTextFormFieldWidgets(
                          signinContoller: signinContoller,
                        ),
                        kheight20,
                        RememberMeWidgets(
                          signinContoller: signinContoller,
                        ),
                        kheight20,
                        LoginButton(
                          width: width,
                          height: height,
                          formKey: formKey,
                          signinContoller: signinContoller,
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                        const LoginBottomWidgets(),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
