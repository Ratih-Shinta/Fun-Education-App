import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/peringkat-component/peringkat_component_one.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/peringkat-component/peringkat_component_two.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:get/get.dart';

class PeringkatComponent extends GetView<LaporanPageController> {
  PeringkatComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await controller.showStatisticCurrentLaporanUser();
        await controller.showLeaderboardMonthly();
        await controller.showLeaderboardWeelky();
        controller.update();
      },
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [PeringkatComponentOne(), PeringkatComponentTwo()],
        ),
      ),
    );
  }
}
