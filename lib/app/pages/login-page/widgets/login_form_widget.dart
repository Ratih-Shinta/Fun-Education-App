import 'package:flutter/material.dart';
import 'package:fun_education_app/common/helper/themes.dart';

class LoginFormWidget extends StatelessWidget {
  final Widget? iconPrefix;
  final Key? formKey;
  final String? hintText;
  final bool? isObsecure;
  final Widget? iconSuffix;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? readOnly;

  LoginFormWidget(
      {Key? key,
      this.iconPrefix,
      this.hintText,
      this.formKey,
      this.validator,
      this.isObsecure,
      this.iconSuffix,
      this.controller,
      this.readOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          child: TextFormField(
            controller: controller,
            obscureText: isObsecure ?? false,
            validator: validator,
            style: tsBodySmallSemibold(blackColor),
            cursorColor: blackColor,
            decoration: InputDecoration(
              isDense: true,
              isCollapsed: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 55,
                minHeight: 25,
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: width * 0.015,
                vertical: height * 0.018,
              ),
              prefixIcon: iconPrefix,
              suffixIcon: Container(
                height: 20,
                width: 20,
                alignment: Alignment.center,
                child: iconSuffix,
              ),
              fillColor: opacityGreyColor,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: hintText,
              border: OutlineInputBorder(
                borderSide: formKey != null &&
                        (formKey as GlobalKey<FormState>)
                                .currentState
                                ?.validate() ==
                            true
                    ? BorderSide.none
                    : BorderSide(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              hintStyle: tsBodySmallRegular(
                greyColor.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
