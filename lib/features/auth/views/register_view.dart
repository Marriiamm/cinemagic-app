import 'package:flutter/material.dart';

import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/textFields.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Container(
        alignment: Alignment.bottomCenter,
        height: height,
        width: width,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesAuth), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Register",
                    style: AppStyles.styleSemiBold28
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    prefixIcon: Icons.person,
                    hintText: "Name",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    prefixIcon: Icons.mail,
                    hintText: "E-mail",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomTextFormField(
                    prefixIcon: Icons.password_rounded,
                    hintText: "Password",
                  ),
                 
                  const SizedBox(
                    height: 16,
                  ),
                  CustomButton(
                    buttonLabel: 'Register',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        "Already have an account?",
                        style: AppStyles.styleSemiBold14White,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login",
                          style: AppStyles.styleSemiBold14,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}