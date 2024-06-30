import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/saving-page/components/bottomsheet_ajukan_pengeluaran.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class AjukanPengeluaranContainer extends GetView<SavingPageController> {
  const AjukanPengeluaranContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.025,
        horizontal: width * 0.05,
      ),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText.rich(
            textAlign: TextAlign.start,
            TextSpan(
              text: 'Ajukan PengeluaranTabungan?\n',
              style: tsBodyMediumSemibold(blackColor).copyWith(
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text: 'Pastikan Saldo Mencukupi',
                  style: tsBodySmallRegular(blackColor),
                ),
              ],
            ),
            maxLines: 2,
          ),
          SizedBox(height: height * 0.03),
          Obx(() {
            if (controller.status.value == 'Gagal') {
              return Text('gagal');
            } else if (controller.status.value == 'Diterima') {
              return Text('diterima');
            } else if (controller.status.value == 'Diajukan') {
              return Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: opacity5GreyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText.rich(TextSpan(
                        text: 'Tabungan sedang diajukan untuk :',
                        style: tsBodySmallRegular(blackColor))),
                    SizedBox(height: height * 0.013),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: AutoSizeText.rich(
                            TextSpan(
                                text: 'Kegiatan Belajar Diluar',
                                style: tsBodyMediumSemibold(blackColor)),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                            color: warningColor,
                            borderRadius: BorderRadius.circular(29),
                          ),
                          child: AutoSizeText.rich(TextSpan(
                              text: 'Diajukan',
                              style: tsBodySmallSemibold(whiteColor))),
                        )
                      ],
                    )
                  ],
                ),
              );
            } else {
              return InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomsheetAjukanPengeluaran();
                    },
                    isScrollControlled: true,
                    backgroundColor: whiteColor,
                  );
                  },
                  child: Row(
                    children: [
                      AutoSizeText.rich(TextSpan(
                          text: 'Pilih Pengeluaran',
                          style: tsBodySmallSemibold(blackColor))),
                      Icon(
                        Icons.navigate_next,
                        color: blackColor,
                        size: 18,
                      )
                    ],
                  ));
            }
          })
        ],
      ),
    );
  }
}
