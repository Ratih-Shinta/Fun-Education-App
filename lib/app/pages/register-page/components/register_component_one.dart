import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_text_field.dart';
import 'package:fun_education_app/app/pages/register-page/register_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class RegisterComponentOne extends GetView<RegisterPageController> {
  const RegisterComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;

    return Column(
      children: [
        CommonTextField(
          prefixIcon:
              Icon(Icons.person_outlined, color: greyColor.withOpacity(0.5)),
          fieldController: controller.fullNameController,
          obscureText: false,
          hintText: 'Nama Lengkap',
        ),
        SizedBox(height: height * 0.01),
        CommonTextField(
          prefixIcon:
              Icon(Icons.person_2_outlined, color: greyColor.withOpacity(0.5)),
          fieldController: controller.nicknameController,
          obscureText: false,
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an email address';
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
              return 'Please enter a valid email address';
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
          hintText: 'Tempat, Tanggal Lahir',
        ),
        SizedBox(height: height * 0.01),
        CommonTextField(
          prefixIcon: Icon(Icons.location_on_outlined,
              color: greyColor.withOpacity(0.5)),
          fieldController: controller.addressController,
          obscureText: false,
          hintText: 'Alamat Lengkap',
        ),
        SizedBox(height: height * 0.01),
        DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: height * 0.02,
            ),
            fillColor: whiteColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
          hint: Obx(() => Row(
                children: [
                  Icon(
                      controller.selectedGender.value == 'Laki - laki'
                          ? Icons.male
                          : Icons.female,
                      color: greyColor.withOpacity(0.5)),
                  SizedBox(width: 8),
                  Text(
                      controller.selectedGender.value.isEmpty
                          ? 'Pilih shift'
                          : controller.selectedGender.value,
                      style: tsBodySmallMedium(blackColor)),
                ],
              )),
          items: controller.genderList
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      children: [
                        Icon(
                          controller.selectedGender.value == item
                              ? Icons.male
                              : Icons.female,
                          color: greyColor.withOpacity(0.5),
                        ),
                        SizedBox(width: 8),
                        Text(item, style: tsBodySmallMedium(blackColor)),
                      ],
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Pilih shift';
            }
            return null;
          },
          onChanged: (value) {
            controller.setSelectedGender(value!);
          },
          onSaved: (value) {
            controller.selectedGender.value = value!;
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: blackColor,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ],
    );
  }
}
