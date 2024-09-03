import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? fieldController;
  final bool obscureText;
  final Icon? prefixIcon;
  final String hintText;
  final TextInputType? keyboardType;
  final IconButton? suffixIcon;
  final String? Function(String?)? validator;
  final bool? expands;
  final String? errorText;

  CommonTextField(
      {super.key,
      this.fieldController,
      required this.obscureText,
      this.prefixIcon,
      required this.hintText,
      this.keyboardType,
      this.suffixIcon,
      this.validator,
      this.expands,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return TextFormField(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: fieldController,
      keyboardType: keyboardType,
      obscureText: obscureText,
      expands: expands ?? false,
      style: tsBodySmallRegular(blackColor),
      decoration: InputDecoration(
        errorText: errorText,
        contentPadding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width * 0.05,
        ),
        filled: true,
        fillColor: whiteColor,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: transparentColor,
          ),
          borderRadius: defaulBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: defaulBorderRadius,
          borderSide: BorderSide(
            color: blackColor,
            width: 1.5,
          ),
        ),
        hintText: hintText,
        hintStyle: tsBodySmallRegular(
          greyColor.withOpacity(0.5),
        ),
        suffixIcon: suffixIcon,
      ),
      cursorColor: blackColor,
    );
  }
}
