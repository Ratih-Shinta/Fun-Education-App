import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/saving-page/components/saving_page_component_one.dart';
import 'package:fun_education_app/app/pages/saving-page/components/saving_page_component_two.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_controller.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class SavingPageView extends GetView<SavingPageController> {
  final TransaksiPageController transaksiPageController =
      Get.put(TransaksiPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        body: RefreshIndicator(
          onRefresh: () async {
            await controller.showCurrentTabungan();
            await controller.currentPengajuanTabungan();
            await transaksiPageController.showCurrentTransaksi();
            controller.update();
          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [SavingPageComponentOne(), SavingPageComponentTwo()],
            ),
          ),
        ));
  }
}
