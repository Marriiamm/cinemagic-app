import 'package:flutter/material.dart';

import '../../../core/routing/routes.dart';
import '../../../core/utils/app_images.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/buttons.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

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
            image: AssetImage(Assets.imagesStartBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Movie Ticket Booking", style: AppStyles.styleSemiBold28),
              const SizedBox(height: 12),
              Text(
                "Your Cinema, at your fingertips",
                style: AppStyles.styleSemiBold14White.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "Movies made easy: browse, book, enjoy",
                style: AppStyles.styleSemiBold14White.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                buttonLabel: 'Start',
                onTap: () {
                  Navigator.pushNamed(context, Routes.loginScreen);
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
