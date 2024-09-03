import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan-component/laporan_page_component_four.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan-component/laporan_page_component_one.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan-component/laporan_page_component_three.dart';
import 'package:fun_education_app/app/pages/laporan-page/components/laporan-component/laporan_page_component_two.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:get/get.dart';

class LaporanComponent extends GetView<LaporanPageController> {
  LaporanComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;

    return DefaultTabController(
      length: 3,
      child: ListView(
        children: [
          SizedBox(height: 20),
          LaporanPageComponentOne(),
          SizedBox(height: height * 0.02),
          LaporanPageComponentTwo(),
          SizedBox(height: height * 0.03),
          LaporanPageComponentThree(),
          LaporanPageComponentFour()
        ],
      ),
    );
  }
}
