import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
   CustomButton({super.key,  this.onTap ,required this.buttonLabel });

  String buttonLabel;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: red
        ),
        child:  Center(
          child: Text(buttonLabel,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'EXO2'
            ),)),
      ),
    );
  }
}