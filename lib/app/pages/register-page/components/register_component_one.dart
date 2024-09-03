import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
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
          prefixIcon: Icon(Icons.calendar_today_outlined,
              color: greyColor.withOpacity(0.5)),
          fieldController: controller.birthController,
          obscureText: false,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Tempat, Tanggal Lahir tidak boleh kosong';
            }

            final RegExp regex = RegExp(
              r'^[a-zA-Z\s]+, \d{1,2} (januari|februari|maret|april|mei|juni|juli|agustus|september|oktober|november|desember) \d{4}$',
              caseSensitive: false, //allow lowercase and capitalized month
            );

            if (!regex.hasMatch(value)) {
              return 'Format harus: Kota, tanggal bulan tahun';
            }

            try {
              final datePart = value.split(', ')[1];
              final day = int.parse(datePart.split(' ')[0]);
              final month = datePart
                  .split(' ')[1]
                  .toLowerCase(); // convert to lowercase for uniformity

              // Create a map of lowercase month names to numbers
              const monthMap = {
                'januari': 1,
                'februari': 2,
                'maret': 3,
                'april': 4,
                'mei': 5,
                'juni': 6,
                'juli': 7,
                'agustus': 8,
                'september': 9,
                'oktober': 10,
                'november': 11,
                'desember': 12,
              };

              if (!monthMap.containsKey(month)) {
                return 'Bulan tidak valid';
              }

              // check the maximum date 31
              if (day < 1 || day > 31) {
                return 'Hari harus antara 1 dan 31';
              }
            } catch (e) {
              return 'Format tanggal tidak valid';
            }

            return null;
          },
          hintText: 'Tempat, Tanggal Lahir',
        ),
        SizedBox(height: height * 0.005),
        Container(
          width: width,
          child: AutoSizeText(
            'Contoh : Batam, 4 September 2024',
            style: tsLabelLargeMedium(greyColor.withOpacity(0.5)),
            textAlign: TextAlign.left,
          ),
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
