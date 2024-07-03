import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/bottomsheet_pilih_periode.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'bar_chart_data.dart';
import '../widgets/bar_chart_widgets.dart';

class PeringkatComponent extends GetView<LaporanPageController> {
  PeringkatComponent({Key? key}) : super(key: key);

  final CustomBarChartData barChartData = CustomBarChartData();
  final BarChartWidgets barChartWidgets = BarChartWidgets();

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

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
                        subtitle: 'Point',
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
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: opacity5GreyColor,
          ),
          child: AspectRatio(
            aspectRatio: 1.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Obx(() {
                  return AutoSizeText.rich(
                    TextSpan(
                      text: '${controller.selectedTime.value}\n',
                      style: tsBodyMediumSemibold(blackColor)
                          .copyWith(height: 1.3),
                      children: [
                        TextSpan(
                            text: 'Perkembangan point ananda',
                            style: tsBodySmallRegular(blackColor)),
                      ],
                    ),
                    maxLines: 2,
                    group: AutoSizeGroup(),
                  );
                }),
                SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Obx(
                      () => BarChart(
                        controller.selectedTime.value == 'Mingguan'
                            ? barChartData.mingguanBar()
                            : barChartData.bulananBar(),
                        swapAnimationDuration: controller.animDuration,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
                          subtitle: 'Peringkat',
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
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            Color backgroundColor;
            Color pointColor;
            switch (index) {
              case 0:
                pointColor = successColor;
                backgroundColor = opacity50SuccessColor;
                break;
              case 1:
                pointColor = blackColor;
                backgroundColor = opacity30GoldColor;
                break;
              case 2:
                pointColor = blackColor;

                backgroundColor = opacity30BronzeColor;
                break;
              default:
                pointColor = blackColor;

                backgroundColor = opacity5GreyColor;
                break;
            }

            return Container(
              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText.rich(TextSpan(
                      text: '1   Ratih Shinta',
                      style: tsBodySmallSemibold(blackColor))),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: pointColor,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: AutoSizeText.rich(TextSpan(
                        text: '1230 Poin',
                        style: tsBodySmallSemibold(whiteColor))),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
