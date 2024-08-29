import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_no_data.dart';
import 'package:fun_education_app/app/pages/transaksi-page/components/bottomsheet_pilih_bulan.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_controller.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/monthly_transactions.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class TransaksiComponentTwo extends GetView<TransaksiPageController> {
  const TransaksiComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Column(
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
            return Center(
              child: CircularProgressIndicator(),
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
                ),
              ),
            );
          } else {
            // return Text('data');
            return MonthlyTransactions();
          }
        }),
      ],
    );
  }
}
