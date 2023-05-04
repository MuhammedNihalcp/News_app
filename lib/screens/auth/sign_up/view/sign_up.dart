import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/screens/auth/sign_up/view/widget/auth_head_widgets.dart';
import 'package:news_app/screens/auth/sign_up/view/widget/bottom_widgets.dart';
import 'package:news_app/screens/auth/sign_up/view/widget/policy_agree_widgets.dart';
import 'package:news_app/screens/auth/sign_up/view/widget/sign_in_botton.dart';
import 'package:news_app/screens/auth/sign_up/view/widget/text_form_field_widgets.dart';

import '../../../../core/colors.dart';

import '../../../../core/styles.dart';
import '../controller/sign_up_controller.dart';

// ignore: must_be_immutable
class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});
  final formKey = GlobalKey<FormState>();
  double width = Get.width;
  double height = Get.height;
  final signupController = Get.put(SignUpContoller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: GetBuilder(
        init: signupController,
        builder: (controller) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    const AuthHeadWidgets(),
                    SizedBox(
                      height: height * 0.1,
                    ),
                    TextFromFieldWidgets(
                      signupController: signupController,
                    ),
                    kheight20,
                    PolicyAgreeWidgets(
                      signupController: signupController,
                    ),
                    kheight20,
                    SignInBotton(
                      width: width,
                      height: height,
                      formKey: formKey,
                      signupController: signupController,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    const BottomWidget()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
