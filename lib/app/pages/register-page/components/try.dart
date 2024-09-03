import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fun_education_app/app/pages/register-page/register_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class Try extends GetView<RegisterPageController> {
  const Try({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        MyTextField(
          // expand: false,
          // controller: controller.addressController,
          // textInputType: TextInputType.number,
          // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          // hintText: "Enter the maximum discount",
          // name: "Maximum discount",
          validator: (value) {
            if (value!.isEmpty) {
              return "This field cannot be empty";
            }
            return null;
          },
        ),
        MyTextField(
          // expand: false,
          // controller: controller.birthController,
          // textInputType: TextInputType.number,
          // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          // hintText: "Enter the minimum transaction",
          // name: "Minimum transaction",
          validator: (value) {
            if (value!.isEmpty) {
              return "This field cannot be empty";
            }
            return null;
          },
        ),
      ],
    ));
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    // this.controller,
    // required this.hintText,
    // required this.name,
    // this.height,
    // this.obsecureText,
    // this.suffixIcon,
    // this.textInputType,
    // this.onTap,
    // this.readOnly,
    this.validator,
    // this.inputFormatters,
    // this.maxLength,
    // required this.expand,
  });

  // final TextEditingController? controller;
  // final String hintText;
  // final String name;
  // final double? height;
  // final bool? obsecureText;
  // final Widget? suffixIcon;
  // final TextInputType? textInputType;
  // final Function()? onTap;
  // final bool? readOnly;
  final String? Function(String?)? validator;
  // final List<TextInputFormatter>? inputFormatters;
  // final int? maxLength;
  // final bool expand;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   name,
          //   style: tsBodySmallMedium(blackColor),
          //   textAlign: TextAlign.left,
          // ),
          const SizedBox(height: 5),
          TextFormField(
            style: tsBodySmallMedium(blackColor),
            // expands: expand && !obsecureText!,
            // maxLength: maxLength,
            // inputFormatters: inputFormatters,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // readOnly: readOnly ?? false,
            // keyboardType: textInputType,
            // onTap: onTap,
            // obscureText: obsecureText ?? false,
            // maxLines: obsecureText ?? false ? 1 : (expand ? null : 1),
            // minLines: expand ? null : 1,
            // controller: controller,
            decoration: InputDecoration(
              // suffixIcon: suffixIcon,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: primaryColor),
              ),
              // hintText: hintText,
              hintStyle: tsBodySmallMedium(blackColor),
              focusColor: primaryColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: greyColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
