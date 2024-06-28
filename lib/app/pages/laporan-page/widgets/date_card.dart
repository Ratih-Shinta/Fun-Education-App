import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateCard extends GetView<LaporanPageController> {
  final DateTime date;

  DateCard({required this.date});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.changeDate(date);
      },
      child: Obx(() {
        bool isSelected = controller.selectedDate.value == date;
        return Container(
          margin: EdgeInsets.only(right: 5),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? primaryColor : opacity10GreyColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText.rich(
                TextSpan(
                  text: DateFormat('d').format(date),
                  style:
                      tsBodyLargeSemibold(isSelected ? whiteColor : blackColor),
                ),
              ),
              SizedBox(height: 5),
              AutoSizeText.rich(
                TextSpan(
                  text: DateFormat('MMM').format(date),
                  style:
                      tsBodySmallRegular(isSelected ? whiteColor : greyColor),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
