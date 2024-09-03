import 'package:flutter/material.dart';
import 'package:fun_education_app/app/global-component/common_button.dart';
import 'package:fun_education_app/app/pages/profile-page/widgets/custom-radio-button_period.dart';
import 'package:fun_education_app/app/pages/transaksi-page/transaksi_page_controller.dart';
import 'package:fun_education_app/app/pages/transaksi-page/widgets/header_bottomsheet.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class BottomSheetPilihBulan extends GetView<TransaksiPageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return SizedBox(
      height: height * 0.84,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.03,
          horizontal: width * 0.05,
        ),
        child: Column(
          children: [
            HeaderBottomsheet(
                title: 'Pilih Bulan',
                subtitle: 'Pilih Untuk Melihat Riwayat Transaksi',
                color: primaryColor),
            SizedBox(height: height * 0.018),
            ListView.builder(
              shrinkWrap: true,
              itemCount: months.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => CustomRadioButtonPeriod(
                    title: months[index],
                    value: months[index],
                    groupValue: controller.selectedMonth.value,
                    onChanged: (value) async {
                      controller.setSelectedMonth(value);
                      await controller.showCurrentTransaksiByMonth();
                    },
                  ),
                );
              },
            ),
            // return Padding(
            //     padding: EdgeInsets.symmetric(vertical: height * 0.009),
            //     child: GestureDetector(
            //       onTap: () {
            //         controller.setSelectedMonth(months[index]);
            //         (months.length);
            //       },
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             months[index],
            //             style: tsBodyMediumSemibold(blackColor),
            //           ),
            //           Obx(() {
            //             return Icon(Icons.check_circle,
            //                 color: controller.selectedMonth.value ==
            //                         months[index]
            //                     ? successColor
            //                     : transparentColor);
            //           }),
            //         ],
            //       ),
            //     ));
            //   },
            // ),
            SizedBox(height: height * 0.045),
            CommonButton(
              // isLoading: controller.isLoading.value,
              text: 'Tutup',
              onPressed: () async {
                Navigator.pop(context);
              },
              backgroundColor: blackColor,
              textColor: whiteColor,
            )
          ],
        ),
      ),
    );
  }

  final List<String> months = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];
}
