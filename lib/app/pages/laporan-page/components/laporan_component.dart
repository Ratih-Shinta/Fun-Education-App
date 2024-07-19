import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan_component_four.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan_page_component_one.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan_page_component_three.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:get/get.dart';

class LaporanComponent extends GetView<LaporanPageController> {
  const LaporanComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: ListView(
        children: [
          SizedBox(height: 20),
          LaporanPageComponentOne(),
          // LaporanPageComponentTwo(),
          LaporanPageComponentThree(),
          LaporanComponentFour()
        ],
      ),
    );
  }
}
