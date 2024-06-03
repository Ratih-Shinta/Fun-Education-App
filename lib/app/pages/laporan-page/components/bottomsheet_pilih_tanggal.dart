import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/detail-laporan-bulanan-page/detail_laporan_bulanan_controller.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomSheetPilihTanggal extends GetView<LaporanPageController> {
  final DetailLaporanBulananController detailLaporanBulananController =
      Get.put(DetailLaporanBulananController());

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SizedBox(
      height: height * 0.5,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.05,
        ),
        child: Column(
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
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: width * 0.02),
                  width: width * 0.016,
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                AutoSizeText.rich(
                  group: AutoSizeGroup(),
                  maxLines: 2,
                  TextSpan(
                    text: 'Pilih Tanggal\n',
                    style: tsBodyMediumSemibold(blackColor).copyWith(
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: 'Pilih tanggal untuk melihat riwayat',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.03),
            Expanded(
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (DateTime value) {
                  detailLaporanBulananController.selectedMonth.value =
                      value.month;
                },
              ),
            ),
            SizedBox(height: height * 0.03),
            CommonButton(
              text: 'Lihat Laporan',
              onPressed: () {
                print(
                    'selected month: ${detailLaporanBulananController.selectedMonth.value}');
                print(detailLaporanBulananController
                    .showCurrentLaporanBulananModel.value
                    .toJson());
                detailLaporanBulananController
                    .showCurrentDetailLaporanBulanan();
              },
              color: secondaryColor,
            )
          ],
        ),
      ),
    );
  }
}