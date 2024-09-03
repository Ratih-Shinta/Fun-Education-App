import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/peringkat-component/peringkat_component_one.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/peringkat-component/peringkat_component_two.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PeringkatComponent extends GetView<LaporanPageController> {
  PeringkatComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller.peringkatRefreshController,
      onRefresh: () async {
        await controller.showStatisticCurrentReport();
        await controller.showLeaderboardWeelky();
        await controller.showLeaderboardMonthly();
        controller.peringkatRefreshController.refreshCompleted();
      },
      header: WaterDropHeader(
        complete: Text(
          'Refresh Completed',
          style: tsBodySmallRegular(blackColor),
        ),
        waterDropColor: primaryColor,
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [PeringkatComponentOne(), PeringkatComponentTwo()],
        ),
      ),
    );
  }
}
