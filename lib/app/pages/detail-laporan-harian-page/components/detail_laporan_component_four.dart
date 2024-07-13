import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailLaporanComponentFour
    extends GetView<DetailLaporanHarianController> {
  const DetailLaporanComponentFour({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText.rich(
          TextSpan(
            text: 'Catatan Guru :',
            style: tsBodyMediumSemibold(blackColor),
          ),
        ),
        Container(
            width: width,
            margin: EdgeInsets.only(top: 10, bottom: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: opacity5GreyColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Obx(() {
              if (controller.showCurrentLaporanHarianModel.value
                      .berbuatBaikDenganTeman ==
                  null) {
                return AutoSizeText.rich(
                  TextSpan(
                    text: 'Tidak ada catatan',
                    style: tsBodySmallRegular(blackColor),
                  ),
                );
              } else {
                return AutoSizeText.rich(
                  TextSpan(
                    text:
                        'Untuk saat ini ananda masuk pada pukul 08.00 - 10.00, Shift masuk akan berganti sesuai dengan perkembangan anak. Untuk saat ini ananda masuk pada pukul 08.00 - 10.00, Shift masuk akan berganti sesuai dengan perkembangan anak.',
                    style: tsBodySmallRegular(blackColor),
                  ),
                );
              }
            })),
      ],
    );
  }
}
