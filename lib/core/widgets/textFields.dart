import 'package:flutter/material.dart';

import '../../../core/utils/constants.dart';
import '../utils/app_styles.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  String hintText;
  String? labelText;
  IconData? prefixIcon;
  bool? obscureText;
  final bool hasBorder;
  final TextAlign hintTextAlign;
  Function(String)? onChange;
  TextEditingController? controller;
  CustomTextFormField({
    super.key,
    required this.hintText,
    this.labelText,
    this.prefixIcon,
    this.onChange,
    this.controller,
    this.hasBorder = true,
    this.hintTextAlign = TextAlign.start,
    this.obscureText = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required!';
        }
        return '';
      },
      onChanged: widget.onChange,
      style: const TextStyle(color: Colors.white),
      textAlign: widget.hintTextAlign,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon, color: Colors.white, size: 20),
        fillColor: Colors.black38,
        filled: true,
        errorStyle: TextStyle(color: Colors.black.withOpacity(0.8)),
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.black, fontFamily: 'Exo2'),
        hintText: widget.hintText,

        hintStyle: AppStyles.styleSemiBold14White,
        border:
            widget.hasBorder
                ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: red, width: 2.0),
                )
                : InputBorder.none,
        enabledBorder:
            widget.hasBorder
                ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(color: red, width: 2.0),
                )
                : InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(color: red, width: 3.0),
        ),
      ),
    );
  }
}
