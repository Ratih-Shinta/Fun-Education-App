import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/app/pages/laporan-page/widgets/date_card.dart';
import 'package:get/get.dart';

class LaporanPageComponentOne extends GetView<LaporanPageController> {
  const LaporanPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    List<DateTime> dates = controller.generateDates();

    return Container(
      height: 75,
      child: ListView.builder(
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (context, index) {
          DateTime date = dates[index];
          return DateCard(date: date);
        },
      ),
    );
  }
}
