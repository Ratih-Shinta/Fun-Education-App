import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_no_data.dart';
import 'package:fun_education_app/app/pages/transaksi-page/components/bottomsheet_pilih_bulan.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_controller.dart';
import 'package:fun_education_app/app/pages/transaksi-page/components/monthly_transactions.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.format_list_bulleted),
                          SizedBox(width: width * 0.02),
                          AutoSizeText.rich(
                            TextSpan(
                              text: 'List Riwayat',
                              style: tsBodyMediumSemibold(blackColor),
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      Obx(
                        () {
                          return InkWell(
                            onTap: () {
                              showModalBottomSheet<void>(
                                context: context,
                                builder: (BuildContext context) {
                                  return BottomSheetPilihBulan();
                                },
                                isScrollControlled: true,
                                backgroundColor: whiteColor,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  AutoSizeText.rich(
                                    TextSpan(
                                      text: controller.selectedMonth.value,
                                      style: tsBodySmallSemibold(blackColor),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: blackColor,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.012),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: width * 0.44,
                                  height: height * 0.2,
                                  decoration: BoxDecoration(
                                      color: greyColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                                Container(
                                  width: width * 0.44,
                                  height: height * 0.2,
                                  decoration: BoxDecoration(
                                      color: greyColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(15)),
                                )
                              ],
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin:
                                      EdgeInsets.only(bottom: height * 0.02),
                                  width: width,
                                  height: height * 0.15,
                                  decoration: BoxDecoration(
                                    color: greyColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    } else if (controller.showCurrentTransaksiModelByMonth
                        .every((item) => item.amount == null)) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: height * 0.15,
                        ),
                        child: Center(
                          child: CommonNoData(
                            title: 'Belum Ada Riwayat',
                            subTitle:
                                'Belum Ada Riwayat Transaksi Di Bulan ${controller.selectedMonth.value}',
                            image: 'assets/images/imgEmpty.svg',
                          ),
                        ),
                      );
                    } else {
                      return MonthlyTransactions();
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
