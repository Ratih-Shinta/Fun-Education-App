import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_controller.dart';
import 'package:fun_education_app/app/pages/saving-page/widgets/custom_radio_button.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetAjukanPengeluaran extends GetView<SavingPageController> {
  BottomsheetAjukanPengeluaran({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return SizedBox(
      height: height * 0.5,
      child: Center(
        child: Obx(() => Container(
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
                      CustomRadioButton(
                        title: 'SPP Bulanan',
                        subtitle:
                            'Saldo Minimal Rp. ${controller.showCurrentMinimumPengajuanModel[0].minimum}',
                        icon: iconSPP,
                        value: 'SPP Bulanan',
                        groupValue: controller.selectedOption.value,
                        onChanged: (value) =>
                            controller.selectedCategory(value),
                        style: tsBodySmallRegular(controller
                                    .showCurrentMinimumPengajuanModel[0]
                                    .isEnough ==
                                true
                            ? greenColor
                            : primaryColor),
                      ),
                      CustomRadioButton(
                        title: 'Kegiatan Belajar Diluar',
                        subtitle:
                            'Saldo Minimal Rp. ${controller.showCurrentMinimumPengajuanModel[1].minimum}',
                        icon: iconTravelCase,
                        value: 'Kegiatan Belajar Diluar',
                        groupValue: controller.selectedOption.value,
                        onChanged: (value) =>
                            controller.selectedCategory(value),
                        style: tsBodySmallRegular(controller
                                    .showCurrentMinimumPengajuanModel[1]
                                    .isEnough ==
                                true
                            ? greenColor
                            : primaryColor),
                      )
                    ],
                  ),
                  Obx(
                    () => controller.selectedCategoryIsEnough() == true
                        ? GestureDetector(
                            onTap: () => controller.pengajuanTabungan(),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              width: width,
                              height: height * 0.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Ajukan',
                                style: tsBodyMediumSemibold(whiteColor),
                              ),
                            ))
                        : GestureDetector(
                            onTap: () => Get.snackbar('Pengajuan Gagal',
                                'Saldo Tabungan Anda Tidak Mencukupi'),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              width: width,
                              height: height * 0.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: opacity50GreyColor,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Ajukan',
                                style: tsBodyMediumSemibold(whiteColor),
                              ),
                            ),
                          ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
