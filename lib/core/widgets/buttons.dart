import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';
import '../utils/app_styles.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    this.onTap,
    required this.buttonLabel,
    this.height,
    this.btnClr = red,
    this.txtClr = Colors.white,
    this.brdrClr = red,
  });

  String buttonLabel;
  VoidCallback? onTap;
  double? height = 50.0;
  Color btnClr;
  Color txtClr;
  Color brdrClr;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: btnClr,
          border: Border.all(color: brdrClr),
        ),
        child: Center(
          child: Text(
            buttonLabel,
            style: AppStyles.styleSemiBold16
          ),
        ),
      ),
    );
  }
}
