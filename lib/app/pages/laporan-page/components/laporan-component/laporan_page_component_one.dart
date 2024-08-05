import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app/app/pages/laporan-page/laporan_page_controller.dart';
import 'package:fun_education_app/common/helper/themes.dart';
import 'package:get/get.dart';

class LaporanPageComponentOne extends GetView<LaporanPageController> {
  const LaporanPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Obx(
      () => EasyInfiniteDateTimeLine(
        showTimelineHeader: false,
        selectionMode: const SelectionMode.none(),
        firstDate: DateTime(DateTime.now().year, 1, 1),
        focusDate: controller.selectedDate.value,
        lastDate: DateTime(DateTime.now().year, 12, 31),
        onDateChange: (selectedDate) {
          controller.setSelectedDate(selectedDate);
        },
        dayProps: EasyDayProps(
          width: width / 6.5,
          height: height / 12,
        ),
        itemBuilder: (
          BuildContext context,
          DateTime date,
          bool isSelected,
          VoidCallback onTap,
        ) {
          return InkResponse(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  color: isSelected ? primaryColor : opacity10GreyColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(date.day.toString(),
                        style: tsBodyLargeSemibold(
                            isSelected ? whiteColor : blackColor)),
                  ),
                  Flexible(
                    child: Text(EasyDateFormatter.shortMonthName(date, "id_ID"),
                        style: tsBodySmallRegular(
                            isSelected ? whiteColor : greyColor)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Obx(
//           () => Text(
//             'Selected Date: ${controller.selectedDate.value.toString().substring(0, 10)}',
//             style: TextStyle(fontSize: 20),
//           ),
//         ),