import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_controller.dart';
import 'package:fun_education_app/app/pages/saving-page/widgets/custom_radio_button.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetAjukanPengeluaran extends GetView<SavingController> {
  BottomsheetAjukanPengeluaran({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return SizedBox(
      height: height * 0.5,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: height * 0.03,
            horizontal: width * 0.06,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: height * 0.01),
                    width: width * 0.15,
                    height: height * 0.008,
                    decoration: BoxDecoration(
                      color: opacity20GreyColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: width * 0.02),
                        width: width * 0.016,
                        height: height * 0.05,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      AutoSizeText.rich(
                        TextSpan(
                          text: 'Ajukan Pengeluaran Tabungan\n',
                          style: tsBodyMediumSemibold(blackColor).copyWith(
                            height: 1.3,
                          ),
                          children: [
                            TextSpan(
                              text: 'Pilih Pengeluaran Tabungan',
                              style: tsBodySmallRegular(blackColor),
                            ),
                          ],
                        ),
                        maxLines: 2,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Obx(() => CustomRadioButton(
                        title: 'SPP Bulanan',
                        subtitle: 'Saldo Minimal Rp. 100.000',
                        icon: iconSPP,
                        value: 'SPP Bulanan',
                        groupValue: controller.selectedOption.value,
                        onChanged: (value) => controller.selectOption(value),
                      )),
                  Obx(() => CustomRadioButton(
                        title: 'Kegiatan Belajar Diluar',
                        subtitle: 'Saldo Minimal Rp. 100.000',
                        icon: iconTravelCase,
                        value: 'Kegiatan Belajar Diluar',
                        groupValue: controller.selectedOption.value,
                        onChanged: (value) => controller.selectOption(value),
                      )),
                ],
              ),
              CommonButton(text: 'Ajukan', color: primaryColor)
            ],
          ),
        ),
      ),
    );
  }
}
