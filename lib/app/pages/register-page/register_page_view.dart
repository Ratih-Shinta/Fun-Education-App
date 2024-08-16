import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/global-component/common_text_field.dart';
import 'package:fun_education_app/app/global-component/common_warning.dart';
import 'package:fun_education_app/app/pages/register-page/register_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';

class RegisterPageView extends GetView<RegisterPageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.03,
              horizontal: width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/icLogo.svg',
                      width: width * 0.08,
                    ),
                    SizedBox(width: width * 0.01),
                    AutoSizeText(
                      'Fun Education',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodyLargeSemibold(primaryColor),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.06),
                AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  textAlign: TextAlign.left,
                  TextSpan(
                    text: 'Daftarkan Data Anak di\n',
                    style: tsTitleSmallRegular(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Fun Education',
                        style: tsTitleSmallSemibold(blackColor),
                      ),
                    ],
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: height * 0.03),
                Column(
                  children: [
                    CommonTextField(
                      prefixIcon: Icon(Icons.person_2_outlined,
                          color: greyColor.withOpacity(0.5)),
                      fieldController: controller.fullNameController,
                      obscureText: false,
                      hintText: 'Nama Lengkap',
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: height * 0.01),
                    CommonTextField(
                      prefixIcon: Icon(Icons.person_2_outlined,
                          color: greyColor.withOpacity(0.5)),
                      fieldController: controller.nicknameController,
                      obscureText: false,
                      hintText: 'Nama Panggilan',
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: height * 0.01),
                    CommonTextField(
                      prefixIcon: Icon(Icons.calendar_today_outlined,
                          color: greyColor.withOpacity(0.5)),
                      fieldController: controller.birthController,
                      obscureText: false,
                      hintText: 'Tempat, Tanggal Lahir',
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: height * 0.01),
                    CommonTextField(
                      prefixIcon: Icon(Icons.location_on_outlined,
                          color: greyColor.withOpacity(0.5)),
                      fieldController: controller.addressController,
                      obscureText: false,
                      hintText: 'Alamat Lengkap',
                      keyboardType: TextInputType.name,
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
                              Icon(Icons.access_time_outlined,
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
                                    Icon(Icons.access_time_outlined,
                                        color: greyColor.withOpacity(0.5)),
                                    SizedBox(width: 8),
                                    Text(item,
                                        style: tsBodySmallMedium(blackColor)),
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
                ),
                SizedBox(height: height * 0.03),
                Column(
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
                      text:
                          'Pastikan shift masuk telah dikonfirmasikan oleh guru',
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
                                    Text('Jam $item',
                                        style: tsBodySmallMedium(blackColor)),
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
                ),
                SizedBox(height: height * 0.14),
                CommonButton(
                  isLoading: controller.isLoading.value,
                  text: 'Lanjut',
                  backgroundColor: blackColor,
                  textColor: whiteColor,
                  onPressed: () {
                    controller.saveRegisterValue();
                    Get.toNamed(Routes.PASSWORD_PAGE);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
