import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_warning.dart';
import 'package:fun_education_app/app/pages/register-page/register_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class RegisterComponentTwo extends GetView<RegisterPageController> {
  const RegisterComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Shift Masuk',
          style: tsBodyMediumSemibold(blackColor),
        ),
        SizedBox(height: height * 0.01),
        CommonWarning(
          icon: Icons.info_outline_rounded,
          backColor: warningColor,
          text: 'Pastikan shift masuk telah dikonfirmasikan oleh guru',
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
                    Icons.access_time_outlined,
                    color: greyColor,
                  ),
                  SizedBox(width: 8),
                  Text(
                      controller.selectedShift.value.isEmpty
                          ? 'Pilih shift'
                          : 'Jam ${controller.selectedShift.value}',
                      style: tsBodySmallMedium(blackColor)),
                ],
              )),
          items: controller.shiftList
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Row(
                      children: [
                        Icon(
                          Icons.access_time_outlined,
                          color: greyColor,
                        ),
                        SizedBox(width: 8),
                        Text('Jam $item', style: tsBodySmallMedium(blackColor)),
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
            controller.setSelectedShift(value!);
          },
          onSaved: (value) {
            controller.selectedShift.value = value!;
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
