import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_controller.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/widgets/total_point_item.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class DetailLaporanComponentOne extends GetView<DetailLaporanHarianController> {
  DetailLaporanComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText.rich(
            group: AutoSizeGroup(),
            TextSpan(
              text:
                  '${DateFormat('EEEE', 'id_ID').format(controller.selectedDate.value)}, ',
              style: tsBodyLargeSemibold(blackColor).copyWith(
                height: 1.3,
              ),
              children: [
                TextSpan(
                  text:
                      '${DateFormat('dd MMMM yyyy', 'id_ID').format(controller.selectedDate.value)}',
                  style: tsBodyLargeRegular(blackColor),
                ),
              ],
            ),
            maxLines: 1,
          ),
          Obx(
            () {
              if (controller.isLoading.value) {
                return Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: width,
                    height: height * 0.07,
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    decoration: BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              } else {
                return Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    child:
                        TotalPointItem(totalPoint: controller.userGrade.value));
              }
            },
          )
        ],
      ),
    );
  }
}
