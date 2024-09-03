import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class DetailLaporanComponentFour
    extends GetView<DetailLaporanHarianController> {
  DetailLaporanComponentFour({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText.rich(
          TextSpan(
            text: 'Catatan Guru :',
            style: tsBodyMediumSemibold(blackColor),
          ),
        ),
        Obx(
          () {
            if (controller.isLoading.value) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  width: width,
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    color: greyColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            } else {
              return Container(
                width: width,
                margin: const EdgeInsets.only(top: 10, bottom: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: greyColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(() {
                  if (controller.userNote.isEmpty) {
                    return AutoSizeText(
                      'Tidak Ada Catatan',
                      style: tsBodySmallRegular(blackColor),
                    );
                  } else {
                    return AutoSizeText.rich(
                      TextSpan(
                        text: controller.userNote.value,
                        style: tsBodySmallRegular(blackColor),
                      ),
                    );
                  }
                }),
              );
            }
          },
        )
      ],
    );
  }
}
