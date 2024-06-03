import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
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
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Get.back();
            },
          ),
          title: AutoSizeText.rich(
            TextSpan(
              text: 'Riwayat Transaksi',
              style: tsBodyLargeSemibold(blackColor),
            ),
          ),
          backgroundColor: backgroundColor,
          centerTitle: true),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.01,
              ),
              child: Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.showCurrentTransaksiModel.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 2.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.toggleExpansion(index);
                            },
                            child: Row(
                              children: [
                                AutoSizeText.rich(
                                  TextSpan(
                                    text: controller.formatDate(controller
                                        .showCurrentTransaksiModel[index].date),
                                    style: tsBodyMediumRegular(blackColor),
                                  ),
                                ),
                                Icon(
                                      controller.isOpen.value
                                          ? Icons.keyboard_arrow_up_rounded
                                          : Icons.keyboard_arrow_down_rounded,
                                    )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )),
        ),
      ),
    );
  }
}
