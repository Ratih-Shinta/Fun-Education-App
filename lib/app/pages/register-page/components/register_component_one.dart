import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_text_field.dart';
import 'package:fun_education_app/app/pages/register-page/register_page_controller.dart';
import 'package:fun_education_app/app/pages/register-page/widgets/gender_drowpdown.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class RegisterComponentOne extends GetView<RegisterPageController> {
  const RegisterComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      children: [
        CommonTextField(
          prefixIcon:
              Icon(Icons.person_outlined, color: greyColor.withOpacity(0.5)),
          fieldController: controller.fullNameController,
          obscureText: false,
          validator: (value) {
            if (value!.isEmpty) {
              return "Nama Lengkap tidak boleh kosong";
            }
            return null;
          },
          hintText: 'Nama Lengkap',
        ),
        SizedBox(height: height * 0.01),
        CommonTextField(
          prefixIcon:
              Icon(Icons.person_2_outlined, color: greyColor.withOpacity(0.5)),
          fieldController: controller.nicknameController,
          obscureText: false,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Nama Panggilan tidak boleh kosong';
            }
            return null;
          },
          hintText: 'Nama Panggilan',
        ),
        SizedBox(height: height * 0.01),
        CommonTextField(
          fieldController: controller.emailController,
          prefixIcon:
              Icon(Icons.mail_outlined, color: greyColor.withOpacity(0.5)),
          obscureText: false,
          hintText: 'Email',
          keyboardType: TextInputType.emailAddress,
          errorText: controller.emailError.value.isNotEmpty
              ? controller.emailError.value
              : null,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email tidak boleh kosong';
            }
            final emailRegex = RegExp(
                r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');
            if (!emailRegex.hasMatch(value)) {
              return 'Email tidak valid';
            }
            if (controller.emailError.value == "Email sudah terdaftar") {
              return controller.emailError.value;
            }
            return null;
          },
        ),
        SizedBox(height: height * 0.01),
        CommonTextField(
          prefixIcon: Icon(Icons.location_on_outlined,
              color: greyColor.withOpacity(0.5)),
          fieldController: controller.birthController,
          obscureText: false,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Tempat Lahir tidak boleh kosong';
            }
            return null;
          },
          hintText: 'Tempat Lahir',
        ),
        SizedBox(height: height * 0.01),
        CommonTextField(
          prefixIcon: Icon(Icons.calendar_today_outlined,
              color: greyColor.withOpacity(0.5)),
          readOnly: true,
          fieldController: controller.dateBirthController,
          obscureText: false,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Tanggal Lahir tidak boleh kosong';
            }
            return null;
          },
          onTap: () => controller.selectedDateOfBirth(context),
          hintText: 'Tanggal Lahir',
        ),
        SizedBox(height: height * 0.01),
        CommonTextField(
          prefixIcon: Icon(Icons.location_on_outlined,
              color: greyColor.withOpacity(0.5)),
          fieldController: controller.addressController,
          obscureText: false,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Alamat tidak boleh kosong';
            }
            return null;
          },
          hintText: 'Alamat Lengkap',
        ),
        SizedBox(height: height * 0.005),
        Container(
          width: width,
          child: AutoSizeText(
            'Contoh : Griya Batu Aji Ari Blok G1, No 06',
            style: tsLabelLargeMedium(greyColor.withOpacity(0.5)),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: height * 0.01),
        GenderDrowpdown()
      ],
    );
  }
}
