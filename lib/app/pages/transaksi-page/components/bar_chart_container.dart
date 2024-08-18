import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/bar_chart_widgets.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class BarChartContainer extends GetView<TransaksiPageController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: greyColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Obx(
            () {
              return AutoSizeText.rich(
                TextSpan(
                  text: '${controller.selectedTime.value}\n',
                  style: tsBodyMediumSemibold(blackColor).copyWith(height: 1.3),
                  children: [
                    TextSpan(
                        text: 'Perkembangan point ananda',
                        style: tsBodySmallRegular(blackColor)),
                  ],
                ),
                maxLines: 2,
                group: AutoSizeGroup(),
              );
            },
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: successColor,
                  ),
                  SizedBox(width: 5),
                  AutoSizeText.rich(TextSpan(
                      text: 'Pemasukan', style: tsBodySmallRegular(blackColor)))
                ],
              ),
              SizedBox(width: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 7,
                    backgroundColor: dangerColor,
                  ),
                  SizedBox(width: 5),
                  AutoSizeText.rich(TextSpan(
                      text: 'Pengeluaran',
                      style: tsBodySmallRegular(blackColor)))
                ],
              )
            ],
          ),
          SizedBox(height: 30),
          AspectRatio(
              aspectRatio: 1.3,
              child: Obx(
                () {
                  return BarChart(BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: 1000000,
                      gridData: FlGridData(
                        show: false,
                      ),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 48,
                            getTitlesWidget: (value, meta) {
                              if (value == 0)
                                return AutoSizeText(
                                  '0 rb',
                                  style: tsBodySmallRegular(blackColor),
                                );
                              if (value == 200000)
                                return AutoSizeText(
                                  '200 rb',
                                  style: tsBodySmallRegular(blackColor),
                                );
                              if (value == 400000)
                                return AutoSizeText(
                                  '400 rb',
                                  style: tsBodySmallRegular(blackColor),
                                );
                              if (value == 600000)
                                return AutoSizeText(
                                  '600 rb',
                                  style: tsBodySmallRegular(blackColor),
                                );
                              if (value == 800000)
                                return AutoSizeText(
                                  '800 rb',
                                  style: tsBodySmallRegular(blackColor),
                                );
                              if (value == 1000000)
                                return AutoSizeText(
                                  '1 jt',
                                  style: tsBodySmallRegular(blackColor),
                                );
                              return Text('');
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 42, // add margin to push the text up

                            getTitlesWidget:
                                controller.selectedTime.value == 'Mingguan'
                                    ? BarChartWidgets().mingguanTitles
                                    : BarChartWidgets().bulananTitles,
                          ),
                        ),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      ),
                      borderData: FlBorderData(show: false),
                      barGroups: controller.selectedTime.value == 'Mingguan'
                          ? controller.mingguanData
                          : controller.bulananData,
                      barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (_) => blackColor.withOpacity(0.9),
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          BarChartWidgets().getWeekDay(group.x.toInt());

                          String pengeluaranValue =
                              group.barRods[0].toY.toInt().toString();
                          String pemasukanValue =
                              group.barRods[1].toY.toInt().toString();

                          return BarTooltipItem(
                            '${controller.selectedTime.value == 'Mingguan' ? BarChartWidgets().getWeekDay(group.x.toInt()) : BarChartWidgets().getWeekNumber(group.x.toInt())}\n',
                            tsBodySmallSemibold(whiteColor),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Red: $pengeluaranValue\n',
                                  style: tsBodySmallSemibold(dangerColor)),
                              TextSpan(
                                  text: 'Green: $pemasukanValue',
                                  style: tsBodySmallSemibold(successColor)),
                            ],
                          );
                        },
                      ))));
                },
              ))
        ]));
  }
}
