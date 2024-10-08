import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_no_data.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_controller.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/transaction_history.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class SavingPageComponentTwo extends GetView<SavingPageController> {
  SavingPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.03,
        horizontal: width * 0.05,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText.rich(
                TextSpan(
                    text: 'Riwayat Transaksi',
                    style: tsBodyMediumSemibold(blackColor)),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.TRANSAKSI_PAGE);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AutoSizeText.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                          text: 'Lihat Semua',
                          style: tsBodySmallRegular(blackColor)),
                      maxLines: 2,
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: blackColor,
                      size: 12,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: height * 0.02),
          Obx(() {
            if (controller.isLoading.value) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: height * 0.02),
                      width: width,
                      height: height * 0.15,
                      decoration: BoxDecoration(
                        color: greyColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                ),
              );
            }
            return controller.showCurrentTransaksiModel.isEmpty
                ? Center(
                    child: CommonNoData(
                      title: 'Belum Ada Riwayat',
                      subTitle: 'Belum Ada Riwayat Transaksi',
                      image: 'assets/images/imgEmpty.svg',
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.showCurrentTransaksiModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TransactionHistory(
                        categoryController: controller
                            .showCurrentTransaksiModel[index].category,
                        amountController:
                            controller.showCurrentTransaksiModel[index].amount,
                        descController:
                            controller.showCurrentTransaksiModel[index].desc ??
                                'Tidak Ada',
                        dateController: DateFormat('dd MMMM yyyy', 'id_ID')
                            .format(DateTime.parse(controller
                                .showCurrentTransaksiModel[index].date
                                .toString())),
                      );
                    },
                  );
          }),
        ],
      ),
    );
  }
}
