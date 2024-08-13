import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/bottomsheet_pilih_tanggal.dart';
import 'package:fun_education_app/app/pages/transaksi-page/components/bar_chart_container.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class TransaksiComponentOne extends GetView<TransaksiPageController> {
  const TransaksiComponentOne({super.key});

  @override
  Widget build(BuildContext context) {    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/icChart.svg'),
                SizedBox(width: width * 0.02),
                AutoSizeText.rich(
                  TextSpan(
                    text: 'Statistic',
                    style: tsBodyMediumSemibold(blackColor),
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Obx(() {
              return InkWell(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return BottomsheetPilihPeriode(
                        title: 'Pilih Periode',
                        subtitle: 'Pilih Untuk Melihat Riwayat Transaksi',
                        options: ['Bulanan', 'Mingguan'],
                        onOptionSelected: (option) {
                          controller.setSelectedTime(option);
                        },
                        selectedOption: controller.selectedTime,
                      );
                    },
                    isScrollControlled: true,
                    backgroundColor: whiteColor,
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      AutoSizeText.rich(TextSpan(
                          text: controller.selectedTime.value,
                          style: tsBodySmallSemibold(blackColor))),
                      SizedBox(width: 5),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: blackColor,
                      ),
                    ],
                  ),
                ),
              );
            })
          ],
        ),
        BarChartContainer(),
      ],
    );
  }
}
