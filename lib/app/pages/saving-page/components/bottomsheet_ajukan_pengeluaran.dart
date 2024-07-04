import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_controller.dart';
import 'package:fun_education_app/app/pages/saving-page/widgets/custom_radio_button.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/header_bottomsheet.dart';
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
      height: height * 0.41,
      child: Center(
        child: Obx(() {
          if (controller.showCurrentMinimumPengajuanModel.isEmpty) {
            return Text('No data available');
          }

          return Container(
            decoration: BoxDecoration(
              color: whiteColor,
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
                HeaderBottomsheet(title: 'Ajukan Pengeluaran Tabungan', subtitle: 'Pilih Pengeluaran Tabungan', color: primaryColor),
                Obx(
                  () {
                    return Column(
                      children: [
                        if (controller.showCurrentMinimumPengajuanModel.length >
                            0)
                          CustomRadioButton(
                            title: 'SPP Bulanan',
                            subtitle:
                                'Saldo Minimal Rp.  ${controller.showCurrentMinimumPengajuanModel[0].minimum}',
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
                                : dangerColor),
                          ),
                        SizedBox(height: height * 0.02),
                        if (controller.showCurrentMinimumPengajuanModel.length >
                            1)
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
                                : dangerColor),
                          ),
                      ],
                    );
                  },
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
                              color: blackColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Ajukan',
                              style: tsBodyMediumSemibold(whiteColor),
                            ),
                          ),
                        )
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
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
