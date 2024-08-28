import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/home-page/home_page_controller.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/header_bottomsheet.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomsheetCatatanDarurat extends GetView<HomePageController> {
  const BottomsheetCatatanDarurat({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return SizedBox(
        height: height * 0.6,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.03, horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderBottomsheet(
                  title: 'Informasi Penting',
                  subtitle: 'Khusus Keadaan Mendesak',
                  color: dangerColor),
              Expanded(
                child: Container(
                    width: width,
                    margin: EdgeInsets.symmetric(vertical: height * 0.03),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: greyColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10)),
                    child: AutoSizeText(
                      '${controller.showLatestCatatanDaruratResponse != null ? controller.showLatestCatatanDaruratModel.value.catatan : 'Tidak Ada Catatan Darurat'}',
                      maxLines: 10,
                      style: tsBodySmallMedium(blackColor),
                    )),
              ),
              CommonButton(
                isLoading: controller.isLoading.value,
                text: 'Tutup',
                onPressed: () => Navigator.pop(context),
                backgroundColor: blackColor,
                textColor: whiteColor,
              )
            ],
          ),
        ));
  }
}
