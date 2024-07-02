import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class MingguanBarChart extends GetView<TransaksiPageController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: opacity5GreyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AutoSizeText.rich(
            TextSpan(
              text: 'Mingguan\n',
              style: tsBodyMediumSemibold(blackColor).copyWith(height: 1.3),
              children: [
                TextSpan(
                    text: 'Perkembangan point ananda',
                    style: tsBodySmallRegular(blackColor)),
              ],
            ),
            maxLines: 2,
            group: AutoSizeGroup(),
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
              child: BarChart(BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 1000,
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
                          if (value == 200)
                            return AutoSizeText(
                              '200 rb',
                              style: tsBodySmallRegular(blackColor),
                            );
                          if (value == 400)
                            return AutoSizeText(
                              '400 rb',
                              style: tsBodySmallRegular(blackColor),
                            );
                          if (value == 600)
                            return AutoSizeText(
                              '600 rb',
                              style: tsBodySmallRegular(blackColor),
                            );
                          if (value == 800)
                            return AutoSizeText(
                              '800 rb',
                              style: tsBodySmallRegular(blackColor),
                            );
                          if (value == 1000)
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
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return AutoSizeText(
                                'S',
                                style: tsBodyMediumSemibold(blackColor),
                              );
                            case 1:
                              return AutoSizeText(
                                'S',
                                style: tsBodyMediumSemibold(blackColor),
                              );
                            case 2:
                              return AutoSizeText(
                                'R',
                                style: tsBodyMediumSemibold(blackColor),
                              );
                            case 3:
                              return AutoSizeText(
                                'K',
                                style: tsBodyMediumSemibold(blackColor),
                              );
                            case 4:
                              return AutoSizeText(
                                'J',
                                style: tsBodyMediumSemibold(blackColor),
                              );
                            case 5:
                              return AutoSizeText(
                                'S',
                                style: tsBodyMediumSemibold(blackColor),
                              );
                            case 6:
                              return AutoSizeText(
                                'M',
                                style: tsBodyMediumSemibold(blackColor),
                              );
                            default:
                              return Text('');
                          }
                        },
                      ),
                    ),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: controller.barGroups,
                  barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (_) => backgroundColor,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      String label;
                      switch (group.x.toInt()) {
                        case 0:
                          label = 'Senin';
                          break;
                        case 1:
                          label = 'Selasa';
                          break;
                        case 2:
                          label = 'Rabu';
                          break;
                        case 3:
                          label = 'Kamis';
                          break;
                        case 4:
                          label = 'Jumat';
                          break;
                        case 5:
                          label = 'Sabtu';
                          break;
                        case 6:
                          label = 'Minggu';
                          break;
                        default:
                          label = '';
                      }

                      String pengeluaranValue =
                          group.barRods[0].toY.toInt().toString();
                      String pemasukanValue =
                          group.barRods[1].toY.toInt().toString();

                      return BarTooltipItem(
                        '$label\n',
                        tsBodySmallSemibold(blackColor),
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
                  )))))
        ]));
  }
}
