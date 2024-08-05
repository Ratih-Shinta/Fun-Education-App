import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app/app/global-component/loading_overlay.dart';
import 'package:fun_education_app/app/pages/saving-page/saving_page_controller.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_controller.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/transaction_history.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:fun_education_app/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SavingPageComponentTwo extends GetView<SavingPageController> {
  SavingPageComponentTwo({super.key});
  final TransaksiPageController transaksiPageController =
      Get.put(TransaksiPageController());

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
                    style: tsBodyLargeSemibold(blackColor)),
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
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: transaksiPageController.showCurrentTransaksiModel.length,
            itemBuilder: (BuildContext context, int index) {
              return TransactionHistory(
                categoryController: transaksiPageController
                    .showCurrentTransaksiModel[index].category!,
                amountController: transaksiPageController
                    .showCurrentTransaksiModel[index].amount!,
                descController: transaksiPageController
                        .showCurrentTransaksiModel[index].desc ??
                    'Tidak Ada',
                dateController: DateFormat('dd MMMM yyyy', 'id_ID').format(
                    DateTime.parse(transaksiPageController
                        .showCurrentTransaksiModel[index].date
                        .toString())),
                // dateController: controller.formatDate(controller
                //         .showCurrentTransaksiModel[index].date
                //         .toString() ??
                //     "Unknown date"),
              );
            },
          ),
        ],
      ),
    );
  }
}
