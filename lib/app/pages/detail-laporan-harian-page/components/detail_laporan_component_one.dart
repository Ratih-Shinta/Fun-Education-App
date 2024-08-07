import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/detail_laporan_harian_controller.dart';
import 'package:fun_education_app/app/pages/detail-laporan-harian-page/widgets/total_point_item.dart';
import 'package:fun_education_app/app/pages/home-page/widgets/icon_point.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailLaporanComponentOne extends GetView<DetailLaporanHarianController> {
  final LaporanPageController laporanPageController =
      Get.put(LaporanPageController());
  DetailLaporanComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText.rich(
          group: AutoSizeGroup(),
          TextSpan(
            text:
                '${DateFormat('EEEE', 'id_ID').format(laporanPageController.selectedDate.value)}, ',
            style: tsBodyLargeSemibold(blackColor).copyWith(
              height: 1.3,
            ),
            children: [
              TextSpan(
                text:
                    '${DateFormat('dd MMMM yyyy', 'id_ID').format(laporanPageController.selectedDate.value)}',
                style: tsBodySmallRegular(blackColor),
              ),
            ],
          ),
          maxLines: 1,
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 20),
          child: TotalPointItem(totalPoint: laporanPageController.showCurrentLaporanHarianResponse!.totalPoint)
        ),
      ],
    );
  }
}
