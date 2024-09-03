import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/register-page/register_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class GenderDrowpdown extends GetView<RegisterPageController> {
  const GenderDrowpdown({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;

    return DropdownButtonFormField2<String>(
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
    );
  }
}
