import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan-component/laporan_component_four.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan-component/laporan_page_component_one.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan-component/laporan_page_component_three.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan-component/laporan_page_component_two.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class LaporanComponent extends GetView<LaporanPageController> {
  LaporanComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      onRefresh: () async {
        await controller.showCurrentAlurBelajar();
        await controller.showCurrentTugasTerbaru();
        await controller.showCurrentTugasDiperiksa();
        await controller.showCurrentTugasSelesai();
        controller.selectedDate.value = DateTime.now();
        await controller
            .showCurrentLaporanHarian(controller.selectedDate.value);
        controller.update();
        controller.refreshController.refreshCompleted();
      },
      controller: controller.refreshController,
      header: WaterDropHeader(
        complete: Text(
          'Refresh Completed',
          style: tsBodySmallRegular(blackColor),
        ),
        waterDropColor: primaryColor,
      ),
      child: DefaultTabController(
        length: 3,
        child: ListView(
          children: [
            SizedBox(height: 20),
            LaporanPageComponentOne(),
            LaporanPageComponentTwo(),
            LaporanPageComponentThree(),
            LaporanComponentFour()
          ],
        ),
      ),
    );
  }
}
