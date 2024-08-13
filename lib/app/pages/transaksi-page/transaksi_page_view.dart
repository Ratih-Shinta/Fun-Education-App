import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/transaksi-page/components/transaksi_component_two.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class TransaksiPageView extends GetView<TransaksiPageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, size: 15),
          onPressed: () {
            Get.back();
          },
        ),
        title: AutoSizeText.rich(
          TextSpan(
            text: 'Riwayat Transaksi',
            style: tsBodyMediumSemibold(blackColor),
          ),
        ),
        backgroundColor: backgroundColor,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.showCurrentTransaksiByMonth();
          controller.update();
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.01,
              ),
              child: Column(
                children: [
                  // TransaksiComponentOne(),
                  TransaksiComponentTwo()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
