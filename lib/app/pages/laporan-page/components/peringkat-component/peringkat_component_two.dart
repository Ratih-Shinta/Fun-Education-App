import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/bottomsheet_pilih_tanggal.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class PeringkatComponentTwo extends GetView<LaporanPageController> {
  const PeringkatComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/icRanking.svg'),
                SizedBox(width: width * 0.02),
                AutoSizeText.rich(
                  TextSpan(
                    text: 'Peringkat',
                    style: tsBodyMediumSemibold(blackColor),
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            Obx(() => InkWell(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return BottomsheetPilihPeriode(
                          title: 'Pilih Periode',
                          subtitle:
                              'Pilih Untuk Melihat Perkembangan Peringkat',
                          options: ['Bulanan', 'Mingguan'],
                          onOptionSelected: (option) {
                            controller.setSelectedPeriod(option);
                          },
                          selectedOption: controller.selectedPeriod,
                        );
                      },
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
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
                        AutoSizeText.rich(
                          TextSpan(
                              text: controller.selectedPeriod.value,
                              style: tsBodySmallSemibold(blackColor)),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
        SizedBox(height: height * 0.023),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.selectedPeriod.value == 'Mingguan'
              ? controller.leaderboardModelWeekly.length
              : controller.leaderboardModelMonthly.length,
          itemBuilder: (BuildContext context, int index) {
            Color backgroundColor;
            switch (index) {
              case 0:
                backgroundColor = opacity30GoldColor;
                break;
              case 1:
                backgroundColor = opacity50GreyColor;
                break;
              case 2:
                backgroundColor = opacity30BronzeColor;
                break;
              default:
                backgroundColor = opacity5GreyColor;
                break;
            }

            return Obx(
              () {
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: controller.selectedPeriod.value == 'Mingguan'
                        ? (controller.leaderboardModelWeekly[index].isUser ==
                                true
                            ? opacity50SuccessColor
                            : backgroundColor)
                        : (controller.leaderboardModelMonthly[index].isUser ==
                                true
                            ? opacity50SuccessColor
                            : backgroundColor),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText.rich(
                        TextSpan(
                            text:
                                '${controller.selectedPeriod.value == 'Mingguan' ? controller.leaderboardModelWeekly[index].rank : controller.leaderboardModelMonthly[index].rank}    ${controller.selectedPeriod.value == 'Mingguan' ? controller.leaderboardModelWeekly[index].fullName : controller.leaderboardModelMonthly[index].fullName}',
                            style: tsBodySmallSemibold(blackColor)),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: controller.selectedPeriod.value == 'Mingguan'
                              ? (controller.leaderboardModelWeekly[index]
                                          .isUser ==
                                      true
                                  ? successColor
                                  : blackColor)
                              : (controller.leaderboardModelMonthly[index]
                                          .isUser ==
                                      true
                                  ? successColor
                                  : blackColor),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: AutoSizeText.rich(TextSpan(
                            text:
                                '${controller.leaderboardModelWeekly[index].point} Poin',
                            style: tsBodySmallSemibold(whiteColor))),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
